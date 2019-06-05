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
    params.require(:consultation).permit(:status, :start_time, :end_time, :consultation_type, :required_documents, :patient_complain, :diagnostic, :care_plan, :prescription, :note_patient, :patient_note_attachment)
  end
end
