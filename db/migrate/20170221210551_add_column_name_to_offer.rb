class AddColumnNameToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :title, :string
  end
end
