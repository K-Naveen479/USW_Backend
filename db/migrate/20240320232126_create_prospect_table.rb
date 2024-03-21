class CreateProspectTable < ActiveRecord::Migration[7.1]
  def change
    create_table :prospects do |t|
      t.string :full_name
      t.string :email
      t.date :date_of_birth
      t.string :subject_area
      t.boolean :marketing_updates
      t.boolean :correspondence_in_welsh
      t.string :gps_location

      t.timestamps
    end
  end
end
