require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validate_uniqueness_of email' do
    it { should validate_uniqueness_of(:email) }
  end

  describe 'validate_length_of password' do
    it { should ensure_length_of(:password).is_at_least(6) }
  end
end
