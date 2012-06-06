class Admin::CharacteristicsController < ApplicationController
	before_filter :characteristic_find, :only => [:show, :edit, :update, :destroy]
	before_filter :authenticate_admin!
public
	
	def index
		@characteristics = Characteristic.all
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
