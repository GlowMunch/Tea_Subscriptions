require 'rails_helper'

RSpec.describe customer do
  describe 'relationships' do
    it { should have_many :subscriptions }
    it { should have_many(:teas).through(:subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of :customername }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :customername }
    it { should validate_uniqueness_of :password }
  end
end
