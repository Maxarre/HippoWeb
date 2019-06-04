class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
    @consultation = Consultation.new(params[:consultation])
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @patient = Patient.find(params[:id])
    @consultation = Consultation.new(patient_id: params[:id])
  end

  def create
    @consultation = Consultation.new(patient_id: params[:id])
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
