class Page < ActiveRecord::Base
  belongs_to :parent, class_name: 'Page'
  has_many :subpages, foreign_key: 'parent_id', class_name: 'Page'

  validates :url, presence: true, uniqueness: true
  validates :name, :body, :title, presence: true

  before_validation do
    self.url = "/#{name.downcase}"

    unless parent.nil?
      self.url = parent.url + self.url
    end
  end

  def children
    Page.where parent: self
  end

end
