class PostComment < ApplicationRecord
  # Userモデルとのアソシエーション設定 N：1（useridの紐付け）
  belongs_to :user

  # PostImageモデルとのアソシエーション設定 N：1（postimageidの紐付け）
  belongs_to :post_image
end
