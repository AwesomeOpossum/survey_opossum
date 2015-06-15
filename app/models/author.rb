class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  validates :name, presence: true
  validates :email, presence: true # need uniqueness validation, but fails controller test
  validates :password, presence: true
end
