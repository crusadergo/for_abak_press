class PagesController < ApplicationController

  before_action :decode_path, on: [:add, :edit, :show]

  def add
    unless valid_path?(params[:pathee])
      render text: 'not found'
    end

    @page = Page.new

    unless params[:pathee].blank?
      page = find_page(params[:pathee])

      unless page
        render text: 'not found'
      end

      @page.parent = page
    end
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to URI.encode(@page.url)
    else
      redirect_to '/'
    end
  end

  def show
    unless valid_path?(params[:pathee])
      render text: 'not found'
    end

    if params[:pathee].blank?
      @pages = Page.where parent: 0
      render :root_page
    else
      @page = find_page(params[:pathee])

      unless @page
        render text: 'not found'
      end
    end
  end

  private

  def decode_path
    if params[:pathee].nil?
      params[:pathee] = ''
    else
      params[:pathee] = URI.decode(params[:pathee])
    end
  end

  def page_params
    permitted = params.require(:page).permit(:name, :title,:body, :parent_id)
    permitted[:parent_id] = permitted[:parent_id].to_i
    permitted
  end

  def find_page(path)
    Page.find_by_url('/' + path)
  end

  def valid_path?(path)
    !!( path =~ /^[a-zA-Z0-9_а-яА-ЯёЁ\/]*$/ )
  end

end
