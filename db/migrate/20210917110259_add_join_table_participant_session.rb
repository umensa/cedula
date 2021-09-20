class AddJoinTableParticipantSession < ActiveRecord::Migration[6.1]
  def change
    create_join_table :participants, :sessions do |t|
      t.index :session_id
      t.index :participant_id
    end
  end
end
