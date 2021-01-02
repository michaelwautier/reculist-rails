class ChangeDefaultValueForCompletedSubtasks < ActiveRecord::Migration[6.0]
  def change
    change_column_default :subtasks, :completed, false
  end
end
