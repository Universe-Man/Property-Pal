class Unit < ApplicationRecord
  belongs_to :sector
  has_one :tenant
  #OR has_many :tenants????
  validates :name, presence: true
  validates :tenant_id, presence: true, uniqueness: true
end
