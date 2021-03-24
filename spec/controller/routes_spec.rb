require 'rails_helper'

RSpec.describe 'routes for Users', type: :routing do
  describe 'routing' do
    it { expect(get('/')).to route_to('users#user') }
    it { expect(post('/add_user')).to route_to('users#add_user') }
    it { expect(post('/game')).to route_to('users#game') }
    it { expect(post('/attack')).to route_to('users#attack') }
  end
end
