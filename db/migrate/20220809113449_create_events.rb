class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.text :detail
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.references :public_facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
