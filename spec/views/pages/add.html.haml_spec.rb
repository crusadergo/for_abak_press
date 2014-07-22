describe 'pages/add.html.haml' do
  it 'has new page form' do
    expect(rendered).to have_selector('form#new_page')
  end
  it 'has page name field'
  it 'has page title field'
  it 'has page body field'
end