class QueryOfTheDay
  include ActiveModel::Model
  def query
    raise NotImplementedError
  end
end
