require_relative 'config.rb'

class Base
  def client
    @client ||= OpenAI::Client.new(access_token: ENV.fetch('GPT_TOKEN'))
  end

  def welcome_message
    puts '-------------------------------'
    puts 'Welcome to OpenAI Test console!'
  end

  def finish_message
    puts
    puts 'bye bye'
  end
end
