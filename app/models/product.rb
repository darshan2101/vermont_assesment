class Product < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true
  validates :sku, presence: true , uniqueness: true

  validates :price_cents, presence: true, numerically: { only_integer: true , greater_than: 0 }
  validates :alcohol_by_volume, numerically: { greater_than_or_euql_to: 0 }, allow_nil: true

  validates :stock_quantity, :presence: true, numerically: {only_integer: true, greater_than_or_euql_to: 0 },


  scope :in_stock,  -> { where("stock_quantity > 0") }

  private
    def invalidate_products_cache
      Rails.cache.delete_matched("products_index:*")
    end
end
