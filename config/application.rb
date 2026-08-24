require "bundler/setup"
require "rage"
Bundler.require(*Rage.groups)

require "active_record"
require "rage/all"
require "dotenv/load"

Rage.configure do
  # use this to add settings that are constant across all environments
end

require "rage/setup"
