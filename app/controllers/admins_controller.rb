class AdminsController < ApplicationController
  before_action :authenticate_leader!
end
