class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :mentor_name

      t.timestamps
    end
  end
end
