class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales_status

  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank"}
end