class DoctorsController < ApplicationController
  def dashboard
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit()
  end
end
