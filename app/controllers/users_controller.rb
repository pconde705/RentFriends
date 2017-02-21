class UsersController < ApplicationController
#   before_action :set_user, only: [:show, :edit, :update, :destroy]

#   def index
#     @users = User.all
#   end

#   def show
#   end

#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(user_params)
#     if @baby.valid?
#       @user.save
#       redirect_to user_path(@user)
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     @user = User.find(params[:id])
#   end

#   def destroy
#     @user.delete
#     redirect_to user_path(@user)
#   end

#   private

#   def user_params
#     params.require(:user).permit(:first_name, :age, :gender)
#   end

#   def set_user
#     @user = User.find(params[:id])
#   end
end
