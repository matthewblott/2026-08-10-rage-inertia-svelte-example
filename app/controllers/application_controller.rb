require_relative "concerns/authentication"

class ApplicationController < RageController::Inertia
  include Authentication

  # inertia_share authenticated: -> { authenticated? }

end
