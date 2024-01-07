class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :image, presence: true
end