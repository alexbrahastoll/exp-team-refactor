require 'spec_helper'
require 'team'

RSpec.describe Team do
  describe '#initialize' do
    it 'does initialize the appropriate attributes' do
      team = Team.new

      expect(team.members).to eq([])
    end
  end

  describe '#add_member' do
    it 'does add a member to the team' do
      team = Team.new
      member_name = 'Alex'
      expected_team_members = [Team::Member.new(member_name)]

      team.add_member(member_name)

      expect(team.members).to eq(expected_team_members)
    end
  end
end
