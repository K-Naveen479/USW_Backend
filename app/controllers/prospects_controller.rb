class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :update, :destroy]

  def index
    prospects = Prospect.all
    render json: prospects, status: :ok
  end

  def show
    render json: @prospect, status: :ok
  end

  def create
    prospect = Prospect.new(prospect_params)
    if prospect.save
      render json: { message: "Successfully created", prospect: prospect }, status: :ok
    else
      render json: prospect.errors, status: :unprocessable_entity
    end
  end

  def update
    if @prospect.update(prospect_params)
      render json: { message: "Successfully updated", prospect: @prospect }, status: :ok
    else
      render json: @prospect.errors, status: :unprocessable_entity
    end
  end

  def destroy
      if @prospect.destroy
        render json: { message: "Successfully deleted" }, status: :ok
      else
        render json: { error: "Couldn't find the record" }, status: :not_found
      end
  end

  private

  def set_prospect
      @prospect = Prospect.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Couldn't find the record" }, status: :not_found
  end

  def prospect_params
    params.require(:prospect).permit(:full_name, :email, :date_of_birth, :subject_area, :marketing_updates, :correspondence_in_welsh, :gps_location)
  end
end