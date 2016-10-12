class IndexController < ApplicationController
  def main
    FluentdLogger.location(uuid: 'hoge', longitude: 30, latitude: 30)
    render text: 'test'
  end
end
