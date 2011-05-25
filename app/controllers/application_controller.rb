require 'lib/set_up_down'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SetUpDown
end
