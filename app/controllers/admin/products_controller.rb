class Admin::ProductsController < Admin::BaseController
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]
  before_filter :find_characteristics, :only => [:new, :edit]
  before_filter :characteristic_params, :only => [:create, :update]

  def index
    @products = Product.page(params[:page]).per(50)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if  @product.save
      @product.update_characteristics @characteristic_params if @characteristic_params
      redirect_to :action => :index
    else
      flash[:error] = @product.errors.full_messages
      render :new
    end
  end

  def show
		
  end

  def edit

  end

  def update
    if @product.update_attributes(params[:product])
      @product.update_characteristics @characteristic_params
      redirect_to :action => :index
    else
      flash[:error] = @product.errors.full_messages
      render :edit
    end 
  end

  def destroy
    @product.destroy
    redirect_to :action => :index
  end		

  private

  def find_characteristics
    @characteristics = Characteristic.all
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def characteristic_params
    @characteristic_params = params[:product].delete(:product_characteristics)
  end
end
