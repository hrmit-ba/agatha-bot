require 'discordrb'
require_relative 'event_list'
require 'pry';

@agatha_bot = Discordrb::Commands::CommandBot.new token: 'NzE4MTU3NDQwNjQxOTI1MTcx.Xtk_yw.S-dDI0EDyVoD-9GJ0R-cYalqqDs', client_id: 718157440641925171, prefix: '!'

@agatha_bot.command(:who_made_you?) do |event|
  event.respond 'Senpai!!!'
end

@agatha_bot.command(:coffee_please) do |event|
  event.respond 'There you go Senpai! ☕'
end

@agatha_bot.command(:hello) do |event|
  event.respond "Hello chief #{event.user.mention} how can I help you today?"
end

@agatha_bot.command(:current_event) do |event|
  type = event.message.content.split(' ')[1].downcase rescue "old"

  event_list = EventList.new type
  event.respond "#{event_list.current_event} Anything else I can help you with chief #{event.user.mention}?"
end


@agatha_bot.command(:next) do |event|
  params = event.message.content.split(' ')
  return unless params.size > 1

  type = params[2].downcase rescue "old"

  event_list = EventList.new type
  event.respond "#{event_list.next_event(params[1])} Anything else I can help you with chief #{event.user.mention}?"
end

@agatha_bot.command(:help) do |event|
  event.respond "```
    !who_made_you?
    !coffee_please
    !hello
    !current_event <new/old>
    !next <event> <new/old>
    !help
  ```"
end

@agatha_bot.run

