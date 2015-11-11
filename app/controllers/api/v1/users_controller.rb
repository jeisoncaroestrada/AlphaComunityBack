class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    session[:current_user_id] = 'User.params[:email]'
    render json: @users
  end

  # POST /login
  # POST /login.json
  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # Log the user in and redirect to the user's show page.
      #render json: @user, status: :created
      render json: user, status: :created
    else
      # Create an error message.
      #render json: @user.errors, status: :unprocessable_entity
    end
  #   require 'digest/sha1'
  #   @user = User.new(login_params)
    
  #   if @user.save
  #     @user.password = Digest::SHA1.hexdigest(login_params[:password])
  #     @user.save
  #     render json: @user, status: :created
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_email(params[:email])
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    require 'digest/sha1'
    @user = User.new(user_params)
    
    if @user.save
      @user.password = Digest::SHA1.hexdigest(user_params[:password])
      @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def login_params
      params.require(:user).permit(:email, :password)
    end

    def user_params
      params.require(:user).permit(:name1, :name2, :lastname1, :lastname2, :email, :address, :phone, :password, :password_confirmation,:i_accept_terms_and_conditions)
    end
end
