require 'rails_helper'
require 'rake'
RSpec.describe UsersController, type: :controller do
  before :each do
    create_list(:monster, 5, coins: 50)
    create(:user, id: 2)
  end
  describe '#user' do
    before { get :user }
    it { expect(assigns(:users)).to eq(User.all) }
  end

  describe '#add_user' do
    before { post :add_user, :params =>{ user: 'emanuelsds' } }
    it { expect(assigns(:user)).to eq(User.first) }
    it { expect(response).to redirect_to('/') }
  end

  describe '#game' do
    before { post :game, params: { id: 2 } }
    it { expect(assigns(:monster)).to be_in(Monster.all) }
    it { expect(assigns(:user)).to be_in(User.all) }
  end

  describe '#attack' do
    before { post :attack, params: { id: 2, data: { user: 2, monster: 1 } } }
    let(:attack_post) { post :attack, params: { id: 2, data: { user: 2, monster: 1 } } }
    it { expect(assigns(:user)).to be_in(User.all) }
    it { expect(assigns(:actual_monster)).to be_in(Monster.all) }
    it { expect(assigns(:monster)).to be_in(Monster.all) }
    it { expect(assigns(:user)).to be_in(User.all) }
    it { expect(response).to render_template('game')}
    it { expect { attack_post }.to(change { KilledMonster.count }) }
    it { expect { attack_post }.to(change { Death.count }) }
    it { expect { attack_post }.to(change { CollectedCoin.count }) }
  end
end
