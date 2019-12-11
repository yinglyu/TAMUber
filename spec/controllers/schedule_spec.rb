require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do

  it "#index" do
    login_with ( :user )
    get :index
    expect(response).to render_template(:index)
  end


end