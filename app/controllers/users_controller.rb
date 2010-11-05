class UsersController < ApplicationController
  
  load_and_authorize_resource
  
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
    @user = User.new(params[:user])

    if params[:commit] == "Cancel"
      redirect_to(users_url)
    elsif @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to(@user)
    else
      render :action => "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to(users_url)
    else
      @user = User.find(params[:id])

      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        redirect_to(@user)
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
  end
  
  def edit_password
    @user = User.new
    @user.id = params[:id]
  end
  
  def update_password
    @user = User.find(params[:id])
    
    if params[:commit] == "Cancel"
      redirect_to(users_url)
    else
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Password was successfully updated.'
        redirect_to edit_user_password_path(@user)
      else
        render :action => "edit_password"
      end
    end
  end
  
end
