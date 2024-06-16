class Building < ApplicationRecord
  belongs_to :company
  has_many :apartments
  has_many :addresses, as: :addressable
  has_many :building_policies
  has_many :policies, through: :building_policies

  has_many_attached :images
end
