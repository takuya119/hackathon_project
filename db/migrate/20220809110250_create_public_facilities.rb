class CreatePublicFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :public_facilities do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :longitude, null: false
      t.string :latitude, null: false
      t.string :category, null: false
      t.string :reserve_url
      t.references :municipality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
