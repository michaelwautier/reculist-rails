class CreateTaskTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :task_templates do |t|
      t.string :title
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.string :subtasks, :string, array: true, default: []

      t.timestamps
    end
  end
end
