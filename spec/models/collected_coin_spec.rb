require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  let(:collected_coin) { CollectedCoin.create() }
  describe 'associations' do
    it { expect(collected_coin).to belong_to(:user) }
  end

  describe 'callbacks' do
    it { expect(collected_coin).to callback(:check_trophy).before(:create)}
    it { expect(collected_coin).to callback(:update_user_coins).after(:create)}
  end

  describe '#check_trophy' do
    context 'when user.coins is 0 and coins value is 1' do
      it 'trophy_lvl must be 1' do
        user = create(:user_with_coins)
        expect(user.collected_coins.first.send(:check_trophy)).to eq([1, '1 Coins collected'])
      end
    end

    context 'when user.coins is < 100 and coins value is >= 100' do
      it 'trophy_lvl must be 2' do
        user = create(:user_with_coins, user_coins: 50)
        expect(user.collected_coins.last.send(:check_trophy)).to eq([2, '100 Coins collected'])
      end
    end

    context 'when user.coins is < 1000 and coins value is >= 1000' do
      it 'trophy_lvl must be 2' do
        user = create(:user_with_coins, user_coins: 950)
        expect(user.collected_coins.last.send(:check_trophy)).to eq([3, '1000 Coins collected'])
      end
    end

    context 'when user.coins is < 10000 and coins value is >= 10000' do
      it 'trophy_lvl must be 2' do
        user = create(:user_with_coins, user_coins: 9950)
        expect(user.collected_coins.last.send(:check_trophy)).to eq([4, '10000 Coins collected'])
      end
    end

    context 'when user.coins is < 10000 and coins value is >= 10000' do
      it 'trophy_lvl must be 2' do
        user = create(:user_with_coins, user_coins: 99_950)
        expect(user.collected_coins.last.send(:check_trophy)).to eq([5, '100000 Coins collected'])
      end
    end

    context 'else' do
      it 'trophy_lvl must be 0' do
        user = create(:user_with_coins, user_coins: 25)
        expect(user.collected_coins.last.send(:check_trophy)).to eq(nil)
      end
    end
  end

  describe '#update_user_coins' do
    it 'check user.update values' do 
      user = create(:user_with_coins, user_coins: 25)
      expect(user.collected_coins.last.send(:update_user_coins)).to eq(user.coins + user.collected_coins.last.value)
    end
  end
end
