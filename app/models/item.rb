class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
end