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

  def remain
    return unless wanted_persons
    wanted_persons - attendance
  end

  def date
    return start_time.strftime('%Y/%m/%d') if start_time.strftime('%Y/%m/%d') == end_time.strftime('%Y/%m/%d')
    start_time.strftime('%Y/%m/%d') + ' - ' + end_time.strftime('%Y/%m/%d')
  end

  def time
    start_time.strftime('%H:%M') + ' - ' + end_time.strftime('%H:%M')
  end

  def datetime
    start_time.strftime('%Y/%m/%d %H:%M') + ' - ' + end_time.strftime('%Y/%m/%d %H:%M')
  end

  def is_over_several_days?
    start_time.strftime('%Y/%m/%d') != end_time.strftime('%Y/%m/%d')
  end

  def attendance
    Invitation.where(status: '出席', event: id).count
  end

  def attend_invitations
    Invitation.where(status: '出席', event: id)
  end

  private

    def start_end_check
      return unless start_time && end_time

      if end_time < start_time
        errors.add(:end_time, "の日付を正しく記入して下さい。")
      end
    end

end
