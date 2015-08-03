class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @muppets = Muppet.all
    render :json => @muppets
  end

  def show
    @muppet = Muppet.find(params[:id])
    render :json => @muppet
  end

  def create
    @muppet = Muppet.new(muppet_params)
    
    if @muppet.save
      render :json => @muppet
    else
      render :json => { :errors => @muppet.errors.full_messages }, :status => 422
    end
  end

  def update
    @muppet = Muppet.find(params[:id])
    
    if @muppet.update(muppet_params)
      render :json => @muppet
    else
      render :json => { :errors => @muppet.errors.full_messages }, :status => 422
    end
  end

  def destroy
    @muppet = Muppet.find(params[:id])
    if @muppet.destroy
      render :json => @muppet
    else
      render :json => { :errors => @muppet.errors.full_messages }, :status => 422
    end
  end

  private

  def muppet_params
    params.permit(:name, :image_url)
  end
end