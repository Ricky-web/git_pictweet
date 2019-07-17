class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  # 外部キーがnilでもDB保存可能
  
  has_many :comments
end
