class HomeController < ApplicationController
  def index
  	@products = Product.all

  	respond_to do |format|
  	  format.html
  	  format.json { head :no_content }
  	end
  end
end
