class CreateTaglinks < ActiveRecord::Migration[6.1]
  def change
    create_table :taglinks do |t|
      t.belongs_to :tag
      t.belongs_to :creation
    end
  end
end
