class AddForeignKeysToTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :events, :users, column: :creator_id
    add_foreign_key :invitations, :events, column: :event_id
    add_foreign_key :invitations, :users, column: :attendee_id
  end
end
