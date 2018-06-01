describe VendorsController, type: :controller do
  let(:account) { create(:new_account) }
  let(:vendor) { create :vendor, account_id: account.id }
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
      get :edit, params: { id: vendor.id }

      expect(assigns(:vendor)).to eq(vendor)
    end

    it 'has a 200 status code' do
      get :edit, params: { id: vendor.id }

      expect(response).to have_http_status :ok
    end

    it 'renders the #edit view' do
      get :edit, params: { id: vendor.id }

      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'has a 302 status code' do
      patch :update, params: { id: vendor.id, vendor: { total_account: 77_777 } }

      expect(response).to have_http_status :found
    end

    it 'updates account params' do
      patch :update, params: { id: vendor.id, vendor: { total_account: 77_777 } }
      vendor.reload

      expect(vendor.total_account).to eq(77_777)
    end
  end
end
