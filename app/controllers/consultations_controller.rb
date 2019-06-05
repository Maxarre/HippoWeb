class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
    @consultation = Consultation.new(params[:consultation])
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(patient_id: params[:id])
    @consultation.save
    redirect_to dashboard_path
  end

  def edit
    @patient = Patient.find(params[:id])
    @consultation = @patient.consultations.last

    # @consultation = @patient.consultations.where("consultation.consultation-type", "pending").first
  end

  def update
    @consultation = User.find(params[:id])
    @consultation.update(consultation_params)
    redirect_to patient_path
  end

  def destroy
  end

  private

  def consultation_params
    params.require(:consultation).permit(:patient_id)
  end
end
