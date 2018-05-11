class BaseController < ApplicationController
  def create
    model = build_model
    if model.save
      redirect_to model.account
    else
      render :new
    end
  end

  def update
    if update_model
      redirect_to model.account
    else
      render :edit
    end
  end
end
