require 'terminal-table'
require_relative 'product'

class TaxCalculator

  attr_accessor :goods, :title

  def initialize(goods)
    @goods = goods
  end

  def print_receipts
    rows = []  
    calculate_goods.each do |product|
      rows << [product.name, product.price, product.quantity, product.tax_cost, product.import_cost, product.sub_total]
    end
    return print_table(rows)
  end

  def print_table(rows)
    table = Terminal::Table.new(headings: ["Name", "Price", "Quantity", "Tax cost", "Import cost", "Sub Total"], rows: rows) do |t|
      t.add_separator
      t.add_row [nil, nil, nil, total_for(:tax_cost), total_for(:import_cost), total_for(:sub_total)]
    end
  end

  def calculate_goods
    calculated_goods = []
    goods.each do |product|
      calculated_goods << calculate_product_price(product)
    end
    return calculated_goods
  end
  
  private

  def total_for(attr_name)
    ary = calculate_goods.map{|g| g.send(attr_name).to_f}
    ary.compact
    ary.inject(:+).round(2)
  end

  def calculate_product_price(product)
    product = Product.new(product)
    product.calculate!
    return product
  end

end