class Admin::ProductsController < ApplicationController
	before_filter :product_find, :only => [:show, :edit, :update, :destroy]

	def index
		@products = Product.find(:all)
	end

	def new
		@product = Product.new
	end

	def create
		tempproduct = params[:product]
		tempproduct[:price] = tempproduct[:price].try(:to_d) 
		tempproduct[:image] = tempproduct[:image].try(:to_s)
		@product = Product.new(tempproduct)
		if @product.save
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
			redirect_to :action => :index
		else
			flash[:error] = @characteristic.errors.full_messages
			render :edit
		end 
	end

	def destroy
		@product.destroy
		redirect_to :action => :index
	end		

private

	def product_find
		@product = Product.find(params[:id])
	end
end
