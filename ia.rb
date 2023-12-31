require_relative 'config.rb'

class Ia
  attr_reader :client, :input

  TOKEN = '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'

  def initialize
    @client = OpenAI::Client.new(access_token: TOKEN)
    @input = ''
  end

  def call
    header
    get_input
    finish
  end

  private

  def header
    puts '-------------------------------'
    puts 'Welcome to OpenAI Test console!'
  end

  def finish
    puts
    puts 'bye bye'
  end

  def get_input
    while input
      print '>> '
      input = gets&.gsub("\n", '')

      break if input == 'exit'

      chat
      puts
    end
  end

  def chat
    response =
      client.chat(
        parameters: {
          model: 'babbage-002',
          messages: [{ role: 'user', content: input }],
          temperature: 0.7
        }
      )

    puts response.dig('choices')
  rescue => e
    puts e
  end
end

ia = Ia.new
ia.call
