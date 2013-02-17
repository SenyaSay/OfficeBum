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
  end

  describe :create do
    context "when product was save" do
      it "should be redirected" do
        post :create, :product => { :name => "3r3" } 
        response.should redirect_to(:action => :index)
      end

      it "should create new product" do
        expect { post :create, :product => {:name => "3r3"} }.to change { Product.count }.by(1)
      end
    end

    context "when product wasn't save" do
      it "should render new" do
        post :create, :product => {}
        response.should render_template(:new)
      end
    end
  end

  describe :show do
    let(:product1){ create :product }   

    it "should be success" do
      get :show, {:id => product1.id}
      response.should be_success
    end

    it "should render show" do
      get :show, {:id => product1.id}
      response.should render_template(:show)
    end

    it "should set @product" do
      get :show, {:id => product1.id}
      assigns[:product].should_not be_nil
    end
  end

  describe :edit do
    let(:product1){ create :product }

    it "should be success" do
      get :edit, { :id => product1.id }
      response.should be_success
    end

    it "should render edit" do
      get :edit, { :id => product1.id }
      response.should render_template(:edit)
    end

    it "should set @product" do
      get :edit, { :id => product1.id }
      assigns[:product].should_not be_nil
    end
  end
  
  describe :update do
   let(:product1){ create :product, :name => "qqq" } 
   it "should update attributes" do
     put :update, :id => product1.id, :product => { :name => "eww" }
     product1.reload
     product1.name.should eq("eww")
   end
  end
 
  describe :destroy do
    let!(:product1){ create :product }

    it "should delete" do
      expect { delete :destroy, { :id => product1.id } }.to change{ Product.count }.by(-1)
    end

    it "should render index" do
      delete :destroy, { :id => product1.id }
      response.should redirect_to(:action => :index)
    end
   
   it "should be nil" do
     delete :destroy, { :id => product1.id }
     Product.find_by_id(product1.id).should be_nil
   end
  end
end
