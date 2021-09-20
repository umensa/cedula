 require 'rails_helper'

RSpec.describe "Participants", type: :request do

# index
  describe "get session_path" do
    it "renders the index view" do
      session = FactoryBot.create(:session)
      participant = FactoryBot.create(:participant, session_id: session.id)
      get session_path(id: session.id)
      expect(response).to render_template(:show)
    end
  end

# show
  describe "get participant_path" do
    it "renders the :show template" do
      session = FactoryBot.create(:session)
      participant = FactoryBot.create(:participant, session_id: session.id)
      get participant_path(id: participant.id)
      expect(response).to render_template(:show)
    end

    it "redirects to the index path if the participant id is invalid" do
      get participant_path(id: 1000) #an ID that doesn't exist
      expect(response).to redirect_to sessions_path
    end
  end

  # new
  describe "get new_participant_path" do
    it "renders the :new template" do 
      get new_participant_path
      expect(response).to render_template(:new)
    end
  end

  # edit
  describe"get edit_participant_path" do
    it "render the :edit template" do
      session = FactoryBot.create(:session)
      participant = FactoryBot.create(:participant, session_id: session.id)
      get edit_participant_path(id: participant.id)
      expect(response).to render_template(:edit)
    end
  end

  # create
  describe "post participants_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      session = FactoryBot.create(:session)
      participant_attributes = FactoryBot.attributes_for(:participant, session_id: session.id)
      expect { post participants_path, params: {participant: participant_attributes} }.to change(Participant, :count)
      expect(response).to redirect_to participant_path(id: Participant.last.id)
    end
  end

  describe "post participants_path with invalid data" do
    it "does not save a new entry or redirect" do
      session = FactoryBot.create(:session)
      participant_attributes = FactoryBot.attributes_for(:participant, session_id: session.id)
      participant_attributes.delete(:participant_name)
      expect { post participants_path, params: {participant: participant_attributes} }.to_not change(Participant, :count)
      expect(response).to render_template(:new)

      participant_attributes = FactoryBot.attributes_for(:participant, session_id: "")
      expect { post participants_path, params: {participant: participant_attributes} }.to_not change(Participant, :count)
      expect(response).to render_template(:new)
    end
  end


  # update
  describe "put participant_path with valid data" do
      it "updates an entry and redirects to the show path for the session" do
        session = FactoryBot.create(:session)
        participant = FactoryBot.create(:participant, session_id: session.id)
        put "/participants/#{participant.id}", params: {participant: {participant_name: "Bean"}}
        participant.reload
        expect(participant.participant_name).to eq("Bean")
        expect(response).to redirect_to("/participants/#{participant.id}")
      end
    end

  describe "put participant_path with invalid data" do
    it "does not update the session record or redirect" do
      session = FactoryBot.create(:session)
        participant = FactoryBot.create(:participant, session_id: session.id)
      put "/participants/#{participant.id}", params: {participant: {participant_name: ""}}
      participant.reload
      expect(participant.session_id).not_to eq("")
      expect(response).to render_template(:edit)
    end
  end


# destroy
  describe "delete an participant record" do
    it "delete an participant record" do
      session = FactoryBot.create(:session)
      participant = FactoryBot.create(:participant, session_id: session.id)
      expect { 
        delete participant_path(participant.id)
      }.to change{Participant.count}
      expect(response).to redirect_to session_path(session.id)
      end
  end
end
