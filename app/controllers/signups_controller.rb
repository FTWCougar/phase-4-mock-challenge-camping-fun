class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def invalid(invalid)
        render json: {
                          errors: invalid.record.errors.full_messages,
                      },
                      status: :unprocessable_entity
    end
    def create
        signup =
            Signup.create!(
                time: params[:time],
                camper_id: params[:camper_id],
                activity_id: params[:activity_id],
            )
        render json: signup.activity, status: :created
    end
end
