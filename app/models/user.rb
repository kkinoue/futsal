class User < ActiveRecord::Base
  before_save { email && email.downcase! }

  validates :name, presence: true,
                   length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }



  has_secure_password
  # has_secure_password によって以下の属性が定義される
  # ・password
  # ・password_confirmation
  # DBには password_digest カラムに暗号化された値が保存される

  # validates :password, length: { minimum: 6 }

end
