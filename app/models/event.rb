# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  start_time     :datetime         not null
#  location       :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  end_time       :datetime         not null
#  create_id      :integer
#  wanted_persons :integer
#

class Event < ActiveRecord::Base

  # eventの作成者の関連
  belongs_to :create_user, class_name: 'User', foreign_key: 'create_id'

  # eventの招待者の関連
  ## Invitation modelへの参照
  has_many :invitations
  ## invitationsを通しての User modelへの参照（参照のショートカット）
  has_many :users, through: :invitations

  after_create :create_invitations

  # 必須項目
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate  :start_end_check

  # 引数ユーザーはこのイベントの招待者か？
  def invitees?(user)
    # !!はboolean型に変換するイディオム。nil,falseがfalse,それ以外はtrueに変換する。
    !!Invitation.find_by(event_id: id, user_id: user.id)
  end

  def find_invitation_by_user(user)
    Invitation.find_by(event_id: id, user_id: user.id)
  end

  private

    def start_end_check
      return unless start_time && end_time

      if end_time < start_time
        errors.add(:end_time, "の日付を正しく記入して下さい。")
      end
    end

    def create_invitations
      # 作成者以外のユーザーのinvitationsレコードを作成
      User.all.each do |user|
        invitations.create(user: user) if create_user.id != user.id
      end
    end
end
