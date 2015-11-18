class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount

      # transactions belong to user
      t.belongs_to :user
      
      t.timestamps null: false
    end
  end
end
