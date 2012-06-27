require 'spec_helper'

describe Admin::ProductsController do

  before do
    @admin = create(:admin)
    sign_in @admin
  end

  describe :index do
    it "should be success" do
      get :index
      response.should be_success
    end

    it "should render index" do
      get :index
      response.should render_template(:index)
    end

    it "should set @products" do
      get :index
      assigns[:products].should_not be_nil
    end
  end

  describe :new do
    it "should be success" do
      get :new
      response.should be_success
    end

    it "should render new" do
      get :new
      response.should render_template(:new)
    end

    it "should set @product" do
      get :new
      assigns[:product].should_not be_nil
    end

    it "should set @characteristics" do
      get :new
      assigns[:characteristics].should_not be_nil
    end
  end

  describe :create do
    context "when product was save" do
      it "should be redirected" do
        post :create, :product => {:name => "3r3"}
        response.should redirect_to(:action => :index)
      end

      it "should create new product" do
        expect { post :create, :product => {:name => "3r3"} }.to change { Product.count }.by(1)
      end

      it "should receive characteristics" do
        Product.any_instance.should_receive(:update_characteristics).with("name" => "name")
        post :create, :product => {:name => "12", :product_characteristics => {:name => "name"}}
      end
    end

    context "when product wasn't save" do
      it "should render new" do
        post :create, :product => {}
        response.should render_template(:new)
      end
    end
  end
end
