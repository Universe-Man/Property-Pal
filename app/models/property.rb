class Property < ApplicationRecord
  belongs_to :admin, optional: true
  has_many :sectors
  has_many :units, through: :sectors
  validates :name, presence: true

  # validates :address_id, presence: true
  # validates :sector_id, presence: true
  # validates :unit_id, presence: true

  # def admin_name
  #   Admin.find(self.admin_id).fullname
  # end

end
