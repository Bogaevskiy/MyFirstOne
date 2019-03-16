class PagesController < ApplicationController
  def landing
  	if user_signed_in?
  		redirect_to "/photos"
  	end
  end

  def about
  end

  def search_results
  	@data = params[:search][:search_key]
  	@commit = params[:commit]
  	
  	if params[:commit] == "ИСКАТЬ ПИКЧУ"
   		@photo = Photo.where('description LIKE ?', "%#{params[:search][:search_key]}%")
   	elsif params[:commit] == "ИСКАТЬ ЮЗВЕРЯ"
   		@user = User.where('name LIKE ?', "%#{params[:search][:search_key]}%")

   	end
  end
end





