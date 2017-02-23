class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :title
      t.string :description
      t.string :rules
      t.references :owner, index: true

      t.timestamps
    end
    add_foreign_key :offers, :users, column: :owner_id
  end
end
