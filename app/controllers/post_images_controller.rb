class PostImagesController < ApplicationController
  # 新規作成表示アクション
  def new
    @post_image = PostImage.new
  end

  # 投稿アクション
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  # 一覧表示アクション
  def index
    @post_images = PostImage.page(params[:page])
  end

  # 詳細表示アクション
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment
  end

  # 編集表示アクション
  def edit
  end

  # 投稿削除アクション
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  # 画像投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end

