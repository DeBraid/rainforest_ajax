require "spec_helper"

describe Product do 

  let(:product) { FactoryGirl.build(:product)}

  describe "validations" do
    it "should have a valid factory" do 
      product.should be_valid
    end

    it "should validate presence of name" do
      product.name = nil
      product.should_not be_valid
    end

    it "should validate presence of description" do
      product.description = nil
      product.should_not be_valid
    end

    it "should validate numericality of price in cents" do
      product.price_in_cents = "abc"
      product.should_not be_valid
      product.price_in_cents = [1,2,3]
      product.should_not be_valid
    end
  end

  describe "#formatted_price" do
    it "should return the price in cents as dollars with 2 decimal places" do
      product.save
      product.formatted_price.should == "$10.00"
    end
  end

end