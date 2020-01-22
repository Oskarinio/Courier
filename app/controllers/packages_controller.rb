class PackagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]
  before_action :correct_user,   only: [:update, :destroy]

  def create
    @package = current_user.packages.build(package_params)
    if @package.save
      flash[:success] = "Package created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def update
    @package.status = "Delivered"
    flash[:success] = "Status changed"
    redirect_to request.referrer || root_url
  end

  def destroy
    @package.destroy
    flash[:success] = "Package deleted"
    redirect_to request.referrer || root_url
  end

  private

    def package_params
      params.require(:package).permit(:adress)
    end

    def correct_user
      @package = current_user.packages.find_by(id: params[:id])
      redirect_to root_url if @package.nil?
    end
end
