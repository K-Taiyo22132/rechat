class ApplicationController < ActionController::Base
include SessionsHelper
include GroupsHelper
before_action :require_login
end
