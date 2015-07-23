class Event < ActiveRecord::Base
  # タイトルは必須
  validates :title, presence: true
end
