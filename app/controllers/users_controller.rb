class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    # @user = User.new(params[:user])
    # if @user.save
    #   if params[:user][:image].present?
    #     render 'crop'
    #   else
    #     session[:user_id] = @user.id
    #     redirect_to root_url
    #     flash[:success] = "Welcome to Defy!"
    #   end
    # else
    #   render "new"
    # end
    @user = User.new(params[:user])
    if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
        flash[:success] = "Welcome to Defy!"
    else
      render "new"
    end
  end

  def update
    # @user = User.find(params[:id])
    # if @user.update_attributes(params[:user])
    #   if params[:user][:image].present?
    #     render "crop"
    #   else
    #     flash[:success] = "Profile updated."
    #     redirect_to @user
    #   end
    # else
    #   redirect_to @user
    # end
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
    end
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end
end
