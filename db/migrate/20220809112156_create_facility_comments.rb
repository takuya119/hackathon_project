class CreateFacilityComments < ActiveRecord::Migration[7.0]
  def change
    create_table :facility_comments do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :comment_type, null: false, default: 0
      t.references :public_facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
