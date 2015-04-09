require 'rails_helper'

RSpec.describe Link, :type => :model do
  describe '#valid?' do
    it { should validate_numericality_of(:clicks_count).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:clicks_count) }
    it { should validate_presence_of(:url) }
  end

  describe '#save' do
    let(:link) { FactoryGirl.build(:link) }

    it 'sets short_name' do
      expect {
        link.save
      }.to change(link, :short_name).from(nil).to(String)
    end
  end

  describe '#clicked!' do
    let(:link) { FactoryGirl.build(:link) }

    it 'increments clicks_count by 1' do
      expect {
        link.clicked!
      }.to change(link, :clicks_count).by(1)
    end
  end

  describe '#to_param' do
    let(:link) { FactoryGirl.create(:link) }

    it 'returns the short_name' do
      expect(link.to_param).to eq(link.short_name)
    end
  end
end
