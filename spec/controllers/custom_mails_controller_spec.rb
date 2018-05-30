require 'rails_helper'

describe CustomMailsController, type: :controller do
  before(:each) do
    @custom_mail = create(:new_account_mail)
    @admin = create(:admin)
    sign_in @admin
  end

  describe 'GET index' do
    it 'assigns @custom_mails' do
      get :index
      expect(assigns(:custom_mails)).to eq([@custom_mail])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested custom_mail to @custom_mail' do
      get :show, params: { id: @custom_mail.id }
      expect(assigns(:custom_mail)).to eq(@custom_mail)
    end

    it 'renders the #show view' do
      get :show, params: { id: @custom_mail.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested custom_mail to @custom_mail' do
      get :edit, params: { id: @custom_mail.id }
      expect(assigns(:custom_mail)).to eq(@custom_mail)
    end

    it 'renders the #edit view' do
      get :edit, params: { id: @custom_mail.id }
      expect(response).to render_template(:edit)
    end
  end
end
