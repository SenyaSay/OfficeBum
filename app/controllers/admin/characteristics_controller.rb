class Admin::CharacteristicsController < Admin::BaseController
  before_filter :characteristic_find, :only => [:show, :edit, :update, :destroy]

  def index
    @characteristics = Characteristic.all
  end

  def new
    @characteristic = Characteristic.new
  end

  def create
    @characteristic = Characteristic.new(params[:characteristic])
    if @characteristic.save
      redirect_to :action => :index
    else
      flash[:error] = @characteristic.errors.full_messages
      render :new
    end
  end

  def show

  end
	
  def edit

  end
	
  def update
    if @characteristic.update_attributes(params[:characteristic])
      redirect_to :action => :index
    else
      flash[:error] = @characteristic.errors.full_messages
      render :edit
    end 
  end

  def destroy
    @characteristic.destroy
    redirect_to :action => :index
  end

  private

  def characteristic_find
    @characteristic = Characteristic.find(params[:id])
  end

end
