# frozen_string_literal: true

#:nodoc:
class WelcomeController < ApplicationController
  skip_before_action :authorize
  skip_before_action :admin
end
