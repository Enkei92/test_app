require 'rails_helper'

describe AccountsController, type: :controller do
  before(:each) do
    @account = create(:new_account)
    sign_in @account
  end

  describe 'GET index' do
    it 'assigns @accounts' do
      get :index
      expect(assigns(:accounts)).to eq([@account])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested account to @account' do
      get :show, params: { id: @account.id }
      expect(assigns(:account)).to eq(@account)
    end

    it 'renders the #show view' do
      get :show, params: { id: @account.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested account to @account' do
      get :edit, params: { id: @account.id }
      expect(assigns(:account)).to eq(@account)
    end

    it 'renders the #edit view' do
      get :edit, params: { id: @account.id }
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE destroy' do
    it 'redirect to accounts' do
      delete :destroy, params: { id: @account }
      expect(response).to redirect_to accounts_url
    end

    it 'remove account from db' do
      delete :destroy, params: { id: @account }
      expect(Account.exists?(@account.id)).to be_falsey
    end
  end
end
