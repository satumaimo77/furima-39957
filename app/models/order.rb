class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer_record
end
