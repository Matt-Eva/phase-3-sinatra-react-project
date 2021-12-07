class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.belongs_to :user
      t.belongs_to :creation
      t.float :amount
      t.timestamps
    end
  end
end
