require "open-uri"
require "nokogiri"

class Leaderboard
  attr_accessor :season, :hero, :ladder
  attr_reader :hero_classes

  def initialize(season = 6, hero = :barb)
    @hero_classes = {:barbarian => "barbarian", :witchdoctor => "wd",
        :demonhunter => "dh", :monk => "monk", :wizard => "wizard",
        :crusader => "crusader", :barb => "barbarian", :wd => "wd",
        :dh => "dh", :wiz => "wizard", :sader => "crusader"}
    @season = season.to_s
    @hero = hero_classes[hero]
    @ladder = []
  end

  def scrape
    url = "http://us.battle.net/d3/en/rankings/season/#{@season}/rift-#{@hero}"
    doc = Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
    leaders_unformated = doc.xpath('//*/table/tbody/tr//*/a/@href')

    leaders_unformated.each_with_index do |player, index|
        @ladder << player.value
        @ladder[index].slice!("/d3/en/profile/")
        @ladder[index].slice!("/")
    end
    return true
  end

  def print_leaderboard(range = (0..9))
   puts @ladder[range]
  end
end
