class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer_record
  attr_accessor :token
end
