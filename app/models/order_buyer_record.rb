class OrderBuyerRecord
  include ActiveModel::Model
  atter :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates :phone_number, numericality: {only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: 'is invalid'}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end