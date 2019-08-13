class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.text :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
