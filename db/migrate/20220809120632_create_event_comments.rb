class CreateEventComments < ActiveRecord::Migration[7.0]
  def change
    create_table :event_comments do |t|
      t.string :name
      t.text :content
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
