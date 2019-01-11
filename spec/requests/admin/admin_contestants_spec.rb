require 'rails_helper'

RSpec.describe "Admin::Contestants", type: :request do
  describe "GET /admin/contestants/new" do
    context "Leader not logged in" do
      before { get new_admin_contestant_path }

      it "redirects to the login page" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to new_leader_session_path
      end
    end
    
    context "Leader logged in" do
      let(:leader) { create(:leader) }
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
end
