module LeagueManager
  class Division < LeagueManager::Base
    attr_reader :active, :schedule_updated_at
  end
end