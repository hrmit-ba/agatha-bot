require_relative 'timeline'
require 'active_support/all'

class EventList
  attr_accessor :event_list

  NEW_EVENT_LIST = [
      {
         day: 0,
         time: 0,
         event_name: "clean"
      },{
         day: 0,
         time: 1,
         event_name: "power"
      },{
         day: 0,
         time: 2,
         event_name: "research"
      },{
         day: 0,
         time: 3,
         event_name: "build"
      },{
         day: 0,
         time: 4,
         event_name: "troops"
      },{
         day: 0,
         time: 5,
         event_name: "wish"
      },{
         day: 1,
         time: 0,
         event_name: "build"
      },{
         day: 1,
         time: 1,
         event_name: "troops"
      },{
         day: 1,
         time: 2,
         event_name: "wish"
      },{
         day: 1,
         time: 3,
         event_name: "rune"
      },{
         day: 1,
         time: 4,
         event_name: "power"
      },{
         day: 1,
         time: 5,
         event_name: "research"
      },{
         day: 2,
         time: 0,
         event_name: "troops"
      },{
         day: 2,
         time: 1,
         event_name: "wish"
      },{
         day: 2,
         time: 2,
         event_name: "clean"
      },{
         day: 2,
         time: 3,
         event_name: "power"
      },{
         day: 2,
         time: 4,
         event_name: "research"
      },{
         day: 2,
         time: 5,
         event_name: "build"
      },{
         day: 3,
         time: 0,
         event_name: "wolf"
      },{
         day: 3,
         time: 1,
         event_name: "wolf"
      },{
         day: 3,
         time: 2,
         event_name: "troops"
      },{
         day: 3,
         time: 3,
         event_name: "wish"
      },{
         day: 3,
         time: 4,
         event_name: "power"
      },{
         day: 3,
         time: 5,
         event_name: "rune"
      },{
         day: 4,
         time: 0,
         event_name: "power"
      },{
         day: 4,
         time: 1,
         event_name: "rune"
      },{
         day: 4,
         time: 2,
         event_name: "research"
      },{
         day: 4,
         time: 3,
         event_name: "build"
      },{
         day: 4,
         time: 4,
         event_name: "clean"
      },{
         day: 4,
         time: 5,
         event_name: "troops"
      },{
         day: 5,
         time: 0,
         event_name: "barb"
      },{
         day: 5,
         time: 1,
         event_name: "barb"
      },{
         day: 5,
         time: 2,
         event_name: "barb"
      },{
         day: 5,
         time: 3,
         event_name: "barb"
      },{
         day: 5,
         time: 4,
         event_name: "barb"
      },{
         day: 5,
         time: 5,
         event_name: "barb"
      },{
         day: 6,
         time: 0,
         event_name: "power"
      },{
         day: 6,
         time: 1,
         event_name: "research"
      },{
         day: 6,
         time: 2,
         event_name: "build"
      },{
         day: 6,
         time: 3,
         event_name: "troops"
      },{
         day: 6,
         time: 4,
         event_name: "wish"
      },{
         day: 6,
         time: 5,
         event_name: "clean"
      },{
         day: 3,
         time: 0,
         event_name: "tiger"
      },{
         day: 3,
         time: 1,
         event_name: "tiger"
      },{
         day: 3,
         time: 2,
         event_name: "tiger"
      },{
         day: 3,
         time: 3,
         event_name: "tiger"
      },{
         day: 3,
         time: 4,
         event_name: "tiger"
      },{
         day: 3,
         time: 5,
         event_name: "tiger"
      }
   ]

  OLD_EVENT_LIST = [
      {
         day: 0,
         time: 0,
         event_name: "clean"
      },{
         day: 0,
         time: 1,
         event_name: "power"
      },{
         day: 0,
         time: 2,
         event_name: "research"
      },{
         day: 0,
         time: 3,
         event_name: "rune"
      },{
         day: 0,
         time: 4,
         event_name: "troops"
      },{
         day: 0,
         time: 5,
         event_name: "wish"
      },{
         day: 1,
         time: 0,
         event_name: "research"
      },{
         day: 1,
         time: 1,
         event_name: "troops"
      },{
         day: 1,
         time: 2,
         event_name: "wish"
      },{
         day: 1,
         time: 3,
         event_name: "clean"
      },{
         day: 1,
         time: 4,
         event_name: "power"
      },{
         day: 1,
         time: 5,
         event_name: "build"
      },{
         day: 2,
         time: 0,
         event_name: "troops"
      },{
         day: 2,
         time: 1,
         event_name: "wish"
      },{
         day: 2,
         time: 2,
         event_name: "clean"
      },{
         day: 2,
         time: 3,
         event_name: "power"
      },{
         day: 2,
         time: 4,
         event_name: "research"
      },{
         day: 2,
         time: 5,
         event_name: "rune"
      },{
         day: 3,
         time: 0,
         event_name: "research"
      },{
         day: 3,
         time: 1,
         event_name: "rune"
      },{
         day: 3,
         time: 2,
         event_name: "troops"
      },{
         day: 3,
         time: 3,
         event_name: "wish"
      },{
         day: 3,
         time: 4,
         event_name: "wolf"
      },{
         day: 3,
         time: 5,
         event_name: "wolf"
      },{
         day: 4,
         time: 0,
         event_name: "rune"
      },{
         day: 4,
         time: 1,
         event_name: "wish"
      },{
         day: 4,
         time: 2,
         event_name: "power"
      },{
         day: 4,
         time: 3,
         event_name: "research"
      },{
         day: 4,
         time: 4,
         event_name: "build"
      },{
         day: 4,
         time: 5,
         event_name: "troops"
      },{
         day: 5,
         time: 0,
         event_name: "barb"
      },{
         day: 5,
         time: 1,
         event_name: "barb"
      },{
         day: 5,
         time: 2,
         event_name: "barb"
      },{
         day: 5,
         time: 3,
         event_name: "barb"
      },{
         day: 5,
         time: 4,
         event_name: "barb"
      },{
         day: 5,
         time: 5,
         event_name: "barb"
      },{
         day: 6,
         time: 0,
         event_name: "power"
      },{
         day: 6,
         time: 1,
         event_name: "research"
      },{
         day: 6,
         time: 2,
         event_name: "rune"
      },{
         day: 6,
         time: 3,
         event_name: "troops"
      },{
         day: 6,
         time: 4,
         event_name: "wish"
      },{
         day: 6,
         time: 5,
         event_name: "clean"
      },{
         day: 3,
         time: 0,
         event_name: "tiger"
      },{
         day: 3,
         time: 1,
         event_name: "tiger"
      },{
         day: 3,
         time: 2,
         event_name: "tiger"
      },{
         day: 3,
         time: 3,
         event_name: "tiger"
      },{
         day: 3,
         time: 4,
         event_name: "tiger"
      },{
         day: 3,
         time: 5,
         event_name: "tiger"
      }
   ]

   DISPLAY_EVENTS = {
      tiger: "Smiledon Attack",
      wolf:  "Wolves",
      wish:  "Wish Tree",
      troops: "Fast Training",
      research: "Research",
      build: "Building",
      rune:  "Whispering of Runes",
      clean: "Clean Up",
      power: "Power Up",
      barb: "Barbarian War"
   }

  def initialize(type)
    @event_list = []
    @day = Time.now.utc.wday - 1
    @time = Time.now.utc.hour/4

    (type == "new" ? NEW_EVENT_LIST : OLD_EVENT_LIST).each do |event|
      @event_list << ::Timeline.new(event)
    end
  end

  def current_event
    current_events = @event_list.select do |event|
      event.day == @day && event.time == @time
    end

    if current_events.size > 1
      ev_list = current_events.map { |ev| DISPLAY_EVENTS[ev.event_name.to_sym] }.join(", ")
      return "Current running events are: #{ev_list}."
    else
      return "Current running event is #{DISPLAY_EVENTS[current_events.first.event_name.to_sym]}."
    end
  end

  def next_event(event_name)
    week_start = Time.now.utc.beginning_of_week

    upcoming_event = @event_list.select do |event|
      event.event_name == event_name && (week_start + event.day.days + (event.time*4).hours) > Time.now.utc
    end

    if upcoming_event.size > 0

      event = upcoming_event.first
      event_start_time = week_start + event.day.days + (event.time*4).hours
      duration = event_start_time - Time.now.utc

      "Next #{DISPLAY_EVENTS[event.event_name.to_sym]} will start in #{get_formatted_date(duration)}."
    else
      week_start += 7.days
      event = @event_list.select do |event|
        event.event_name == event_name && (week_start + event.day.days + (event.time*4).hours) > Time.now.utc
      end.first

      event_start_time = week_start + event.day.days + (event.time*4).hours
      duration = event_start_time - Time.now.utc
      "Next #{DISPLAY_EVENTS[event.event_name.to_sym]} will start in #{get_formatted_date(duration)}."
    end
  end

  def get_formatted_date(time)
    final_string  = ""
    days    = (time/86400).to_i
    final_string += days.to_s + 'd ' if days > 0

    final_string += "%02d:%02d:%02d" % [time/3600%24, time/60%60, time%60]

    final_string
  end
end
