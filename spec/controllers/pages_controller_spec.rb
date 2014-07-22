describe PagesController do

  describe 'GET /add' do
    let! (:page) { mock_model('Page').as_new_record }

    it 'assigns new @page variable to the view' do
      Page.stub(:new).and_return(page)
      get :add
      expect(assigns[:page]).to eq(page)
    end
    it 'renders new template' do
      get :add
      expect(response).to render_template :add
    end
  end

  describe 'POST /create' do
    it 'sends new message to Page class'
    it 'sends save message to page model'
    context 'when save message returns true' do
      it 'redirects to parents page of the created one'
      it 'assigns a success flash message'
    end
    context 'when save message returns false' do
      it 'renders new template'
      it 'assigns page variable to the view'
      it 'assigns error flash message'
    end
  end

end
