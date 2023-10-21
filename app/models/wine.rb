class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :country, optional: true
  belongs_to :region, optional: true

  validates_presence_of :name, :year, :quantity, :country, :region, :winery, :wine_type, :variety
  validates_numericality_of :year, only_integer: true
  validates_inclusion_of :rating, in: 0..5, allow_nil: true

  attribute :empty, :boolean, default: false

  before_save :check_quantity_if_not_empty

  include PgSearch::Model

  pg_search_scope :search_by_details,
    against: [ :name, :wine_type, :region, :winery, :variety, :year, :country, :rating, :comment, :empty, :quantity ],
    using: {
      tsearch: { prefix: true }
    }

  def check_quantity_if_not_empty
    if !empty? && quantity.to_i <= 0
      errors.add(:quantity, "must be greater than zero if wine is not empty")
      throw(:abort)
    end
  end
end
