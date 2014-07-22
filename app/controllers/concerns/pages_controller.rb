class PagesController < ApplicationController
  def add
    @page = Page.new
  end
end
