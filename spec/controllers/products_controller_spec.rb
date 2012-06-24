require 'spec_helper'

describe ProductsController do

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
end
