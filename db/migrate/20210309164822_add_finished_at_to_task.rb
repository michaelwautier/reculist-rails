class AddFinishedAtToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :finished_at, :datetime
  end
end
