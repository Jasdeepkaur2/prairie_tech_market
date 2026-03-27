class Page < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true
  validates :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "slug", "body", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
