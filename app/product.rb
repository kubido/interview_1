require_relative 'float'
class Product
  TAX_RATE = 0.1 #equal to 10%
  IMPORT_TAX_RATE = 0.05 #equal to 5%

  attr_accessor :name, :price, :quantity, :tax_cost, :import_cost, :sub_total

  def initialize(opt={})
    @name     = opt[:name]
    @price    = opt[:price]
    @quantity = opt[:quantity]    
  end

  def calculate!
    calculate_tax unless tax_free_product?
    calculate_import if import_product?
    calculate_total
  end


  def calculate_tax
    tax_cost = @price * TAX_RATE 
    self.tax_cost = tax_cost.round_to(2)
  end

  def calculate_import
    import_cost = @price * IMPORT_TAX_RATE 
    self.import_cost = import_cost.round_to(2)
  end
  
  def calculate_total
    sub_total = price.to_f + tax_cost.to_f + import_cost.to_f
    self.sub_total = sub_total.round_to(2)
  end

  private  

  def tax_free_product?
    contain_free_tax = free_tax_goods.map{|free_tax| @name.downcase.include?(free_tax)}
    contain_free_tax.any?
  end

  def import_product?
    @name.include?("imported")
  end

  def free_tax_goods
    %w(chocolate pills book)    
  end

end