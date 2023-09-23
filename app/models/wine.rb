class Wine < ApplicationRecord
  validates_presence_of :name, :year, :quantity
  validates_numericality_of :year, only_integer: true
  validates_inclusion_of :rating, in: 0..5, allow_nil: true

  attribute :empty, :boolean, default: false

  before_save :check_quantity_if_not_empty

  def check_quantity_if_not_empty
    if !empty? && quantity.to_i <= 0
      errors.add(:quantity, "must be greater than zero if wine is not empty")
      throw(:abort)
    end
  end
end
