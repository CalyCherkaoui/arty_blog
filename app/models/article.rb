class Article < ApplicationRecord
  belongs_to :author
  has_many :elements
  validates :title, presence: true
end
