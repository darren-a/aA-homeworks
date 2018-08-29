require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:pie) { Dessert.new("pie", 99, chef) }


  describe "#initialize" do

    it "sets a type" do
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(99)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      #expect { Dessert.new("cake", "lots", "Ramsay") }.to raise ArgumentError
      expect { Dessert.new("cake", "lots", "Ramsay") }.to raise_error
    end
  end



  describe "#add_ingredient" do
      it "adds an ingredient to the ingredients array" do
      expect(pie.ingredients).to_not include("sprouts")
      pie.add_ingredient("sprouts")
      expect(pie.ingredients).to include("sprouts")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["A", "B", "C", "D", "E"]
      ingredients.each do |food|
        pie.add_ingredient(food)
      end
      pie.mix!
      expect(pie.ingredients).to_not eql(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pie.eat(9)
      expect(pie.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pie.eat(200) }.to raise_error("who ate all the pies!")
    end

  end


  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(pie.serve).to eq("Boyarde has made 99 pies!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end

end
