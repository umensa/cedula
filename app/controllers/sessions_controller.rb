class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_session, only: %i[ show edit update destroy ]
  layout 'session_layout'

  def index
    @sessions = Session.all
  end

  def show
  end

  def new
    @session = Session.new
  end

  def edit
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      flash.notice  = "The session record was created successfully."
      redirect_to @session
    else
      flash.now.alert = @session.errors.full_messages.to_sentence
      render :new 
    end
  end

  def update
    if @session.update(session_params)
      flash.notice = "The session record was updated successfully."
      redirect_to @session
    else
      flash.now.alert = @session.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_session
      @session = Session.find(params[:id])
    end

    def session_params
      params.require(:session).permit(:topic, :mentor_id, :start_time, :end_time)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to sessions_path
    end
end
