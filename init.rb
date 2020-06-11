require 'discordrb'
require_relative 'event_list'
require 'dotenv/load'

@agatha_bot = Discordrb::Commands::CommandBot.new token: ENV["TOKEN"], client_id: ENV["C_ID"], prefix: '!'

@agatha_bot.command(:who_made_you?) do |event|
  event.user.pm 'Hrmit Senpai'
end

@agatha_bot.command(:coffee_please) do |event|
  event.user.pm "There you go #{event.user.mention}! ☕"
end

@agatha_bot.command(:hello) do |event|
  event.user.pm "Hello chief #{event.user.mention} how can I help you today?"
end

@agatha_bot.command(:current_event) do |event|
  type = event.message.content.split(' ')[1].downcase rescue "old"

  event_list = EventList.new type
  event.user.pm "#{event_list.current_event} Anything else I can help you with chief #{event.user.mention}?"
end


@agatha_bot.command(:next) do |event|
  params = event.message.content.split(' ')
  return unless params.size > 1

  type = params[2].downcase rescue "old"

  event_list = EventList.new type
  event.user.pm "#{event_list.next_event(params[1])} Anything else I can help you with chief #{event.user.mention}?"
end

@agatha_bot.command(:comlist) do |event|
  event.user.pm "```
    !comlist
    !who_made_you?
    !coffee_please
    !hello
    !current_event <new/old>
      eg: !current_event new
    !next <event> <new/old>
          tiger
          wolf
          wish
          troops
          research
          build
          rune
          clean
          barb
      eg: !next research old
  ```"
end

@agatha_bot.run

