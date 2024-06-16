class Policy < ApplicationRecord
  has_many :building_policies
  has_many :buildings, through: :building_policies

  enum policy_type: { general_policy: 0, additional_info: 1 }
end
