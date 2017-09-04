class Deck < ApplicationRecord
  # Remember to create a migration!
  has_many :cards
  # belongs_to :creator, class_name: :user
  has_many :games
end
