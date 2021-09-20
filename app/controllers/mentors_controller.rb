class MentorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_mentor, only: %i[ show edit update destroy ]
  layout 'session_layout'

  def index
    @mentors = Mentor.all
  end

  def show
  end

  def new
    @mentor = Mentor.new
  end

  def edit
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      flash.notice = "The mentor record was created successfully."
      redirect_to @mentor
    else
      flash.now.alert = @mentor.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @mentor.update(mentor_params)
        flash.notice = "The mentor record was updated successfully."
      redirect_to @mentor
    else
      flash.now.alert = @mentor.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @mentor.destroy
    respond_to do |format|
      format.html { redirect_to mentors_url, notice: "Mentor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    def mentor_params
      params.require(:mentor).permit(:mentor_name)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to sessions_path
    end
end
