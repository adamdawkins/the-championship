require 'rails_helper'

RSpec.describe "Admin::Contestants", type: :request do
  let(:leader) { create(:leader) }

  describe "GET /admin/contestants/new" do
    context "Leader not logged in" do
      before { get new_admin_contestant_path }

      it "redirects to the login page" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to new_leader_session_path
      end
    end
    
    context "Leader logged in" do
      before do
        sign_in leader
        get new_admin_contestant_path
      end

      it "is successful" do
        expect(response).to have_http_status(200)
      end

       it "renders a form" do
         expect(response.body).to include("<form")
       end
    end
  end

  describe "POST /admin/contestants" do
    let(:contestant_params) { { contestant: { name: Faker::Name.name } } }
    context "Leader not logged in" do
      before { post admin_contestants_path, { params: contestant_params } }

      it "redirects to the login page" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to new_leader_session_path
      end
    end

    context "Leader logged in" do
      before do
        sign_in leader
      end

      it "redirects successful posts to /admin/contestants" do
        post admin_contestants_path, { params: contestant_params }
        expect(response).to redirect_to("/admin/contestants")
      end

      it "renders the new template for unsuccessful posts" do
        post admin_contestants_path, { params: { contestant:  { name: nil } } }
        expect(response).to render_template("new")
      end
    end
  end
end
