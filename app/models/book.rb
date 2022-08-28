class Book < ApplicationRecord
  validates :title, presence: true# titleが空ではないことを確認
  validates :body, presence: true# bodyが空ではないことを確認
end
