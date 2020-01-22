class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.text :adress
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :packages, [:user_id, :created_at]
  end
end
