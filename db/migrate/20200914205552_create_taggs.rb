class CreateTaggs < ActiveRecord::Migration[6.0]
  def change
    create_table :taggs do |t|
      t.references :post
      t.references :tag
      t.timestamps null: false 
    end
  end
end
