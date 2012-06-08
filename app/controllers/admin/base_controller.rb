class Admin::BaseController < ApplicationController
  layout nil
  before_filter :authenticate_admin!
end
