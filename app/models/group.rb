class Group < ApplicationRecord
has_many :chats, dependent: :destroy 
has_many :store_reviews, dependent: :destroy
has_many :goods_reviews, dependent: :destroy 
has_many :messages, dependent: :destroy
belongs_to :category,optional: false 
end
