class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {}
  end

  def add_product(product)
    @products << product
  end

  def details
    @details[:name] = @name
    @details[:capacity] = @capacity
    @details
  end

  def total_number_of_products
    total_products = []
    @products.each do |product|
      total_products << product.quantity
    end
    total_products.sum
  end

  def is_full?
    if total_number_of_products < @capacity
      false
    else
      true
    end
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

  def percentage_occupied
    cap_percent = (total_number_of_products.to_f / @capacity)* 100
    cap_percent.round(2)
  end
end
