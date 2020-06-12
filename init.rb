require 'discordrb'
require_relative 'event_list'
require 'dotenv/load'

@agatha_bot = Discordrb::Commands::CommandBot.new(
  token: ENV["TOKEN"],
  client_id: ENV["C_ID"], prefix: '!',
  help_command: :comlist,
  ignore_bots: true
)

@agatha_bot.command(:comlist) do |event|
  event.user.pm.send_embed do |embed|
    embed.colour = 0xFF8000
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://i.imgur.com/pnTz7VH.png')
    embed.description ="
    > **!comlist**
    Lists all commands.

    > **!who_made_you?**
    Will tell you who's the author of this bot.

    > **!coffee_please**
    Agatha will bring you coffee.

    > **!hello**
    Agatha will say hello to you (not alone anymore).

    > **!current_event [new/old]**
    Will tell you what is the current ongoing daily event.
    You can specify old or new based on how old your server is.

    > **!next [event] [new/old]**
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

    Example: **!next power new**
    "

    #embed.add_field(name: "> !who_made_you?", value:"Who made this bot", inline: false)
    #embed.add_field(name: "> !coffee_please", value: "Agatha gets you coffee :)", inline: false)
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

@agatha_bot.command(:schedule) do |event|
  event.channel.send_embed do |embed|
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/TP0BKka.png')
    embed.add_field(name: "Current Event", value:"Power UP - 00:32:12 Remaining", inline: false)
    embed.add_field(name: "Tips", value: "Use https://bautils.herokuapp.com/ to calculate minimum required troop to get all 3 rewards.", inline: false)
  end
end

@agatha_bot.run

