require 'yaml/store'

class IdeaStore
  def self.all
    ideas = []
    raw_ideas.each_with_index do |data, i|
      ideas << Idea.new(data.merge("id" => i))
    end
    ideas
  end

  def self.update(id, data)
    database.transaction do
      database['ideas'][id] = data
    end
  end

  def self.raw_ideas
    database.transaction do |db|
      db['ideas'] || []
    end
  end

  def self.find(id)
    raw_idea = find_raw_idea(id)
    Idea.new(find_raw.merge("id" => id))
  end

  def self.find_raw_idea(id)
    database.transaction do
      database['ideas'].at(id)
    end
  end

  def self.database
    @database ||= YAML::Store.new "db/ideaboxdb"
  end

  def self.delete(position)
    database.transaction do
      database['ideas'].delete_at(position)
    end
  end
  
  def self.create(attributes)
    database.transaction do
      database['ideas'] ||= []
      database['ideas'] << attributes
    end
  end
end