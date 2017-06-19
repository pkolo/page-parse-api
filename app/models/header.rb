class Header < ApplicationRecord
  belongs_to :link

  validates :content, presence: true
  validates :tag, presence: true
end
