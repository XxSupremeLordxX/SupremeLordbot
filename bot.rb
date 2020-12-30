require 'telegram/bot'
require_relative 'motivate.rb'


class Bot
  def initialize
    token = '--token--'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'

        bot.api.send_message(chat_id: message.chat.id, text: "Hey, #{message.from.first_name} , I am Supreme Lord's Prophet")

      when '/stop'

        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name} Have a Good Day", date: message.date)
      when '/motivate'
        values = Motivate.new
        value = values.select_random
        bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']} \n\t\t\t- #{value['author']}", date: message.date)
      when '/memes'
        #values = Memes.new
        #meme_url = values['url']
        require 'telegram/bot'
        require 'net/http'
        require 'json'

        url = 'https://meme-api.herokuapp.com/gimme'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data1 = JSON.parse(response)
        meme_url = data1['url']
        meme_title = data1['title']
        bot.api.sendPhoto(chat_id: message.chat.id, photo: meme_url, caption: meme_title, date: message.date)
      else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry , #{message.from.first_name}, you need to use  /start,  /stop , /memes or /motivate")
      end
    end
  end
  end
end
