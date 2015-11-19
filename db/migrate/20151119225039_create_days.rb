class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :budget
      t.integer :transactions_sum

      # days belong to user
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
