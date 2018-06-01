describe CustomersController, type: :controller do
  let(:account) { create(:new_account_customer) }
  let(:customer) { create :customer, account_id: account.id }
  let(:admin) { create(:admin) }

  before do
    sign_in admin
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
      get :edit, params: { id: customer.id }

      expect(assigns(:customer)).to eq(customer)
    end

    it 'has a 200 status code' do
      get :edit, params: { id: customer.id }

      expect(response).to have_http_status :ok
    end

    it 'renders the #edit view' do
      get :edit, params: { id: customer.id }

      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'has a 302 status code' do
      patch :update, params: { id: customer.id, customer: { total_account: 11_111 } }

      expect(response).to have_http_status :found
    end

    it 'updates account params' do
      patch :update, params: { id: customer.id, customer: { total_account: 11_111 } }
      customer.reload

      expect(customer.total_account).to eq(11_111)
    end
  end
end
