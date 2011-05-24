require 'lib/navigate_by_id'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SetUpDown
end
