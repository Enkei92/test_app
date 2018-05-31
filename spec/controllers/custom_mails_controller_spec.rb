describe CustomMailsController, type: :controller do
  let(:custom_mail) { create(:new_account_mail) }
  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET index' do
    it 'assigns @custom_mails' do
      get :index
      expect(assigns(:custom_mails)).to eq([custom_mail])
    end

    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status :ok
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested custom_mail to @custom_mail' do
      get :show, params: { id: custom_mail.id }
      expect(assigns(:custom_mail)).to eq(custom_mail)
    end

    it 'has a 200 status code' do
      get :show, params: { id: custom_mail.id }
      expect(response).to have_http_status :ok
    end

    it 'renders the #show view' do
      get :show, params: { id: custom_mail.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested custom_mail to @custom_mail' do
      get :edit, params: { id: custom_mail.id }
      expect(assigns(:custom_mail)).to eq(custom_mail)
    end

    it 'has a 200 status code' do
      get :edit, params: { id: custom_mail.id }
      expect(response).to have_http_status :ok
    end

    it 'renders the #edit view' do
      get :edit, params: { id: custom_mail.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'has a 302 status code' do
      patch :update, params: { id: custom_mail.id, custom_mail: { body: 'body', subject: 'subject' } }
      expect(response).to have_http_status :found
    end

    it 'updates mail params' do
      patch :update, params: { id: custom_mail.id, custom_mail: { body: 'body changed',
                                                                  subject: 'subject changed' } }
      custom_mail.reload

      expect(custom_mail.body).to eq('body changed')
      expect(custom_mail.subject).to eq('subject changed')
    end
  end
end
