class ListingsController < ApplicationController

	def index
		@listing = Listing.all 
	end

	def show 
		@listing = Listing.find(params[:id])
	end


	def new
		@listing = Listing.new
		render template: "listings/new"

	end

	def create
		@listing = current_user.listings.new(listing_params)
		byebug
		@listing.dates = (params[:listing][:start_date]..params[:listing][:end_date]).map(&:to_s)
		if @listing.save
	      flash[:success] = "Thank you for your listing"
	      redirect_to @listing
	    else
	      render template: "listings/new"
	    end
	end



	private

	def listing_params
		params.require(:listing).permit(:user_id, :name, :address, :people, :amenities, :start_date, :end_date, :created_at, :updated_at)
	end



end
