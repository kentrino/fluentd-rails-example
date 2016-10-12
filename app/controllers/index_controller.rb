class IndexController < ApplicationController
  def main
    logger.debug('test')
    FluentdLogger.new
    render text: 'test'
  end
end