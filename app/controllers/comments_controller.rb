class CommentsController < ApplicationController
	def index
	  @comments = Comment.all
	end

	def show
	  # @comment = Comment.find(params[:id])
	end

	def new
	  @comment =  current_user.comments.build
	end

	def edit
	  @comment = Comment.find(params[:id])
	end

	def create
	  @comment = current_user.comments.build(comment_params)
	  if @comment.save
	    redirect_to action: 'index', notice: 'Comment was successfully created.'
	  else
	    render action: 'new'
	  end
	end


  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end




