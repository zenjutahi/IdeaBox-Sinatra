# require './test/test_helper'
# require 'sinatra/base'
# require 'rack/test'
# require './lib/app'
# 
# 
# class IdeaboxAppTest < Minitest::Test
#   include Rank::Test::Methods
# 
#   def app
#     IdeaboxApp
#   end
# 
#   def test_hello
#     get '/'
#     assert_includes "Existing Ideas", last_response.body
#   end
# end