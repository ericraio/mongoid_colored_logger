require 'mongoid_colored_logger/logger_decorator'

module MongoidColoredLogger

  class Railtie < Rails::Railtie
    base = config.mongoid

    initializer 'logger_decorator', :after => :logger do
      base.logger = MongoidColoredLogger::LoggerDecorator.new(Rails.logger)
    end

    # Make it output to STDERR in console
    console do |app|
      base.logger = MongoidColoredLogger::LoggerDecorator.new(Logger.new(STDERR))
    end
  end
end
