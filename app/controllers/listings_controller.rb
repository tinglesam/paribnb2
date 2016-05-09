class ListingsController < ApplicationController

def index
@listing = Listing.all 
end

 def show 
  	@listing = Lisitng.find(params[:id])

  end


end
