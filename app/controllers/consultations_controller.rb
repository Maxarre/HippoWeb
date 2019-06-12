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
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.last
    @consultation_templates = YAML.load_file("db/consultation_templates.yml")
    @consultation.patient = Patient.find(params[:patient_id])
    @all_tagg_list = ActsAsTaggableOn::Tag.all
    # @consultation = Consultation.find(params[:id])
    # @consultation = Consultation.last
    # @consultation = Consultation.order('id desc').offset(1).first --> for the last - 1
    # @consultation = @patient.consultations.where("consultation.consultation-type", "pending").first
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.patient = Patient.find(params[:patient_id])
    @consultation.save
    @consultation.update(consultation_params)
    redirect_to new_consultation_email_path(params[:id])
  end

  def add_tags
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultation.tag_list
    @consultation_templates = YAML.load_file("db/consultation_templates.yml")
    params[:consultation][:tag_list].split(',').each do |t|
      @consultation.tag_list.add(t)
      @consultation.save
    end
    respond_to do |format|
      format.html { redirect_to edit_patient_consultation_path(params[:id]) }
      format.js
    end
  end

  def remove_tags
    @consultation = Consultation.find(params[:id])
    @consultation.tag_list.remove(params[:tag_name])
    @consultation.save
  end

  def destroy
  end

  private

  def consultation_params
    params.require(:consultation).permit(:patient_id, :status, :start_time, :end_time, :consultation_type, :required_documents, :patient_complain, :diagnostic, :care_plan, :prescription, :note_patient, :patient_note_attachment)
  end
end
