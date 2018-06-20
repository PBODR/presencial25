class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
   @sale = Sale.new(sale_params)
   @sale.total = @sale.value - (@sale.value/100*@sale.discount)
   if @sale.tax == false
     @sale.total *= 1.19
     @sale.tax = 19
   else
     @sale.tax = 0
   end
   @sale.save
   redirect_to sales_done_path #esta OK
  end


  def done
    @sales = Sale.all
  end

  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end
end
