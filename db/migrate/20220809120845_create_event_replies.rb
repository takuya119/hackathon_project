class CreateEventReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :event_replies do |t|
      t.string :name
      t.text :content
      t.references :event_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
