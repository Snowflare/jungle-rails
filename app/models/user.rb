class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true
  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    User.find_by(email: email).try(:authenticate, password)
  end
end
