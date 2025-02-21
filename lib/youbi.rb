# frozen_string_literal: true

require_relative "youbi/version"
require "date"

module Youbi
  class Error < StandardError; end

  VALID_FORMATS = %i[kanji hiragana katakana short].freeze

  WEEKDAYS = {
    sunday:    { kanji: "日曜日", hiragana: "にちようび", katakana: "ニチヨウビ", short: "日" },
    monday:    { kanji: "月曜日", hiragana: "げつようび", katakana: "ゲツヨウビ", short: "月" },
    tuesday:   { kanji: "火曜日", hiragana: "かようび", katakana: "カヨウビ", short: "火" },
    wednesday: { kanji: "水曜日", hiragana: "すいようび", katakana: "スイヨウビ", short: "水" },
    thursday:  { kanji: "木曜日", hiragana: "もくようび", katakana: "モクヨウビ", short: "木" },
    friday:    { kanji: "金曜日", hiragana: "きんようび", katakana: "キンヨウビ", short: "金" },
    saturday:  { kanji: "土曜日", hiragana: "どようび", katakana: "ドヨウビ", short: "土" }
  }.freeze

  WEEKDAYS.each_value(&:freeze)

  module Extensions

    def japanese_day(format: :kanji)
      raise Youbi::Error, "Invalid format: #{format}" unless VALID_FORMATS.include?(format)

      weekday = %i[sunday monday tuesday wednesday thursday friday saturday][self.wday]
      WEEKDAYS[weekday][format]
    end
  end

end

class Date
  include Youbi::Extensions
end

class Time
  include Youbi::Extensions
end
