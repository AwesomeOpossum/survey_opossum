class Author < ActiveRecord::Base
  has_many :surveys
  has_secure_password
end
