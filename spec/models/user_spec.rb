require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe 'associations' do
    it { expect(user).to have_many(:deaths) }
    it { expect(user).to have_many(:killed_monsters) }
    it { expect(user).to have_many(:collected_coins) }
    it { expect(user).to have_many(:trophys) }
  end

  describe 'validations' do
    it { expect(user).to_not allow_value(nil).for(:name) }
    it { expect(user).to validate_length_of(:name).is_at_least(2).is_at_most(20) }
    it { expect(user).to_not allow_value(nil).for(:coins) }
  end
end
