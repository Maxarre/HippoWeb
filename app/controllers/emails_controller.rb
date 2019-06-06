class EmailsController < ApplicationController
  def index
    @email = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to patient_path
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:email).permit(:consultation, :title, :content, :description, :subject, :photo1_url, :photo2_url, :photo3_url, :article_1_url, :article_2_url, :article_3_url)
  end
end
