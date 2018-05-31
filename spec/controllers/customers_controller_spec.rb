describe CustomersController, type: :controller do
  let(:customer) { create(:customer) }
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
end
