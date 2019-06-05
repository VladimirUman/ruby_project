uri = URI.parse('redis://safe-castle-59654.herokuapp.com:6379/1')
REDIS = Redis.new(:url => uri)