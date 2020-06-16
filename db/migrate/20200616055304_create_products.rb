class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :subtype
      t.decimal :price
      t.integer :quantity
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
