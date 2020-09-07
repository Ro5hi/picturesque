class AddPhotoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photo, :string
    add_column :users, :description, :text
  end
end
