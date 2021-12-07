class CreateLibItems < ActiveRecord::Migration[6.1]
  def change
    create_table :lib_items do |t|
      t.belongs_to :user
      t.belongs_to :creation
    end
  end
end
