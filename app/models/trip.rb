class Trip < ApplicationRecord
  belongs_to :route, class_name: "Route", foreign_key: "route_id"
  has_many :requests, class_name: "Request", foreign_key: "trip_id"

  enum :status, [ :in_progress, :completed ], scope: true, default: :in_progress

  validates :date_start, presence: true, on: :create

  def show_date_start
    date_start.strftime("%d/%m/%Y")
  end

  def show_date_end
    date_end.strftime("%d/%m/%Y")
  end
end
