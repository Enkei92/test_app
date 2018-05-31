describe AccountsController, type: :controller do
  let(:account) { create(:new_account) }

  before do
    sign_in account
  end

  describe 'GET index' do
    it 'assigns @accounts' do
      get :index

      expect(assigns(:accounts)).to eq([account])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'has a 200 status code' do
      get :index

      expect(response).to have_http_status :ok
    end
  end

  describe 'GET #show' do
    it 'assigns the requested account to @account' do
      get :show, params: { id: account.id }

      expect(assigns(:account)).to eq(account)
    end

    it 'renders the #show view' do
      get :show, params: { id: account.id }

      expect(response).to render_template(:show)
    end

    it 'has a 200 status code' do
      get :show, params: { id: account.id }

      expect(response).to have_http_status :ok
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested account to @account' do
      get :edit, params: { id: account.id }

      expect(assigns(:account)).to eq(account)
    end

    it 'renders the #edit view' do
      get :edit, params: { id: account.id }

      expect(response).to render_template('edit')
    end

    it 'has a 200 status code' do
      get :edit, params: { id: account.id }

      expect(response).to have_http_status :ok
    end
  end

  describe 'PATCH #update' do
    it 'has a 302 status code' do
      patch :update, params: { id: account.id, account: { first_name: 'Yuki', last_name: 'Matz',
                                                          age: 53, city: 'Osaka' } }

      expect(response).to have_http_status :found
    end

    it 'updates account params' do
      patch :update, params: { id: account.id, account: { first_name: 'Yuki', last_name: 'Matz',
                                                          age: 53, city: 'Osaka' } }
      account.reload

      expect(account.first_name).to eq('Yuki')
      expect(account.last_name).to eq('Matz')
      expect(account.age).to eq(53)
      expect(account.city).to eq('Osaka')
    end
  end

  describe 'DELETE destroy' do
    it 'redirect to accounts' do
      delete :destroy, params: { id: account }

      expect(response).to redirect_to accounts_url
    end

    it 'remove account from db' do
      delete :destroy, params: { id: account }

      expect(Account.exists?(account.id)).to be_falsey
    end

    it 'has a 200 status code' do
      delete :destroy, params: { id: account.id }

      expect(response).to have_http_status :found
    end
  end
end
