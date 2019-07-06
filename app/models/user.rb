class User < ApplicationRecord
  attr_accessor :password

  # Validations
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, presence: true, uniqueness: true, length: { :in => 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, presence: true, confirmation: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create

  # Encrypt passwords
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
end
