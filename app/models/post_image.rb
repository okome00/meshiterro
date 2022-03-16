class PostImage < ApplicationRecord
  # ActiveStorageの画像表示の宣言
  has_one_attached :image
  
  # Userモデルとのアソシエーション設定 N：1（useridの紐づけ）
  belongs_to :user
end
