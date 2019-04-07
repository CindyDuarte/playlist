class CreateJoinTableSongsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :songs, :users do |t|
      t.references :song, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
