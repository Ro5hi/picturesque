class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.boolean :searchable
      t.timestamps null: false 
    end
  end
end