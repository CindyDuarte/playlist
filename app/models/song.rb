class Song < ApplicationRecord
  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :users
  has_many :comments

  validates :name, presence: true
  validates :url, presence: true
  
end
