class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 26 }
  attribute :priority, :string, default: '未設定'

  belongs_to :user
end
