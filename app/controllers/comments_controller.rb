class CommentsController < ApplicationController


  def create
    @member = Member.find(params[:member_id])
    @comment = @member.comments.create(comment_params)
    redirect_to member_path(@member)
  end

  def destroy
    @member = Member.find(params[:member_id])
    @comment = @member.comments.find(params[:id])
    @comment.destroy
    redirect_to member_path(@member)
  end


  private

  def comment_params
    params.require(:comment).permit(:title,:message)
  end
end
