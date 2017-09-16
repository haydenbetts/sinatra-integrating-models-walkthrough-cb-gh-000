require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    # right we don't just pass data into instance variables
    # so we can use them in view, but also whole object instances
    @analyzed_text = TextAnalyzer.new(text_from_user)

    erb :results
  end
end
