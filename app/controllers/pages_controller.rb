class PagesController < ApplicationController  
  def landing
  	if user_signed_in?
  		redirect_to "/photos"
  	end
  end

  def about
  end

  def change_theme_1 
    current_user.update(theme: 1)
    redirect_to "/photos", notice: "Темная тема включена"       
  end  

  def change_theme_0 
    current_user.update(theme: 0)
    redirect_to "/photos", notice: "Светлая тема включена"       
  end 

  def search_results
  	@data = params[:search][:search_key]
  	@commit = params[:commit]  	
  	if params[:commit] == t('search.pic_search')
   		@photo = Photo.where('description LIKE ?', "%#{params[:search][:search_key]}%").order('created_at DESC')
   	elsif params[:commit] == t('search.user_search')
   		@user = User.where('name LIKE ?', "%#{params[:search][:search_key]}%").order('created_at DESC')

   	end
  end
end





