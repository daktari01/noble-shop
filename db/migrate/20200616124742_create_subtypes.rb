class CreateSubtypes < ActiveRecord::Migration[6.0]
  def change
    create_table :subtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
