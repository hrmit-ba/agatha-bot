require 'discordrb'
require_relative 'event_list'
require 'dotenv/load'
require 'pry'

@agatha_bot = Discordrb::Commands::CommandBot.new(
  token: ENV["TOKEN"],
  client_id: ENV["C_ID"], prefix: '?',
  help_command: :comlist,
  ignore_bots: true
)

@agatha_bot.command(:comlist) do |event|
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://i.imgur.com/pnTz7VH.png')
    embed.description ="
    > **?comlist**
    Lists all commands.

    > **?who_made_you?**
    Will tell you who's the author of this bot.

    > **?coffee_please**
    Agatha will bring you coffee.

    > **?hello**
    Agatha will say hello to you (not alone anymore).

    > **?fusion_guide**
    Link to Rain's fusion guide

    > **?burn [HP]**
    Use this command so that Agatha tells you how many times you need to attack an outpost to completely burn
    Example: **?burn 21000**

    > **?current_event [new/old]**
    Will tell you what is the current ongoing daily event.
    You can specify old or new based on how old your server is.

    > **?next [event] [new/old]**
    You can specify old or new based on how old your server is.

    The events you can choose from are:
      - **tiger**    [Smiledon Attack]
      - **wolf**     [Wolves]
      - **wish**     [Wish Tree]
      - **troops**   [Fast Training
      - **power**    [Power Up]
      - **research** [Research]
      - **build**    [Building]
      - **rune**     [Whispering of Runes]
      - **clean**    [Clean Up]
      - **barb**     [Barbarian War]

    Example: **?next power new**
    "
  end
end

@agatha_bot.command(:who_made_you?) do |event|
  event.user.pm 'Hrmit Senpai'
end

@agatha_bot.command(:coffee_please) do |event|
  event.user.pm "There you go #{event.user.mention}! ☕"
end

@agatha_bot.command(:hello) do |event|
  event.user.pm "Hello chief #{event.user.mention} how can I help you today?"
end

@agatha_bot.command(:next) do |event|
  params = event.message.content.split(' ')
  return unless params.size > 1

  type = params[2].downcase rescue "old"

  event_list = EventList.new type
  details = event_list.next_event(params[1])

  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF4000
    embed.title = details[:name]
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: details[:thumbnail])
    embed.add_field(name: 'Time until', value: details[:starts_in], inline: false)
    embed.add_field(name: "> Tips", value: details[:tips], inline: false)
  end
end

@agatha_bot.command(:current_event) do |event|
  type = event.message.content.split(' ')[1].downcase rescue "old"

  event_list = EventList.new type
  details = event_list.current_event
  details_count = details.size

  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF4000
    embed.title = details[0][:name]
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: details[0][:thumbnail])
    embed.add_field(name: 'Time remaining', value: details[0][:ends_in], inline: false)
    embed.add_field(name: "> Tips", value: details[0][:tips], inline: false)
  end

  if details_count > 1
    event.user.pm.send_embed do |embed|
      embed.colour = 0xFF8000
      embed.title = details[1][:name]
      embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: details[1][:thumbnail])
      embed.add_field(name: 'Time remaining', value: details[1][:ends_in], inline: false)
      embed.add_field(name: "> Tips", value: details[1][:tips], inline: false)
    end
  end
end

@agatha_bot.command(:burn) do |event|
  params = event.message.content.split(' ')
  return unless params.size > 1
  if params[1].to_i == 0
    event.user.pm "Hello chief, please provide a valid outpost HP as number for example: ?burn 25000"
  else
    event.user.pm "Hello chief, you need to attack tha outpost #{(params[1].to_i/1800.0).ceil}"
  end
end

@agatha_bot.command(:fusion_guide) do |event|
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.title = "Rune fusion quantity requirements"
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/xmzDspf.jpg')
  end
end

@agatha_bot.run

