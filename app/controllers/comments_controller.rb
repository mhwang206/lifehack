class CommentsController < ApplicationController
	def show
	  @comment = Comment.find(params[:id])
	end

	def edit
	  @comment = Comment.find(params[:id])
	end

	def new
	  @hack = current_user.hacks.build
	end

	def create
	  @comment = current_user.comments.build(comment_params)
	  if @comment.save
	    redirect_to @comment.hack, notice: 'Comment was successfully created.'
	  else
	    render action: 'new'
	  end
	end

	def destroy
	  Comment.find(params[:id]).destroy
	  redirect_to comments_url
	end

  private
    def comment_params
      params.require(:comment).permit(:comment, :hack_id)
    end
end




