require 'rails_helper'

RSpec.describe KilledMonster, type: :model do
  let(:killed_monster) { create(:killed_monster) }
  describe 'associations' do
    it { expect(killed_monster).to belong_to(:user) }
    it { expect(killed_monster).to belong_to(:monster) }
  end

  describe 'callbacks' do
    it { expect(killed_monster).to callback(:create_trophy).after(:create) }
  end

  describe '#create_trophy' do
    context 'when killed_mosters.size is 1' do
      it 'trophy_lvl must be 1' do
        user = create(:user_with_killed_monsters, killed_monsters_count: 1)
        expect(user.killed_monsters.last.send(:create_trophy)).to eq([1, '1 Bowser killed'])
      end
    end

    context 'when killed_monsters.size is 100' do
      it 'trophy_lvl must be 2' do
        user = create(:user_with_killed_monsters)
        expect(user.killed_monsters.last.send(:create_trophy)).to eq([2, '100 Bowser killed'])
      end
    end

    # Os testes abaixo estao comentados devido a demora para finalizar

    context 'when killed_monsters.size is 1000' do
      it 'trophy_lvl must be 3' do
        user = create(:user_with_killed_monsters, killed_monsters_count: 1000)
        expect(user.killed_monsters.last.send(:create_trophy)).to eq([3, '1000 Bowser killed'])
      end
    end

    # Os testes abaixo estao comentados devido a demora para finalizar

    # context 'when killed_monsters.size is 10000' do
    #   it 'trophy_lvl must be 4' do
    #     user = create(:user_with_killed_monsters, killed_monsters_count: 10000)
    #     expect(user.killed_monsters.last.send(:create_trophy)).to eq([4, '10000 Bowser killed'])
    #   end
    # end

    # context 'when killed_monsters.size is 100000' do
    #   it 'trophy_lvl must be 5' do
    #     user = create(:user_with_killed_monsters, killed_monsters_count: 100000)
    #     expect(user.killed_monsters.last.send(:create_trophy)).to eq([5, '100000 Bowser killed'])
    #   end
    # end
  end
end