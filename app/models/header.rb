class Header < ApplicationRecord
  belongs_to :link

  validates :content, presence: true
  validates :tag, presence: true
  validates_inclusion_of :tag, in: ["h1", "h2", "h3"]
end
