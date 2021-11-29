require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(name: 'Sample name task', details: 'task details', scheduled_at: Time.new.strftime("%Y-%m-%d %H:%I:%S")),
      Task.create!(name: 'Sample name task', details: 'task details', scheduled_at: Time.new.strftime("%Y-%m-%d %H:%I:%S"))
    ])
  end

  it "renders a list of tasks" do
    render
  end
end
