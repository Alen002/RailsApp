class StaticPagesController < ApplicationController

  def landing_page     #before i called it index
  @products = Product.limit(4)
  end

end
