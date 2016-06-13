require "open-uri"
require "nokogiri"

class Leaderboard
  attr_accessor :season, :hero, :ladder

  def initialize(season = 6, hero = 'barb')
    @season = season.to_s
    @hero = hero
    @ladder = Array.new
  end

  def scrape

    url = "http://us.battle.net/d3/en/rankings/season/6/rift-barbarian"
    doc = Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
    leaders_unformated = doc.xpath('//*/table/tbody/tr//*/a/@href')

    leaders_unformated.each_with_index do |player, index|
        @ladder << player.value
        @ladder[index].slice!("/d3/en/profile/")
        @ladder[index].slice!("/")
    end

  end

  @@hero_classes = {
      "barbarian" => "barbarian",
      "witchdoctor" => "wd",
      "demonhunter" => "dh",
      "monk" => "monk",
      "wizard" => "wizard",
      "crusader" => "crusader",
      "barb" => "barbarian",
      "wd" => "wd",
      "dh" => "dh",
      "wiz" => "wizard",
      "sader" => "crusader"
  }.freeze
end
