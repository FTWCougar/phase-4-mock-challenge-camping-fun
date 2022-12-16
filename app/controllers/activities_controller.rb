class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def not_found
        render json: { error: "Activity not found" }, status: :not_found
    end

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find_by!(id: params[:id])
        activity.signups.destroy_all
        activity.destroy
        head :no_content
    end
end
