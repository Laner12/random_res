class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :token
      t.string :id_token
      t.string :uid
      t.string :email
      t.string :image_path
      t.timestamps null: false
    end
  end
end
