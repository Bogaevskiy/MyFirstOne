class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :new_comment, :like, :unlike]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owner, only: [:edit, :update, :destroy]
 
  def like
    if user_signed_in?
      @like = current_user.likes.build
      @like.liked_id = @photo.id
      @like.user_id = current_user.id
      @like.save
        if @like.save
          redirect_to photo_path(@photo)
        end
    else
     redirect_to photo_path(@photo), notice: "Вы не можете выражать мнение" 
    end
  end

  def unlike
    if user_signed_in?
      @like = current_user.likes.find_by_liked_id(@photo.id)
      @like.destroy
      redirect_to photo_path(@photo)
    end
  end


  def new_comment
    if user_signed_in?
      @comment = @photo.comments.build
      @comment.author_name = current_user.name
      @comment.user_id = current_user.id
      @comment.photo_id = @photo.id
      @comment.content = params[:comment][:content]
      @comment.save
      redirect_to photo_path(@photo)
    else
      redirect_to photo_path(@photo), notice: "Вы не можете оставлять комментарии"
    end
  end




  def index
    @photos = Photo.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 6)

  end

  
  def show
    @local_comments = Comment.where(photo_id: @photo.id)
  end

 
  def new
    @photo = current_user.photos.build
  end

  
  def edit
  end

  def create
    @photo = current_user.photos.build(photo_params)
      if @photo.save
        redirect_to @photo, notice: 'Photo was successfully created.'
      else
        render :new    
      end
  end

  
  def update    
      if @photo.update(photo_params)
        redirect_to @photo, notice: 'Photo was successfully updated.' 
      else
        render :edit     
      end    
  end

  #
  def destroy
    @photo.destroy
     redirect_to photos_url, notice: 'Photo was successfully destroyed.'   
  end

  private
    
    def owner
      @photo = current_user.photos.find_by(id: params[:id])
      redirect_to photos_path, notice: 'Это не ваша фотография' if @photo.nil?
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end

    
    def photo_params
      params.require(:photo).permit(:description, :image)
    end
  end

