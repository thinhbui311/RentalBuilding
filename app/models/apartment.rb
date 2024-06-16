class Apartment < ApplicationRecord
  belongs_to :building
  has_many :contact_forms

  has_many_attached :images

  enum rental_status: { available: 0, taken: 1 }
end
