class PostsController < ApplicationController
  skip_before_action :authenticate_user!, except: :new

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @organisation = Organisation.find(params[:organisation_id])
  end

  def new
    @organisation = Organisation.find(params[:organisation_id])
    @post = Post.new
  end

  def create
    @organisation = Organisation.find(params[:organisation_id])
    @post = Post.new(post_params)
    @post.organisation = @organisation
    # @post.user = current_user
    if @post.save
      redirect_to organisation_path(@organisation), notice: "New post created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @organisation = Organisation.find(params[:organisation_id])
    @post = Post.find(params[:id])
    # @post.organisation = @organisation
  end

  def update
    # @organisation = Organisation.find(params[:organisation_id])
    @post = Post.find(params[:id])
    # @post.organisation = @organisation
    @post.update(post_params)

    if @post.save
      redirect_to organisation_post_path(@post.organisation, @post), notice: "Update the post"
    else
      render :new, status: :unprocessable_entity
    end
    # redirect_to organisation_post_path(@organisation, post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end
end
