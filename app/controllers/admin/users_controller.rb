class Admin::UsersController < Admin::ApplicationController
    before_action :set_user

    def index
      @users = User.all
    end

  def show
    @user = User.find(params[:id])
  if @user.id != current_user.id
     redirect_to user_path(current_user)
   end
  end

  def deleting
  end

  def deleted
  end

    def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to users_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to users_path
    else render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :post_number, :tel, :email, :password, :image, :handlename, :dl_flg)
  end

end