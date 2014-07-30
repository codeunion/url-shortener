require 'rails_helper'

RSpec.describe Link, :type => :model do
  describe '#valid?' do
    it { should validate_presence_of(:url) }
    it { should validate_numericality_of(:clicks_count).only_integer }
  end

  describe '#save' do
    let(:link) { FactoryGirl.build(:link) }

    it 'sets short_name' do
      expect {
        link.save
      }.to change(link, :short_name).from(nil).to(String)
    end
  end

  describe '#to_param' do
    let(:link) { FactoryGirl.create(:link) }

    it 'returns the short_name' do
      expect(link.to_param).to eq(link.short_name)
    end
  end

  describe '#clicks_count' do
    it 'should be 0 for a new Link' do
      expect(Link.new.clicks_count).to eq(0)
    end
  end

  describe '#click!' do
    let(:link) { FactoryGirl.create(:link) }

    it 'increments the click count' do
      expect {
        link.click!
      }.to change(link, :clicks_count).by(1)
    end
  end
end
