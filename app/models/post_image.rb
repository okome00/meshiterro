class PostImage < ApplicationRecord
  # Userモデルとのアソシエーション設定 N：1（postimageidの紐付け）
  belongs_to :user
  # PostCommentモデルとのアソシエーション設定 1：N（postimageidの紐付け）
  has_many :post_comments, dependent: :destroy
  # Fovoriteモデルとのアソシエーション設定 1：N（postimageidの紐付け）
  has_many :favorites, dependent: :destroy

  # ActiveStorageを使い画像を投稿できるように設定
  has_one_attached :image
  
  # バリデーション設定
  validates :shop_name, presence: true
  validates :image, presence: true

  # 引数で渡されたユーザーidがFavoriteテーブル内に存在するかの確認
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 画像が投稿されていない場合のエラー回避
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
