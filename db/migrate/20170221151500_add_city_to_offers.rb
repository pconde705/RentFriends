class AddCityToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :city, :string
  end
end
