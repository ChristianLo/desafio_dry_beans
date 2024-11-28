class DetailRouteController < ApplicationController
  before_action :params_route, only: [ :show ]
  before_action :get_article, only: [ :show ]


  def show
    if @detail_route.nil?
      render json: { message: "Ruta no encontrada" }, status: :not_found
    else
      render json: @detail_route.to_json(include: {
        trips: { except: [ :route_id ], include: { requests: { except: [ :trip_id ] } } }
      }), status: :ok
    end
  end

  private
    def params_route
      params.require(:id)
    end

    def get_article
      @detail_route = Route.includes(:trips).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      nil
    end
end
