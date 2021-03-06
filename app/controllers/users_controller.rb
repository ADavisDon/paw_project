# frozen_string_literal: true

#:nodoc:
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:username)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          redirect_to users_url,
                      notice: 'User was successfully created.'
        end
      else
        format.html { render :new }
        format.json do
          render json: @user.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to users_url,
                      notice: 'User was successfully updated.'
        end
        format.json do
          render :show,
                 status: :ok,
                 location: @user
        end
      else
        format.html { render :edit }
        format.json do
          render json: @user.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url,
                    notice: 'User was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :password_confirmation)
  end
end
