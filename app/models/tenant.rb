class Tenant < ApplicationRecord
  has_secure_password
  belongs_to :unit, optional: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def fullname
    self.first_name + " " + self.last_name
  end

  def verify_unit
    if self.unit_id.nil?
      self[:unit_id] = Unit.all.sample.id
      save
    end
  end

  def sector
    self.verify_unit
    Sector.try(:find, self.unit.sector_id)
  end

  def property
    self.verify_unit
    Property.try(:find, self.unit.sector.property_id)
  end
end
