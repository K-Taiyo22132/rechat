class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, presence: true, on: :create
  validates :password, length: {minimum: 6}, on: :create
  has_secure_password

  # validates :name, presence: true


  belongs_to :occupation
  validates :occupation, presence: true
has_many :goods_comments, dependent: :destroy
has_many :store_comments, dependent: :destroy
has_many :chats, dependent: :destroy
has_many :store_reviews, dependent: :destroy
has_many :goods_reviews, dependent: :destroy
has_many :messages, dependent: :destroy
has_many :select_categories, dependent: :destroy
# has_many :follows dependent, dependent: :nulliy
# has_many :followeds, class_name: "Follow", foreign_key: "followed_user_id", dependent: :nulliy

  has_many :store_comments,dependent: :destroy
end
