class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :description, presence: true
end
