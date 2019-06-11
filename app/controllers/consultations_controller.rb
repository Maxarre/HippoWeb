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
    @consultation = Consultation.new(consultation_params)
    @consultation.save
    redirect_to dashboard_path
  end

  def edit
    # @consultation = Consultation.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.last
    @consultation.patient = Patient.find(params[:patient_id])
    @all_tagg_list = ActsAsTaggableOn::Tag.all
    # @consultation = Consultation.find(params[:id])
    # @consultation = Consultation.last
    # @consultation = Consultation.order('id desc').offset(1).first --> for the last - 1
    # @consultation = @patient.consultations.where("consultation.consultation-type", "pending").first
  end

  def update
    @consultation = Consultation.find(params[:id])
    # @consultation = Consultation.last
    # @consultation = Consultation.order('id desc').offset(1).first --> for the last - 1
    @consultation.patient = Patient.find(params[:patient_id])
    @consultation.save
    @consultation.update(consultation_params)
    redirect_to new_consultation_email_path(params[:id])
  end

  def add_tags
    @consultation = Consultation.find(params[:id])
    @consultation.tag_list.clear
    params[:consultation][:tag_list].split(',').each do |t|
      @consultation.tag_list.add(t)
      @consultation.save
    end
    redirect_to edit_patient_consultation_path(params[:id])
  end

  def destroy
  end

  private

  def consultation_params
    params.require(:consultation).permit(:patient_id, :status, :start_time, :meeting_time, :consultation_type, :required_documents, :patient_complain, :diagnostic, :care_plan, :prescription, :note_patient, :patient_note_attachment)
  end
end
