require 'spec_helper'

describe Page do
  describe '#url' do
    it 'returns url' do
      page1 = Page.new name: 'name1'
      page2 = Page.new name: 'name2', parent: page1
      page3 = Page.new name: 'name3', parent: page2
      expect(page3.url).to eq('/name1/name2/name3')
    end
  end
end
