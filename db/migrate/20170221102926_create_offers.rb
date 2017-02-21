class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
