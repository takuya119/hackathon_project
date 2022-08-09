class CreateFacilityReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :facility_replies do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.references :facility_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
