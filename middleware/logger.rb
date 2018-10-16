require 'logger'

class AppLoger

  def initialize(app, **options)
    @logger = Logger.new(option[:logdev] || STDOUT)
    @app = app
  end

  def call(env)
    @logger.info(env)
    @app.call(env)
  end

end
