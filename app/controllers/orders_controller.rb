class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:name, :email, :address, :total)
    end

end
