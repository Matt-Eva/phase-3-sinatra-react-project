class CreateFlags < ActiveRecord::Migration[6.1]
  def change
    create_table :flags do |t|
      t.belongs_to :user
      t.belongs_to :creation
      t.string :value
      t.timestamps
    end
  end
end
