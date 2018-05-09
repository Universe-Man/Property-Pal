class Property < ApplicationRecord
  belongs_to :admin, optional: true
  has_many :sectors
  has_many :units, through: :sectors
  validates :name, presence: true
  validates :admin_id, presence: true
end
