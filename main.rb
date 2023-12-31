require_relative 'base.rb'

class Main < Base
  attr_reader :input

  def initialize
    @input = ''
  end

  def call
    welcome_message
    get_input
  end

  private

  def get_input
    while input
      print '>> '
      input = gets&.gsub("\n", '')

      break if input == 'exit'

      chat
      puts
    end

    finish_message
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

main = Main.new
main.call
