require 'rails_helper'

RSpec.describe Death, type: :model do
  let(:death) { create(:death) }
  describe 'associations' do
    it { expect(death).to belong_to(:user) }
  end

  describe 'callbacks' do
    it { expect(death).to callback(:create_trophy).after(:create) }
  end

  describe '#create_trophy' do
    context 'when deaths.size is 1' do
      it 'trophy_lvl must be 1' do
        user = create(:user)
        deaths = build(:death)
        user.deaths << deaths
        expect(deaths.send(:create_trophy)).to eq([1, '1 Deaths'])
      end
    end
    
    context 'when deaths.size is 10' do
      it 'trophy_lvl must be 2' do
        user = create(:user_with_deaths)
        expect(user.deaths.last.send(:create_trophy)).to eq([2, '10 Deaths'])
      end
    end

    context 'when deaths.size is 1000' do
      it 'trophy_lvl must be 3' do
        user = create(:user_with_deaths, deaths_count: 25)
        expect(user.deaths.last.send(:create_trophy)).to eq([3, '25 Deaths'])
      end
    end

    context 'when deaths.size is 50' do
      it 'trophy_lvl must be 4' do
        user = create(:user_with_deaths, deaths_count: 50)
        expect(user.deaths.last.send(:create_trophy)).to eq([4, '50 Deaths'])
      end
    end

    context 'when deaths.size is 100' do
      it 'trophy_lvl must be 5' do
        user = create(:user_with_deaths, deaths_count: 100)
        expect(user.deaths.last.send(:create_trophy)).to eq([5, '100 Deaths'])
      end
    end
  end
end
