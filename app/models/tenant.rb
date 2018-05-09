class Tenant < ApplicationRecord
  has_secure_password
  belongs_to :unit, optional: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def fullname
    self.first_name + " " + self.last_name
  end
end
