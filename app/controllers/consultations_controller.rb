class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @consultation = Consultation.new(:consultation)
  end

  def create
    @consultation = Consultation.new(params[:consultation])
    @consultation.save
    redirect_to profile_path
  end

  def edit
    @consultation = Consultation.find(params[:id])
  end

  def update
    @consultation = User.find(params[:id])
    @consultation.update(params[:consultation])
    redirect_to profile_path(@consultation)
  end

  def destroy
  end

  private

  def consultation_params
    params.require(:consultation).permit
  end
end
