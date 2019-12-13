require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before(:all) do
    @event_1 = Event.create(title: 'Sean Chen', start: '2019-12-11 07:00:00', end: '2019-12-11 10:30:00',
                            created_at: '2019-12-11 01:31:41.917235', updated_at: '2019-12-11 01:31:41.917235',
                            frequency: 'weekly', driver_id: 6)
  end
  describe "#create" do

    before(:all) do
      @event_params = {title: 'Sean Chen', start: '2019-12-13 07:00:00', end: '2019-12-13 10:30:00',
                        frequency: 'weekly', driver_id: 6}
    end

    it "creates record" do
      login_with ( :user )
      expect{ post :create, params: {event: @event_params }}.to change{Event.all.size}.by(1)
    end

    it "redirect on success" do
      login_with ( :user )
      post :create, params: {event: @event_params }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(schedules_path)
    end

    # describe "#update" do #EventsController#update is missing a template for this request format and variant.
    #   before(:all) do
    #     @driver_params = {name: "yimin"}
    #     @single_event_params = {start: '2019-12-17 07:00:00', end: '2019-12-17 10:30:00',}
    #   end
    #
    #   it "changes single event record" do
    #     login_with ( :user )
    #     #put :update
    #     post :update, params: {id: @event_1[:id], single_event: @single_event_params}
    #     expect(Driver.find(@event_1[:id])[:start]).to eq(@single_event_params[:start])
    #     expect(Driver.find(@event_1[:id])[:end]).to eq(@single_event_params[:end])
    #   end
    #
    #   it "show a message after update successfully" do
    #     login_with ( :user )
    #     post :update, params: {id: @deiver_1[:id], driver: @driver_params}
    #     expect(response).not_to have_http_status(200)
    #     expect(response).to have_http_status(302)
    #     expect(flash[:notice]).to include("Driver #{assigns(:driver).name} was successfully updated.")
    #   end
    #
    #   it "redirect on success" do
    #     login_with ( :user )
    #     post :update, params: {driver: @driver_params, id: @deiver_1[:id]}
    #     expect(response).not_to have_http_status(200)
    #     expect(response).to have_http_status(302)
    #     expect(response).to redirect_to(Driver)
    #   end
    #
    #
    # end
  end
end