class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
