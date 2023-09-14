require 'rails_helper'

RSpec.describe Subscription do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:teas) }
  end
end
