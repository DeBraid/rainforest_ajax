class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price_in_cents
end