require 'spec_helper'

describe Admin::CharacteristicsController do

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

    it "should set @characteristics" do
      get :index
      assigns[:characteristics].should_not be_nil
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

    it "should set @characteristic" do
      get :new
      assigns[:characteristic].should_not be_nil
    end
  end

  describe :create do
    context "when characteristic was save" do
      it "should be redirected" do
        post :create, :characteristic => { :name => "hate" } 
        response.should redirect_to(:action => :index)
      end

      it "should create new characteristic" do
        expect { post :create, :characteristic => {:name => "hate"} }.to change { Characteristic.count }.by(1)
      end
    end

    context "when characteristic wasn't save" do
      it "should render new" do
        post :create, :characteristic => {:level => "100"}
        response.should render_template(:new)
      end
    end
  end

  describe :show do
    let(:characteristic){ create :characteristic }   

    it "should be success" do
      get :show, {:id => characteristic.id}
      response.should be_success
    end

    it "should render show" do
      get :show, {:id => characteristic.id}
      response.should render_template(:show)
    end

    it "should set @characteristic" do
      get :show, {:id => characteristic.id}
      assigns[:characteristic].should_not be_nil
    end
  end

  describe :edit do
    let(:characteristic){ create :characteristic }

    it "should be success" do
      get :edit, { :id => characteristic.id }
      response.should be_success
    end

    it "should render edit" do
      get :edit, { :id => characteristic.id }
      response.should render_template(:edit)
    end

    it "should set @characteristic" do
      get :edit, { :id => characteristic.id }
      assigns[:characteristic].should_not be_nil
    end
  end
  
  describe :update do
   let!(:characteristic){ create :characteristic }
   it "should update attributes" do
     put :update, :id => characteristic.id, :characteristic => { :name => "rage" }
     characteristic.reload
     characteristic.name.should eq("rage")
   end
  end
 
  describe :destroy do
    let!(:characteristic){ create :characteristic }

    it "should deleted" do
      expect { delete :destroy, { :id => characteristic.id } }.to change{ Characteristic.count }.by(-1)
    end

    it "should render index" do
      delete :destroy, { :id => characteristic.id }
      response.should redirect_to(:action => :index)
    end
   
   it "should be nil" do
     delete :destroy, { :id => characteristic.id }
     Characteristic.find_by_id(characteristic.id).should be_nil
   end
  end
end
