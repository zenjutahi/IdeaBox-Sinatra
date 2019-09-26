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
end