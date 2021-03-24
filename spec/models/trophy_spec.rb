require 'rails_helper'

RSpec.describe Trophy, type: :model do
  let(:trophy) { create(:trophy) }
  describe 'associations' do
    it { expect(trophy).to belong_to(:user) }
  end

  describe 'validations' do
    it { expect(trophy).to_not allow_value(nil).for(:user_id) }
    it { expect(trophy).to_not allow_value(nil).for(:level) }
    it { expect(trophy).to_not allow_value(nil).for(:trophy) }
  end
end
