class Page < ActiveRecord::Base
  belongs_to :parent, class_name: 'Page'
  has_many :subpages, foreign_key: 'parent_id', class_name: 'Page'
  validates :url, uniqueness: true
  validates :name, :body, :title, presence: true
  def url
    _url = "/#{name}"
    if parent.nil?
      _url
    else
      parent.url + _url
    end
  end

  def children
    Page.where parent: self
  end

end
