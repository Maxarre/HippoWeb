class EmailsController < ApplicationController
  def index
    @email = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @email = Email.new
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
