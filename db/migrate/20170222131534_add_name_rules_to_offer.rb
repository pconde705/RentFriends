class AddNameRulesToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :first_name, :string
    add_column :offers, :rules, :string
    add_column :offers, :age, :integer
    add_column :offers, :gender, :string
  end
end
