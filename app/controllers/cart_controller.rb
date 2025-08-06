class CartController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @cart = session[:cart] || {}
    @products = Product.find(@cart.keys)
  end

  def add
    id = params[:id].to_s
    session[:cart] ||= {}
    session[:cart][id] ||= 0
    session[:cart][id] += 1
    redirect_to cart_path, notice: "Added to cart."
  end

  def remove
    id = params[:id].to_s
    session[:cart]&.delete(id)
    redirect_to cart_path, notice: "Removed from cart."
  end

  def update
    id = params[:id].to_s
    quantity = params[:quantity].to_i
    if quantity > 0
      session[:cart][id] = quantity
    else
      session[:cart].delete(id)
    end
    redirect_to cart_path
  end

  def update_quantities
    quantities = params[:quantities] || {}
    session[:cart] ||= {}

    quantities.each do |product_id, qty|
      qty = qty.to_i
      if qty > 0
        session[:cart][product_id.to_s] = qty
      else
        session[:cart].delete(product_id.to_s)
      end
    end

    redirect_to checkout_path, notice: "Cart quantities updated!"
  end

  def checkout
    @cart = session[:cart] || {}
    @products = Product.where(id: @cart.keys)

    @subtotal = @products.sum { |product| product.price * @cart[product.id.to_s].to_i }

    @selected_province = params[:province] || 'MB'
    tax_rates = { "MB" => 0.12, "ON" => 0.13, "BC" => 0.12, "AB" => 0.05, "SK" => 0.11 }
    @tax_rate = tax_rates[@selected_province] || 0.05

    @gst = (@subtotal * @tax_rate).round(2)
    @total = (@subtotal + @gst).round(2)

    @customer_order = CustomerOrder.new(province: @selected_province)
  end

  def submit_order
    @cart = session[:cart] || {}
    return redirect_to cart_path, alert: "Cart is empty!" if @cart.empty?

    @products = Product.find(@cart.keys)
    @subtotal = @products.sum { |product| product.price * @cart[product.id.to_s].to_i }

    @customer_order = CustomerOrder.new(customer_order_params)

    tax_rates = { "MB" => 0.12, "ON" => 0.13, "BC" => 0.12, "AB" => 0.05, "SK" => 0.11 }
    selected_province = @customer_order.province || "MB"
    @tax_rate = tax_rates[selected_province] || 0.05
    @gst = (@subtotal * @tax_rate).round(2)
    @total = (@subtotal + @gst).round(2)

    @customer_order.total_price = @total

    if @customer_order.save
      @products.each do |product|
        LineItem.create!(
          customer_order: @customer_order,
          product: product,
          quantity: @cart[product.id.to_s],
          price: product.price
        )
      end

      session[:cart] = {}
      redirect_to store_index_path, notice: "Order submitted successfully!"
    else
      render :checkout
    end
  end

  private

  def customer_order_params
    params.require(:customer_order).permit(:customer_name, :address, :province)
  end
end
