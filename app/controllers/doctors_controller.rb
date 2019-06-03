class DoctorsController < ApplicationController
  def dashboard
    @doctor = current_user.doctor
    @patient = current_user.patient
    @consultation = current_user.consultation
  end

  def index
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new(:doctor)
  end

  def create
    @doctor = Doctor.new(params[:doctor])
    @doctor.save
    redirect_to dashboard_path
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(params[:doctor])
    redirect_to doctor_path(@doctor)
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to root_path
  end

  private

  def doctor_params
    params.require(:doctor).permit
  end
end
