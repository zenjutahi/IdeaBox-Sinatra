require './idea'
require './idea_store'

class IdeaBoxApp < Sinatra::Base
  set :method_override, true
  
  configure :development do
    register Sinatra::Reloader 
  end
  
  not_found do
    erb :error
  end
  
  get '/' do
    erb :index, locals: {ideas: IdeaStore.all, idea: Idea.new(params)}
  end
  
  post '/' do
    # 1. Create an idea based on the from parameters
    idea = Idea.new(params[:idea])
    # 2. Store it
    idea.save
    # 3. Send user back to index page to see Ideas 
    redirect '/'
  end
  
  get '/:id/edit' do |id|
    idea = IdeaStore.find(id.to_i)
    erb :edit, locals: {id: id, idea: idea}
  end
  
  put '/:id' do |id|
    IdeaStore.update(id.to_i, params[:idea])
    redirect '/'
  end
  
  delete '/:id' do |id|
    IdeaStore.delete(id.to_i)
    redirect '/'
  end

end