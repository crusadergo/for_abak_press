describe PagesController do

  describe 'GET /add' do

    it 'assigns new @page variable to the view' do
      get :add
      expect(assigns[:page]).to be_a(Page)
    end

    it 'renders new template' do
      get :add
      expect(response).to render_template :add
    end
  end

  describe 'POST /pages/create' do
    let(:params) do
      {
          'name' => 'home_page',
          'title' => 'Home page',
          'body' => 'Some text',
          'parent_id' => 1
      }
    end

    it 'sends new message to Page class' do
      Page.should_receive(:new).with(params).and_call_original
      post :create, page: params
    end

    let!(:page) { stub_model(Page) }

    it 'sends save message to page model' do
      Page.stub(:new).and_return(page)

      page.should_receive(:save)

      post :create, page: params
    end

    context 'when save message returns true' do
      it 'redirects to parents page of the created one' do
        page1 = Page.new name: 'name1', id: 1
        page1.save
        # page2 = Page.new name: 'name2', parent: page1

        post :create, page: params

        expect(response).to redirect_to(Page.find(params['parent_id']).url)
      end
      it 'assigns a success flash message'
    end

    context 'when save message returns false' do
      it 'renders new template'
      it 'assigns page variable to the view'
      it 'assigns error flash message'
    end
  end

end
