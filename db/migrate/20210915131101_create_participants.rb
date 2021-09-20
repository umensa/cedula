class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :participant_name
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
