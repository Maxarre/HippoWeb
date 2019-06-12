class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @emails = Email.all
    respond_to do |format|
      format.html { redirect_to patient_email_path(@patient) } # show.html.erb
      format.js # show.js.erb
    end
  end

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @email = Email.new
    @patient = @consultation.patient
    @email.consultation_id = @consultation.id
    respond_to do |format|
      format.html
      format.js
    end
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
