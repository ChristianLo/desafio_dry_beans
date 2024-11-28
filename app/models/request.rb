class Request < ApplicationRecord
  belongs_to :trip, class_name: "Trip", foreign_key: "trip_id", optional: true

  enum :status, [ :pending, :accepted, :rejected ], prefix: true, scope: true, default: :pending
  enum :type_request, [ :waiting, :delevery, :pickup ], prefix: true, scope: true, default: :waiting

  validates :trip_id, presence: true, on: :create
  validates :trip_id, presence: true, on: :update, numericality: { greater_than: 0 }

  validates :sender, presence: true
  validates :receiver, presence: true
  validates :address, presence: true, format: { with: /[\w\s]+ [0-9]+,[\w\s]+,[\w\s]+[\w\s,]*/ }
  validates :status, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :departure_time, presence: true

  def show_weight_kg
    "#{self.weight} kg"
  end

  def show_size_m3
    "#{self.size} m3"
  end

end
