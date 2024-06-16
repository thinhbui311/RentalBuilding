# Helper method to create an address
def create_address(addressable)
  addressable.addresses.create!(
    street_number: Faker::Address.building_number,
    street_name: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    country: Faker::Address.country,
    postal_code: Faker::Address.zip
  )
end

# Helper method to attach images to an Active Storage record
def attach_images(record, dir, image_number)
  extension = dir == "apartment" ? "png" : "jpg"
  filename = "#{dir}_#{image_number}.#{extension}"
  record.images.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "#{dir}s", filename)),
    filename: filename,
    content_type: "image/#{extension}"
  )
end

# Create companies
companies = 5.times.map do
  company = Company.create!(
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.phone_number,
    website: Faker::Internet.url
  )

  create_address(company)
end

# Create policies
policies = 5.times.map do
  Policy.create!(
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    policy_type: rand(0..1)
  )
end

# Create buildings and apartments
10.times do |i|
  building = Building.create!(
    name: Faker::FunnyName.name,
    description: Faker::Lorem.paragraph,
    company_id: Company.order("RANDOM()").take.id
  )

  # Create an address for each building
  create_address(building)
  # Attach images to building
  attach_images(building, "building", i + 1)

  # Assign random policies to the building
  policies.sample(2).each do |policy|
    BuildingPolicy.create!(building: building, policy: policy)
  end

  # Create 6 apartments for each building
  6.times do |i|
    apartment = Apartment.create!(
      ref_number: Faker::Alphanumeric.alphanumeric(number: 3, min_alpha: 1, min_numeric: 1).upcase,
      price: Faker::Commerce.price(range: 500..2000),
      bedroom_number: rand(1..3),
      bathroom_number: rand(1..2),
      rental_status: rand(0..1),
      building: building
    )

    # Attach images to apartment
    attach_images(apartment, "apartment", i + 1)
  end

  # Create a real sample address for showing map purpose
  Address.create!(
    street_number: 260,
    street_name: "Doi Can",
    city: "Ha Noi",
    country: "Vietnam"
  )
end
