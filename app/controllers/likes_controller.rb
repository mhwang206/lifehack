class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(:hack_id => params[:hack_id])
    if @like.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end
  
  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    flash[:notice] = "Removed like."
    redirect_to current_user
  end
end
