class CreateHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :headers do |t|
      t.string :content
      t.string :tag
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
