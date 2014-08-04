require 'rails_helper'

RSpec.describe Link, :type => :model do
  describe '#valid?' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:clicks_count) }
    it { should validate_numericality_of(:clicks_count)}
  end

  describe '#clicks_count' do 
    it 'should be 0 for new link' do
      expect(Link.new.clicks_count).to eq(0)
    end
  end
    
  let(:link) { FactoryGirl.build(:link) }
  
  describe '#save' do
    it 'sets short_name' do
      expect {
        link.save
      }.to change(link, :short_name).from(nil).to(String)
    end
  end

  describe '#to_param' do
    it 'returns the short_name' do
      expect(link.to_param).to eq(link.short_name)
    end
  end

  describe '#clicked!' do
    it'increments click count by 1' do
      expect {link.clicked!}.to change(link, :clicks_count).by(1)
    end
  end
end
