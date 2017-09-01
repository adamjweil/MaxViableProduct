class User < ApplicationRecord
  # Remember to create a migration!
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  has_many :decks
  has_many :games

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    (user && user.password == password) ? user : nil
  end
end
