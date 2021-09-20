class ParticipantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_participant, only: %i[ show edit update destroy ]
  layout 'session_layout'

  def index
    @participants = Participant.all
  end

  def show
  end

  def new
    @participant = Participant.new
  end

  def edit
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      flash.notice = "The participant record was created successfully."
      redirect_to @participant
    else
      flash.now.alert = @participant.errors.full_messages.to_sentence
      render :new 
    end
  end

  def update
    if @participant.update(participant_params)
      flash.notice = "The participant record was updated successfully."
      redirect_to @participant
    else
      flash.now.alert = @participant.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to session_url, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:participant_name, :session_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to sessions_path
    end
end
