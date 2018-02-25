require 'rails_helper'


describe UsersController, type: :controller  do  #Start of User Controller
  #let(:user) {User.create!(email:"Al@fr.com", password: "opening")}
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'Get #show' do #Start of Get Show
    context "When a user is logged in" do
      before "before logged in" do
        sign_in @user
      end
      it "loads correct user detais" do
        get :show, params: {id: @user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context "When a user is NOT logged in" do
      it "redirects to login" do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to (root_path)
      end
    end
  end #/End of Get Show

end #/End of User Controller
