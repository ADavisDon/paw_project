class PawStaffController < ApplicationController
  skip_before_action :admin, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

end