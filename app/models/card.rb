class Card < ApplicationRecord
  # Remember to create a migration!
  belongs_to :deck


  @is_correct = false

  def is_correct?
    @is_correct
  end
  def correct
    @is_correct = true
  end
  def wrong
    @is_correct = false
  end

  has_many :guesses


end
