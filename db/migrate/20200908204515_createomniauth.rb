class Createomniauth < ActiveRecord::Migration[6.0]
  def change
    create_table :omniauth do |t|
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret 
      t.string :name 
      t.timestamps null: false
    end 
  end 
end 