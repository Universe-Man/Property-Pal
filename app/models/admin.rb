class Admin < ApplicationRecord
  has_many :properties
  has_many :sectors, through: :properties
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :address_id, presence: true
  validates :contract_id, presence: true
  validates :property_id, presence: true
end
