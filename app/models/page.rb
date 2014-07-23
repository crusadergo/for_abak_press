class Page < ActiveRecord::Base
  belongs_to :parent, class_name: 'Page'
  has_many :subpages, foreign_key: 'parent_id', class_name: 'Page'

  def url
    _url = "/#{name}"
    if parent.nil?
      _url
    else
      parent.url + _url
    end
  end
end