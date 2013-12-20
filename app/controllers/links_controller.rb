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
    @subs = Sub.all
    @link = Link.find(params[:id])
    if @link.user_id == current_user.id
      render :edit
    else
      flash[:errors] = ["Not your link to edit mofo."]
      redirect_to user_url(current_user)
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to user_url(current_user)
  end
end
