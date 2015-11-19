class AddSavingsUpdatedToBudgets < ActiveRecord::Migration
  def change
  	add_column :budgets, :savings_update, :datetime
  end
end
