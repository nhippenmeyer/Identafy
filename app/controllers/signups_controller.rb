class SignupsController < ApplicationController

  respond_to :json

  def create
    @signup = Signup.new(signup_params)
    @signup.save
    respond_with @signup
  end

  private

  def signup_params
    params.require(:signup).permit(:email)
  end

end