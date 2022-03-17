class PostImage < ApplicationRecord
  # ActiveStorageの画像表示の宣言
  has_one_attached :image

  # Userモデルとのアソシエーション設定 N：1（useridの紐づけ）
  belongs_to :user

  # ActiveStorageを使い画像を投稿できるように設定
  # 画像が投稿されていない場合のエラー回避
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
