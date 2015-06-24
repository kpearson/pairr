class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string :uid
      t.string :provider
      t.string :image_url
      t.string :token

      t.timestamps null: false
    end
  end
end
