class Admin < ApplicationRecord
  has_secure_password
  has_many :properties
  has_many :sectors, through: :properties
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

#Helper method to return the full name of an admin
  def fullname
    self.first_name + " " + self.last_name
  end
end
