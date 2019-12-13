require 'rails_helper'

RSpec.describe RequestsController, type: :controller do
  before(:all) do
    @request_1 = Request.create(name: "Yimin")
  end
  it "#index" do
    login_with ( :user )
    get :index
    expect(response).to render_template(:index)
  end

  it "#new" do
    login_with ( :user )
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end

  it "#edit" do
    login_with ( :user )
    get :edit, params:{id: @request_1[:id]}
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
  end

  describe "#create" do

    before(:all) do
      @request_params = {name: "yimin"}
    end

    it "creates record without available vehicle and driver" do
      login_with ( :user )
      expect{ post :create, params: {request: @request_params }}.to change{Request.all.size}.by(0)
    end

    it "creates record with available vehicle and driver" do
      @deiver_1 = Driver.create(name: "Yimin")
      vehicles = [{:name => 'Amy'},
                  {:name => 'Jeff'},
                  {:name => 'Sean'},
                  {:name => 'Joe'},
      ]
      @vehicles = vehicles.map { |vehicle| Vehicle.create vehicle }
      login_with ( :user )
      expect{ post :create, params: {request: @request_params }}.to change{Request.all.size}.by(1)
    end

  end

  describe "#update" do
    before(:all) do
      @request_params = {name: "updated request"}
    end

    it "changes record" do
      login_with ( :user )
      #put :update
      post :update, params: {id: @request_1[:id], request: @request_params}
      expect(Request.find(@request_1[:id])[:name]).to eq("updated request")
    end

    it "show a message after update successfully" do
      login_with ( :user )
      post :update, params: {id: @request_1[:id], request: @request_params}
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(flash[:notice]).to include("Request #{assigns(:request).name} was successfully updated.")
    end

    it "redirect on success" do
      login_with ( :user )
      post :update, params: {id: @request_1[:id], request: @request_params}
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(Request)
    end
  end


end