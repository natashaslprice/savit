class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :net_wages
      t.integer :rent_mortgage
      t.integer :car
      t.integer :public_transportation
      t.integer :insurance
      t.integer :utilities
      t.integer :internet
      t.integer :cell_phone
      t.integer :gym
      t.integer :charity_donations
      t.integer :student_loan
      t.integer :credit_card
      t.integer :other_expenses
      t.string :other_string
      t.integer :savings
     

      # belongs to user
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
