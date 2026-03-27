class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items
  has_many :products, through: :order_items
  validates :status, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "status", "total_amount", "order_date", "user_id", "province_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "province", "order_items", "products"]
  end
end
