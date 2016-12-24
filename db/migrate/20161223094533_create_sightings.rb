class CreateSightings < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :comments

      t.timestamps
    end
  end
end
