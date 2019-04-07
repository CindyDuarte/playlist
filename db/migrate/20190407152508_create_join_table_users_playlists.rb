class CreateJoinTableUsersPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :playlists do |t|
      t.references :user, foreign_key: true
      t.references :playlist, foreign_key: true
    end
  end
end
