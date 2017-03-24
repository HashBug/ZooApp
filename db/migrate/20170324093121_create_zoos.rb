class CreateZoos < ActiveRecord::Migration[5.0]
  def change
    create_table :zoos do |t|
      t.string :name
      t.string :city
      t.integer :zipcode
      t.boolean :publish, default: 1

      t.timestamps
    end
  end
end
