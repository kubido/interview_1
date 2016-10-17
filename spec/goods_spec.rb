require 'spec_helper'

describe "Tax Calculator" do


  it "Should display correct calulations for: Input 1" do
    goods = [
      {quantity: 1, price: 12.49,  name: "book"},
      {quantity: 1, price: 14.99,  name: "music cd"},
      {quantity: 1, price: 0.85,   name: "chocolate bar"}
    ]
    calculator_1  = TaxCalculator.new(goods)
    total_price_1 = calculator_1.calculate_goods.map{ |g| [g.name, g.tax_cost, g.sub_total] }

    expect(total_price_1).to eq([
      ["book", nil, 12.49], 
      ["music cd", 1.5, 16.49], 
      ["chocolate bar", nil, 0.85]
    ])
  end


  it "Should display correct calulations for: Input 2" do
    goods = [
      {quantity: 1, price: 10.00,  name: "imported box of chocolates"},
      {quantity: 1, price: 47.50,  name: "imported bottle of perfume"}
    ]
    calculator_2  = TaxCalculator.new(goods)
    total_price_2 = calculator_2.calculate_goods.map{ |g| [g.name, g.tax_cost, g.sub_total] }

    expect(total_price_2).to eq([
      ["imported box of chocolates", nil, 10.50], 
      ["imported bottle of perfume", 4.75, 54.65]
    ])
  end


  it "Should display correct calulations for: Input 3" do
    goods = [
      {quantity: 1, price: 27.99,  name: "imported bottle of perfume"},
      {quantity: 1, price: 18.99,  name: "bottle of perfume"},
      {quantity: 1, price: 9.75,   name: "packet of headache pills"},
      {quantity: 1, price: 11.25,  name: "imported box of chocolates"}
    ]
    calculator_3  = TaxCalculator.new(goods)
    total_price_3 = calculator_3.calculate_goods.map{ |g| [g.name, g.tax_cost, g.sub_total] }

    expect(total_price_3).to eq([
      ["imported bottle of perfume", 2.8, 32.19],
      ["bottle of perfume", 1.9, 20.89],
      ["packet of headache pills", nil, 9.75],
      ["imported box of chocolates", nil, 11.85]
    ])
  end


end

