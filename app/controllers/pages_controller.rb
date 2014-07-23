class PagesController < ApplicationController

  def add
    @page = Page.new

    if params.has_key?(:pathee)

      page = find_page(params)
      if page
        @page.parent = page
      else
        render text: 'page not found'
      end
    end
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page.url
    else
      redirect_to '/'
    end
  end

  def show
    if params.has_key?(:pathee)
      @page = find_page(params)
      if @page.nil?
        render text: 'Page not found'
      end
    else
      render :root_page
    end
  end

  private

  def page_params
    permitted = params.require(:page).permit(:name, :title,:body, :parent_id)
    if permitted[:parent_id].is_a? String
      permitted[:parent_id] = permitted[:parent_id].to_i
    end
    permitted
  end

  def find_page(params)
    return nil if params[:pathee].nil?

    names = params[:pathee].split('/')

    names.each do |name|
      unless Page.exists?(name: name)
        nil
      end
    end

    Page.find_by_name names.last
  end
  # def prepare_page_params
  #   if params[:page] && params[:page][:parent_id]
  #     params[:page][:parent_id] = params[:page][:parent_id].to_i
  #   end
  # end
end
