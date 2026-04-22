class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province, optional: true
  has_many :orders

  validates :name, presence: true
  validates :phone, format: { with: /\A\d{10}\z/, message: "is invalid, must be 10 digits" }, allow_blank: true
  validates :postal_code, format: { with: /\A[A-Za-z]\d[A-Za-z][\s\-]?\d[A-Za-z]\d\z/, message: "is invalid (e.g. R3B 2E9)" }, allow_blank: true
  validates :city, format: { with: /\A[a-zA-Z\s\-]+\z/, message: "is invalid" }, allow_blank: true
  validates :address, format: { with: /\A[\d\w\s\-\.\,]+\z/, message: "is invalid" }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "email", "admin", "city", "address", "postal_code", "province_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "province", "orders" ]
  end
end
