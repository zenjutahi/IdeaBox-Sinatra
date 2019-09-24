require 'yaml/store'

class IdeaStore
  def self.all
    raw_ideas.map do |data|
      Idea.new(data)
    end
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
    Idea.new(find_raw_idea(id))
  end

  def self.find_raw_idea(id)
    database.transaction do
      database['ideas'].at(id)
    end
  end

  def self.database
    @database ||= YAML::Store.new "ideaboxdb"
  end

  def self.delete(position)
    database.transaction do
      database['ideas'].delete_at(position)
    end
  end
end