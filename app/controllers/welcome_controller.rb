class WelcomeController < ApplicationController
  def index
  end

  def login
  end

  def log
    @usr = params[:post].permit(:login, :password)
    if(@usr[:login] == "vetii" && 
       @usr[:password] == "ploup") then
      redirect_to root_path
    else

      render :login
    end
  end
end
