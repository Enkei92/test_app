require 'rails_helper'

describe VendorsController, type: :controller do
  before(:each) do
    @vendor = create(:vendor)
    @admin = create(:admin)
    sign_in @admin
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response).to have_http_status :ok
    end

    it 'render new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested custom_mail to @custom_mail' do
      get :edit, params: { id: @vendor.id }
      expect(assigns(:vendor)).to eq(@vendor)
    end

    it 'renders the #edit view' do
      get :edit, params: { id: @vendor.id }
      expect(response).to render_template(:edit)
    end
  end
end
