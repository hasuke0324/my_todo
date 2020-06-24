class Task < ApplicationRecord
  validates :content, presence: true
  attribute :priority, :string, default: '未設定'
end
