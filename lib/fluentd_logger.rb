# First argument is tag prefix.
Fluent::Logger::FluentLogger.open(nil, host: 'localhost', port: 24224)

class FluentdLogger
  def self.location(uuid: ,longitude: , latitude: )
        Fluent::Logger.post('location', { uuid: uuid, longitude: longitude, latitude: latitude})
  end
end
