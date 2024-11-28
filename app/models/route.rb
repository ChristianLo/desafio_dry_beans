class Route < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :distance, numericality: { greater_than: 0 }

  scope :by_origin, ->(search_origin) { where(origin: search_origin) }
  scope :distance_greater_than, ->(search_distance) { where("distance > #{search_distance}") }

  def show_distance_km
    "#{self.distance} km"
  end
end
