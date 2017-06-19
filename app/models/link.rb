class Link < ApplicationRecord
  has_many :headers, dependent: :destroy

  validates :url, presence: true
end
