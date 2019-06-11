class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @emails = Email.all
  end

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @email = Email.new
    @email.consultation_id = @consultation.id
  end

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @email = Email.new(email_params)
    @email.consultation = @consultation
    if @email.save
      redirect_to patient_path(@consultation.patient)
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:email).permit(:consultation_id, :title, :content, :subject)
  end
end
