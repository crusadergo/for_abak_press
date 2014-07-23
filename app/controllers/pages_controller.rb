class PagesController < ApplicationController

  def add
    @page = Page.new

    if params.has_key?(:pathee)
      names = params[:pathee].split('/')

      names.each do |name|
        unless Page.exists?(name: name)
          render text: 'Page with name ' + name + ' does not exist' # todo
          return
        end
      end

      page = Page.find_by_name names.last
      if page
        @page.parent = page
      else
        render text: 'page not found'
      end
    end
  end

  def create
    permitted_params = page_params
    @page = Page.new(permitted_params)
    if @page.save
      if permitted_params[:parent_id].nil?
        redirect_to '/'
      end
      parent_page = Page.find_by_id(permitted_params[:parent_id])
      if parent_page.nil?
        redirect_to '/'
      else
        redirect_to parent_page.url
      end
    else
      redirect_to '/'
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

  # def prepare_page_params
  #   if params[:page] && params[:page][:parent_id]
  #     params[:page][:parent_id] = params[:page][:parent_id].to_i
  #   end
  # end
end
