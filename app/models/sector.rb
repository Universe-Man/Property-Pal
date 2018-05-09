class Sector < ApplicationRecord
  belongs_to :property, optional: true
  has_many :units
  has_many :tenants, through: :units
  validates :name, presence: true
  validates :property_id, presence: true

  # validates :unit_id, presence: true

  def prop_and_sector
    if !self.property.nil?
      self.property.name + " | " + self.name
    else
      self.name
    end
  end
end
