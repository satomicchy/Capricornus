class ChangeWorktimeColumnOfJournal < ActiveRecord::Migration
  def change
    remove_column :journals, :work_on

    add_column :journals, :start_at, :datetime
    add_column :journals, :finish_at, :datetime
  end
end
