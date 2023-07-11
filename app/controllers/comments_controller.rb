class CommenttsController < ApplicationController  
  def new
    @comment = Comments::Entities::Comment.new
  end

  def create
    context = Comments::Operations::CreateComment.call(comment_params: create_comment_params)
    if context.comment.save
      redirect_to comments_path, notice: "Comment created successfully."
    else
      redirect_to new_comment_path, alert: "Failed to create comment."
    end
  end

  private
  def create_comment_params
    params[:comments_entities_comment].merge(account_id: @current_user.id, ticket_id: params[:ticket_id]).permit!
  end
end