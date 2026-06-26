class Order < ApplicationRecord
  STATUS = %w[pending confirmed, shipped cancelled].freeze
  belongs_to :user
  has_many :order_units
  has_many :products, through: :order_units

  validates :status, inclusion: { in: STATUS }

  def recalculate_total!
    update_column(:totak_cents, order_items.sum("quantity *unit_price_cents"))
  end

  def cancellable?
    status == "pending"
  end

end
