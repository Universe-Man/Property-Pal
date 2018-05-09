class Unit < ApplicationRecord
  belongs_to :sector, optional: true
  has_many :tenants

  validates :name, presence: true
  validates :sector_id, presence: true, uniqueness: true

  def prop_sect_unit
    if !self.sector.nil? && !self.sector.property.nil?
      self.sector.property.name + " | " + self.sector.name + " | " +  self.name
    else
      self.name
    end
  end
end
