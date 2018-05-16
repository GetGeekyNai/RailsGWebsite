require 'rails_helper'
describe UsersController do
  context 'new' do
    it 'renders a template new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    before :each do
      @users = [attributes_for(:user)]
    end
    context 'with valid data' do
      it 'saves the new user in the DB' do
        expect{
          post :create, params:{ user: attributes_for(:user)  }

        }.to change(User, :count).by(1)
      end


      it 'redirects to user login  upon save' do
        post :create, params:{ user: attributes_for(:user)  }
        expect(response).to redirect_to login_path
      end
    end

    context 'with invalid data' do
      it 're-renders the template new' do
        post :create,params:{
          user: attributes_for(:userx)
        }
        expect(response).to render_template(:new)
      end
      it 'does not save the new @contact' do
        expect{
          post :create, params:{ user: attributes_for(:userx)  }

        }.not_to change(User, :count)
      end
    end
  end
  end
