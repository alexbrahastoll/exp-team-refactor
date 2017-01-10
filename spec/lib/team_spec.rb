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

  describe '#member_names' do
    it 'does return an array with the names of the members of the team' do
      team = Team.new
      team.add_member('Alex')
      team.add_member('Anna')
      expected_member_names = ['Alex', 'Anna']

      expect(team.member_names).to eq(expected_member_names)
    end
  end

  describe '#print_member_names' do
    let(:team) do
      team = Team.new
      team.add_member('aLEX')
      team.add_member('aNNA')
      team.add_member('jAN')

      team
    end

    context 'when we want just part of the members and want to capitalize their names' do
      it 'does print the member names' do
        expect($stdout).to receive(:puts).with('Alex').ordered
        expect($stdout).to receive(:puts).with('Anna').ordered

        team.print_member_names(limit: 2,
          member_name_presentation: ->(name) { puts name.capitalize })
      end
    end

    context 'when we want to revert their order and also revert and downcase their names' do
      it 'does print the member names' do
        expect($stdout).to receive(:puts).with('naj').ordered
        expect($stdout).to receive(:puts).with('anna').ordered
        expect($stdout).to receive(:puts).with('xela').ordered

        team.print_member_names(member_names_transformation: :reverse,
          member_name_presentation: ->(name) { puts name.reverse.downcase })
      end
    end

    context 'when we want to have a title printed before the member names list' do
      context 'when we want to print them in their original order' do
        it 'does print the member names' do
          expect($stdout).to receive(:puts).with('Members:').ordered
          expect($stdout).to receive(:puts).with('aLEX').ordered
          expect($stdout).to receive(:puts).with('aNNA').ordered
          expect($stdout).to receive(:puts).with('jAN').ordered

          team.print_member_names(title: 'Members:')
        end
      end

      context 'when we want to shuffle the members' do
        it 'does print the member names' do
          expect($stdout).to receive(:puts).with('Members:').ordered
          expect($stdout).to receive(:puts).with('aLEX')
          expect($stdout).to receive(:puts).with('aNNA')
          expect($stdout).to receive(:puts).with('jAN')

          team.print_member_names(title: 'Members:',
            member_names_transformation: :shuffle)
        end
      end
    end
  end
end
