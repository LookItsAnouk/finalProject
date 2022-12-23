class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post

    def create
        @comment = Comment.new(comment_params)
        @comment.post = @post
        @comment.user = current_user
        if @comment.save
            flash[:success] = "Comment successfully created"
            redirect_to post_path(@post)
        else
            @comments = @post.comments.order(created_at: :desc)
            render '/posts/show'
        end
    end

    def destroy
        @comment = Comment.find params[:id]
        if can?(:crud, @comment)
            @comment.destroy
            redirect_to post_path(@post)
            flash[:success] = "Comment deleted"
        elsif can?(:crud, @post)
        @comment.destroy
        redirect_to post_path(@post)
        flash[:success] = "Comment deleted"
        else   
            redirect_to post_path, alert: "Not athorized to change Comment!"
        end
    end

    private
    def find_post
        @post = Post.find params[:post_id]
    end
    
    def comment_params
        params.require(:comment).permit(:body)
    end
end
