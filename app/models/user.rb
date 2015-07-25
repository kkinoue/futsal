# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  remember_token  :string
#

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
  validates :password, length: { minimum: 1 }

  # 平文のトークンを生成
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      # user#remember_token は暗号化した値
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
