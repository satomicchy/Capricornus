class DeleteTravelexpenceColumnFromJournal < ActiveRecord::Migration
  def change
    remove_column :journals, :travel_expenses
  end
end
