class StoreReview < ApplicationRecord
  validate :error_check
  validates :review_image, presence: true

  has_many :store_comments,dependent: :destroy

  belongs_to :category,optional: false
  # belongs_to :user,optional: false
  # belongs_to :gorup,optional: false

  enum evaluation: { "★☆☆☆☆": 1,"★★☆☆☆": 2,"★★★☆☆": 3,"★★★★☆": 4,"★★★★★": 5 }

  def error_check

    if title.blank?
        errors[:base] << "お店の名前を入力してください"
    end

    if evaluation.blank?
      errors[:base] << "評価を入力してください"
    end

    if spot.blank?
      errors[:base] << "場所を入力してください"
    end

    if tell.blank?
      errors[:base] << "電話番号を入力してください"
    end

    if category_id.blank?
      errors[:base] << "カテゴリーを選んでください"
    end

  end

end