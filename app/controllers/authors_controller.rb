class AuthorsController < ApplicationController
  before_action :logged_in?, except: [:new, :create]
  before_action :set_author, only: [:edit, :update, :destroy]

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find_by_id(session[:user_id])
  end

  def create
    @author = Author.new(author_params)
      if @author.save
        session[:user_id] = @author.id
        redirect_to root_url, notice: 'Welcome! Create a survey.'
      else
        render :new
      end
  end

  def update
    if @author.update(author_params)
      redirect_to root_url, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name, :email, :password, :password_confimation)
    end
end
