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
#  type            :string           default("general")
#

class User < ActiveRecord::Base

  # column name type を普通のcolumnとして使用する
  self.inheritance_column = :_type_disabled

  # このユーザーが作成したeventの関連
  has_many :events, foreign_key: 'create_id', dependent: :destroy

  # emailは全て小文字でDB保存
  before_save { email && email.downcase! }

  # bofore_create は save の後に新規レコードの場合に実行される
  before_create :create_remember_token

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

  def admin?
    type == 'admin'
  end

  def general?
    type == 'general'
  end

  def guest?
    !admin? && !general?
  end

  # 平文のトークンを生成
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def attend_events
    # current_user.attend_eventsって書いたら英語っぽいかなと思ってuserに作りたいと思ったけど
    # 素直にeventの中に作ったほうがいいいのかも。
    Event.joins(:invitations).where('start_time > ? and user_id = ? and status = ?', Time.zone.now, id, '出席')
        .order(:start_time)
  end

  def attended_in_past
    Event.joins(:invitations).where('start_time <= ? and user_id = ? and status = ?', Time.zone.now, id, '出席')
        .order(:start_time)
  end

  private

    def create_remember_token
      # user#remember_token は暗号化した値
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
