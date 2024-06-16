class Address < ApplicationRecord
  geocoded_by :full_address

  belongs_to :addressable, polymorphic: true, optional: true

  after_validation :geocode, if: :address_changed?

  def short_address
    "#{street_number} #{street_name}"
  end

  def full_address
    [street_number, street_name, city, state, country, postal_code].compact.join(", ")
  end

  private

  def address_changed?
    country_changed? ||
      state_changed? ||
      city_changed? ||
      street_number_changed? ||
      street_name_changed? ||
      postal_code_changed?
  end
end
