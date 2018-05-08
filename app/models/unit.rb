class Unit < ApplicationRecord
  belongs_to :sector, optional: true
  has_many :tenants

  validates :name, presence: true
  # validates :tenant_id, presence: true, uniqueness: true

  # def admin

  # end
end
