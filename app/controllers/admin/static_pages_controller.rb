class Admin::StaticPagesController < Admin::BaseController
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]
  def index
    @pages = StaticPage.all
  end

  def show
  end

  def new
    @page = StaticPage.new
  end

  def create
    @page = StaticPage.new(params[:static_page])
    if @page.save
      redirect_to admin_static_pages_path
    else
      set_flash_error
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:static_page])
      flash[:notice] = 'Category was successfully updated.'
      redirect_to admin_static_page_path(@page)
    else
      set_flash_error
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_static_pages_path
  end

  private

  def find_page
    @page = StaticPage.find(params[:id])
  end
end
