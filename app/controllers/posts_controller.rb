class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      live_name: params[:live_name],
      day: params[:day],
      time: params[:time],
      place: params[:place],
      money: params[:money],
      content: params[:content],
      contact: params[:contact],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find_by(id: params[:id])

  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.live_name = params[:live_name]
    @post.day = params[:day]
    @post.time = params[:time]
    @post.place = params[:place]
    @post.money = params[:money]
    @post.contact = params[:contact]
    if @post.save
      flash[:notice] = "保存しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
      flash[:notice] = "削除しました"
      redirect_to("/posts/index")
  end
end
