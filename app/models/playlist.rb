class Playlist < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :songs

  validates :name, presence: true

end
