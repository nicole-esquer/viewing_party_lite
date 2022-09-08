class UsersController < ApplicationController
   def new
   end

   def create
      # user = User.create(user_params)
      # if user.save
      #    redirect_to user_path(user.id)
      #    flash[:success] = "Welcome, #{user.name}"
      # else
      #    redirect_to "/register"
      # end   
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         redirect_to dashboard_path(user)
         flash[:notice] = "Welcome #{user.name}"
      end
   end

   def show
      @user = User.find(params[:id])
   end

   def login_form
   end

   def login_user
      user = User.find_by(email: params[:email])

      if user
         if user.authenticate(params[:password])
            redirect_to user_path(user)
         else
            flash[:alert] = 'Invalid password'
            redirect_to '/login'
         end
      else
         flash[:alert] = 'Invalid email'
         redirect_to '/login'
      end
   end

   private

   def user_params
      permit(:name, :email, :password, :password_confirmation)
      # params.require(:user).permit(:name, :email, :password)
   end
end