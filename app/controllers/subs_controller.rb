class SubsController < ApplicationController
  def new
    @sub = Sub.new
    5.times { @sub.links.build }
  end

  def create
    @sub = Sub.new(params[:sub])
    valid_links = params[:link].select { |link| link.values.none? { |v| v.blank? } }
    valid_links.each do |link|
      @sub.links.build(link)
    end
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
