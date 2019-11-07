require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Bobby", :titleize => "Chef Bobby the Great Baker" ) }
  subject(:brownie) { Dessert.new("brownie", 12, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "tons") }.to raise_error{ArgumentError}
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to_not include("cocoa")
      brownie.add_ingredient("cocoa")
      expect(brownie.ingredients).to include("cocoa")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["butter", "sugar", "eggs", "vanilla extract", "chocolate chips", "flour", "salt"]

      ingredients.each {|item| brownie.add_ingredient(item) }

      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).to_not eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(12)
      brownie.eat(1)
      expect(brownie.quantity).to eq(11)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(13)}.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(brownie.serve).to eq("Chef Bobby the Great Baker has made 12 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
