require 'spec_helper'

describe LeagueManager::Member do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Member
      expect(object.controller_name).to eq("members")
    end
  end

  context '.get', :vcr do

    context '#index' do
      it 'fetches all active mvp players' do
        result = LeagueManager::Member.get({:method => :mvp})
        expect(result.size).to eq(15)
        expect(result.first.player.member.name).to eq("Boyer, Christophe")
      end

    end

    context  '#search' do
      it 'searches for a member by first and last name' do
        result = LeagueManager::Member.get({:method => :search, :q => "rafal"})
        expect(result.first.firstname).to eq("Rafal")
        expect(result.first.lastname).to eq("Klodzinski")
      end
    end

  end

  context '#top_goalscorers_for_period' do
    it 'fetches top goalscorers by date across the league', :vcr do
      result = LeagueManager::Member.get({:method => :top_goalscorers_for_period, :start_date => "2011-11-03", :end_date => "2011-11-17"})
    end
  end

  context '#show', :vcr do
    it 'fetches all the information about a member' do
      result = LeagueManager::Member.show(2038)
      expect(result.players.count).to eq(4)
      expect(result.players.first.team.division.league.season.year.to_i).to eq(2013)
    end
  end
end