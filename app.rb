require './idea'

class IdeaBoxApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
  end
  
  not_found do
    erb :error
  end
  
  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end
  
  post '/' do
    # 1. Create an idea based on the from parameters
    idea = Idea.new params['idea_title'], params['idea_description']
    # 2. Store it
    idea.save
    # 3. Send user back to index page to see Ideas 
    redirect '/'
  end

end