class User < ApplicationRecord
  before_save { self.email = email.downcase }
<<<<<<< HEAD
  VALID_EMAIL_REGEX = /\A\[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
=======
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
>>>>>>> 85f29aa65be804176e82bf6ac1ae7be4b8587df1
  validates :email, presence: true
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, presence: true
  validates :password, length: {minimum: 6}
  has_secure_password

  validates :name, presence: true


  belongs_to :occupation
  validates :occupation, presence: true

end
