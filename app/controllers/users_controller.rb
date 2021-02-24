class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Users#Index </h1>" }
      format.json { render json: users }
    end
  end

  def show
    user = User.find_by(id: params[:id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Users#Show </h1>" }
      format.json { render json: user }
    end
  end

  def create
    user = User.new(name: params[:name], last_name: params[:last_name], email: params[:email])

    if user.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json { render json: user }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json { render json: user.errors.full_messages }
      end
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json { render json: user }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json { render json: user.errors.full_messages }
      end
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :last_name, :email)
  end
end
