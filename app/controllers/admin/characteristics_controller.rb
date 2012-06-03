class Admin::CharacteristicsController < ApplicationController

	def index
		@characteristics = Characteristic.find(:all)
	end

	def new
		@characteristic = Characteristic.new
	end

	def create
		tempcharacteristic = params[:characteristic]
		tempcharacteristic[:level] = tempcharacteristic[:level].try(:to_i) 
		@characteristic = Characteristic.new(tempcharacteristic)
		if @characteristic.save
      redirect_to :action => :index
    else
      flash[:error] = @characteristic.errors.full_messages
      render :new
    end
	end

	def show
		@characteristic = Characteristic.find(params[:id])
	end
	
	def edit
		@characteristic = Characteristic.find(params[:id])
	end
	
	def update
		@characteristic = Characteristic.find(params[:id])
		if @characteristic.update_attributes(params[:characteristic])
      redirect_to :action => :index
    else
      flash[:error] = @characteristic.errors.full_messages
      render :edit
    end 
	end

	def destroy
		@characteristic = Characteristic.find(params[:id])
		@characteristic.destroy
		render :index
	end

end
