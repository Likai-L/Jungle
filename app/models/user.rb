class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  def self.authenticate_with_credentials(email, password)
    @user = User.where('lower(email) = ?', email.strip.downcase).first
    return @user if @user && @user.authenticate(password)

    nil
  end
end
