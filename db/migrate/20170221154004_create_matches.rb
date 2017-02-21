class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
