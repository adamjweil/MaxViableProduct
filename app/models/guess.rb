class Guess < ApplicationRecord
  # Remember to create a migration!
  belongs_to :game
  belongs_to :card
end
