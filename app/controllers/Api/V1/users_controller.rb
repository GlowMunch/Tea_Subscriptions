class UserContrller < ApplicationController
  def create
    @user = user.new(params)
    if @user.save

    end
  end

end