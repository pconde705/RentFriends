class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
