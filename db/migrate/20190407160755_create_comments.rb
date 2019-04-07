class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
