require 'spec_helper'
require 'team'

RSpec.describe Team do
  describe '#initialize' do
    it 'does initialize the appropriate attributes' do
      team = Team.new

      expect(team.members).to eq([])
    end
  end
end
