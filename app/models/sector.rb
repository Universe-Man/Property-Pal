class Sector < ApplicationRecord
  belongs_to :property, optional: true
  has_many :units
  has_many :tenants, through: :units
  validates :name, presence: true
  # validates :unit_id, presence: true
end
