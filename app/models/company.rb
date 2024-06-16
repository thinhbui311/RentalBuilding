class Company < ApplicationRecord
  has_many :buildings
  has_many :addresses, as: :addressable
end
