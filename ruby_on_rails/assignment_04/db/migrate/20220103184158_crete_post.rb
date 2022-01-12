class CretePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
    end
  end
end
