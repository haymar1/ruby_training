class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :super_user_flag
      t.string :phone
      t.text :address
      t.date :birthday
    end
  end
end
