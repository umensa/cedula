 require 'rails_helper'

RSpec.describe "Sessions", type: :request do

# index
  describe "get sessions_path" do
    it "renders the index view" do
      get sessions_path
      expect(response).to render_template(:index)
    end
  end

# show
  describe "get session_path" do
    it "renders the :show template" do
      mentor = FactoryBot.create(:mentor)
      session = FactoryBot.create(:session, mentor_id: mentor.id)
      get session_path(id: session.id)
      expect(response).to render_template(:show)
    end

    it "redirects to the index path if the session id is invalid" do
      get session_path(id: 1000) #an ID that doesn't exist
      expect(response).to redirect_to sessions_path
    end
  end

# new
  describe "get new_session_path" do
    it "renders the :new template" do 
      get new_session_path
      expect(response).to render_template(:new)
    end
  end

  # edit
  describe"get edit_session_path" do
    it "render the :edit template" do
      mentor = FactoryBot.create(:mentor)
      session = FactoryBot.create(:session, mentor_id: mentor.id)
      get edit_session_path(id: session.id)
      expect(response).to render_template(:edit)
    end
  end

  # create
  describe "post sessions_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      mentor = FactoryBot.create(:mentor)
      session_attributes = FactoryBot.attributes_for(:session, mentor_id: mentor.id)
      expect { post sessions_path, params: {session: session_attributes} }.to change(Session, :count)
      expect(response).to redirect_to session_path(id: Session.last.id)
    end
  end

  describe "post sessions_path with invalid data" do
    it "does not save a new entry or redirect" do
      mentor = FactoryBot.create(:mentor)
      session_attributes = FactoryBot.attributes_for(:session, mentor_id: mentor.id)
      session_attributes.delete(:topic)
      expect { post sessions_path, params: {session: session_attributes} }.to_not change(Session, :count)
      expect(response).to render_template(:new)

      session_attributes = FactoryBot.attributes_for(:session, mentor_id: "")
      expect { post sessions_path, params: {session: session_attributes} }.to_not change(Session, :count)
      expect(response).to render_template(:new)
    end
  end

  # update
  describe "put session_path with valid data" do
      it "updates an entry and redirects to the show path for the session" do
        mentor = FactoryBot.create(:mentor)
        session = FactoryBot.create(:session, mentor_id: mentor.id)
        put "/sessions/#{session.id}", params: {session: {topic: "Basics"}}
        session.reload
        expect(session.topic).to eq("Basics")
        expect(response).to redirect_to("/sessions/#{session.id}")
      end
    end

  describe "put session_path with invalid data" do
    it "does not update the session record or redirect" do
      mentor = FactoryBot.create(:mentor)
      session = FactoryBot.create(:session, mentor_id: mentor.id)
      put "/sessions/#{session.id}", params: {session: {topic: ""}}
      session.reload
      expect(session.topic).not_to eq("")
      expect(response).to render_template(:edit)
    end
  end

# destroy
  describe "delete an session record" do
    it "delete an session record" do
      mentor = FactoryBot.create(:mentor)
      session = FactoryBot.create(:session, mentor_id: mentor.id)
      expect { 
        delete session_path(session.id)
      }.to change{Session.count}
      expect(response).to redirect_to sessions_path
      end
  end
end
