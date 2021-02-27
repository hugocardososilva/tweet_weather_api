# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :user, only: %i[show update destroy]

      # GET /api/v1/users
      # GET /api/v1/users.json
      def index
        @user = User.all
      end

      # GET /api/v1/users/1
      # GET /api/v1/users/1.json
      def show; end

      # POST /api/v1/users
      # POST /api/v1/users.json
      def create
        @user = User.new(user_params)

        if @user.save
          render :show, status: :created, location: { user: @user }
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1
      # PATCH/PUT /api/v1/users/1.json
      def update
        if @user.update(user_params)
          render :show, status: :ok, location: { user: @user }
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      # DELETE /api/v1/users/1.json
      def destroy
        @user.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def user
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :email, :name, :password,
                                     setting_attributes: %i[
                                       id openwather_key twitter_access_token_secret twitter_access_token lang units user_id
                                     ])
      end
    end
  end
end
