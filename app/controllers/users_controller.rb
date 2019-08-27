class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shippings = @user.shipping_infos
    @order_details = Order.where(user_id: current_user.id).includes(:order_details).map(&:order_details).flatten
    @setting = Setting.find(1)
  if @user.id != current_user.id
     redirect_to user_path(current_user)
   end 
  end

  def withdraw
  end

  def unsubscribe
  end

    def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to users_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    login_id = current_user.id
    if @user.update(user_params)
      if login_id == @user.id
       bypass_sign_in(@user)
       redirect_to user_path(@user.id)
    else render :edit
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_unsubscribe_path
  end

private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :post_number, :tel, :email, :password, :image, :handlename)
  end

end
