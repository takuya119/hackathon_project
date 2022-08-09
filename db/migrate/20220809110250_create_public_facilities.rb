class CreatePublicFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :public_facilities do |t|
      t.string :name
      t.string :address
      t.string :longitude
      t.string :latitude
      t.string :category
      t.string :reserve_url
      t.references :municipality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
