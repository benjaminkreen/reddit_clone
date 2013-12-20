class LinksController < ApplicationController
  def new
    @subs = Sub.all
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def index
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
