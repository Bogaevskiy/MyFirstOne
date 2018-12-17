class CommentsController < ApplicationController
  
  def new_comment
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.photo_id = photo_url
    #@comment.content = params[:comment]
    @comment.save
    redirect_to photo_path(@photo)
  end

end
