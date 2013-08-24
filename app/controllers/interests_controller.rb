class InterestsController < ApplicationController
  before_action :set_current_user

  def create
    @resource = Resource.find(params[:interest][:resource_id])
    @current_user.interested!(@resource)
    respond_to do |format|
      format.html { redirect_to @resource }
      format.js
    end
  end

  def destroy
    @resource = Resource.find(params[:interest][:resource_id])
    @current_user.not_interested!(@resource)
    respond_to do |format|
      format.html { redirect_to @resource }
      format.js
    end
  end

end
  