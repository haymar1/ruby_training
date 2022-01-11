class CreatePost < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :public_flag
      t.datetime :created_at
      t.datetime :updated_at
      t.string :user_name
    end
  end
end
