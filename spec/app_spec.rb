require 'sinatra/base'
require 'rack/test'
require './lib/app'

describe IdeaBoxApp do
  include Rack::Test::Methods

  def app
    IdeaBoxApp
  end

  it 'includes "Existing Ideas" from the root' do
    get '/'
    expect(last_response.body).to include("Existing Ideas")
  end
  
  it 'includes "Edit Ideas" from the edit page' do
    get '/:id/edit'
    expect(last_response.body).to include("Edit your Idea")
  end
end