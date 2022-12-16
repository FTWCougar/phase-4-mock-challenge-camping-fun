class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def invalid(invalid)
        render json: {
                          errors: invalid.record.errors.full_messages,
                      },
                      status: :unprocessable_entity
    end
    def not_found
        render json: { error: "Camper not found" }, status: :not_found
    end

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end
    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, status: :ok, serializer: CamperShowSerializer
    end
    def create
        camper = Camper.create!(name: params[:name], age: params[:age])
        render json: camper, status: :created
    end
end
