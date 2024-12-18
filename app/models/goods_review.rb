class GoodsReview < ApplicationRecord
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validate :error_check
  has_many :goods_comments, dependent: :destroy
  belongs_to :category,optional: false
  belongs_to :user,optional: false
  belongs_to :group,optional: false

  enum evaluation: { "★☆☆☆☆": 1,"★★☆☆☆": 2,"★★★☆☆": 3,"★★★★☆": 4,"★★★★★": 5 }
  
  def error_check

    if title.blank?
        errors[:base] << "お店の名前を入力してください"
    end

    if review.blank?
        errors[:base] << "レビューを入力してください"
    end

    if evaluation.blank?
        errors[:base] << "評価を入力してください"
    end

    if price.blank?
        errors[:base] << "価格を入力してください"
    end

    if category_id.blank?
        errors[:base] << "カテゴリーを選んでください"
    end

  end

end
