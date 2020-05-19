class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :country
      t.text :instruments , array: true, default: []
      t.text :genres , array: true, default: []

      t.timestamps
    end
  end
end
