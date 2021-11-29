require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:category) {Category.create(name: 'cat1')}
  let(:task) {Task.create(category: :category, name: 'Sample name task', details: 'task details', scheduled_at: Time.new.strftime("%Y-%m-%d %H:%I:%S"))}

  context 'Validations' do
    it "Is not valid without a name" do
      task.name = nil

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:name)
    end

    it "Is not valid without details" do
      task.details = nil

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:details)
    end

    it "Is not valid without schedule" do
      task.scheduled_at = nil

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:details)
    end

    it 'Is not valid with characters more than 20' do
      task.name = 'abcdefghijklmnopqrstu'

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:name)
    end

    it 'Is not valid with characters more than 40' do
      task.details = 'abcdefghijklmnopqrstabcdefghijklmnopqrstu'

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:details)
    end

    it "Is not valid when name is not unique" do
      task_name_duplicate = Task.create(name: 'Sample name task')

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:name)
    end

    it "Is not valid without a category" do
      task.category = nil

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:name)
    end
  end

  context 'Associations' do
    it 'belongs to category' do
      expect(task.reflect_on_association(:category).macro).to eq(:belongs_to)
    end
  end
end
