class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :details
      t.datetime :scheduled_at
      t.belongs_to :category, foreign_key: true
      t.timestamps
    end
  end
end
