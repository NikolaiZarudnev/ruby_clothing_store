class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
# name:"admin" password:"$2a$12$UQWzsvqvhK0sL5MJYPGXw.zxLW19/qd8ekGWUE638NX1IiEKRBi.G"
