class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :priority
      t.date :deadline
      t.timestamps
    end
  end
end