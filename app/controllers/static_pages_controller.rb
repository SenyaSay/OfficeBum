class StaticPagesController < StoreController

  def show
    @page = StaticPage.find(params[:id])
  end
end
