# Rifki Fauzi
# kubido@gmail.com
# interview questions
require './app/tax_calculator'

# CASE 1
goods = [
          {quantity: 1, price: 12.49,  name: "book"},
          {quantity: 1, price: 14.99,  name: "music cd"},
          {quantity: 1, price: 0.85,   name: "chocolate bar"}
        ]
calculator = TaxCalculator.new(goods)
table = calculator.print_receipts
puts table.render


# CASE 2
goods = [
          {quantity: 1, price: 10.00,  name: "imported box of chocolates"},
          {quantity: 1, price: 47.50,  name: "imported bottle of perfume"}
        ]
calculator = TaxCalculator.new(goods)
table = calculator.print_receipts
puts table.render


#CASE 3
goods = [
          {quantity: 1, price: 27.99,  name: "imported bottle of perfume"},
          {quantity: 1, price: 18.99,  name: "bottle of perfume"},
          {quantity: 1, price: 9.75,   name: "packet of headache pills"},
          {quantity: 1, price: 11.25,  name: "imported box of chocolates"}
        ]

calculator = TaxCalculator.new(goods)
table = calculator.print_receipts
puts table.render      