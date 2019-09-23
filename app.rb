require './idea'

class IdeaBoxApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
  end
  
  not_found do
    erb :error
  end
  
  post '/' do
    # 1. Create an idea based on the from parameters
    idea = Idea.new
    # 2. Store is
    idea.save
    # 3. Send user back to index page to see Ideas 
    "Creating an IDEA!"
  end

  get '/' do
    erb :index 
  end
end