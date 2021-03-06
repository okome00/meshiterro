class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # PostImageモデルとのアソシエーション設定 1：N（useridの紐付け）
  has_many :post_images, dependent: :destroy
  # PostCommentモデルとのアソシエーション設定 1：N（useridの紐付け）
  has_many :post_comments, dependent: :destroy
  # Fovoriteモデルとのアソシエーション設定 1：N（useridの紐付け）
  has_many :favorites, dependent: :destroy

  # ActiveStorageを使いプロフィール画像を保存できるように設定
  has_one_attached :profile_image

  # プロフィール画像が投稿されていない場合のエラー回避（画像サイズの変換処理）
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
