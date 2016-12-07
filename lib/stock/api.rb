require 'sinatra/base'
require_relative 't_shirt_repository'
require 'json'

module Stock

  class Api < Sinatra::Base

    set :raise_errors, false
    set :show_exceptions, false

    error do
      e = env['sinatra.error']
      content_type :json
      status 500
      {error: e.message, backtrace: e.backtrace}.to_json
    end

    get '/t-shirt/:name' do
      if (tshirt = TShirtRepository.find_t_shirt_by_name(params[:name]))
        content_type :json
        tshirt.to_json
      else
        status 404
      end
    end

    get '/t-shirt' do
      #sleep 2
      if (tshirt_list = TShirtRepository.find_all_t_shirts)
        content_type :json
        tshirt_list.to_json
      else
        status 404
      end
    end

  end
end
