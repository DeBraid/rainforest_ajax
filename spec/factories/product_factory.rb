require 'factory_girl'

FactoryGirl.define do

  factory :product do
    name "Test Product"
    description "A description of this product"
    price_in_cents 1000
  end

end

