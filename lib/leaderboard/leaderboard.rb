require 'open-uri'
require 'nokogiri'
require 'timeout'

class Leaderboard
  attr_accessor :season, :hero, :ladder
  attr_reader :hero_classes
  HERO_CLASSES = { barbarian: 'barbarian',
                    witchdoctor: 'wd',
                    demonhunter: 'dh',
                    monk: 'monk',
                    wizard: 'wizard',
                    crusader: 'crusader',
                    barb: 'barbarian',
                    wd: 'wd',
                    dh: 'dh',
                    wiz: 'wizard',
                    sader: 'crusader' }.freeze
                    
  def initialize(season = 6, hero = :barb)
    @season = season.to_s
    @hero = HERO_CLASSES[hero]
    @ladder = []
  end

  def valid_leaderboard?
    return true if !HERO_CLASSES.values.include?(@hero) || !@season.to_i.between?(1, 6)
  end

  def scrape(timeout = 5)
    return false if valid_leaderboard?
    return scrape_core timeout
  end

  def print(range = (0..9))
    puts @ladder[range]
  end

  private
  ###
  # The core of the scrape, there is a timeout.
  # If any error occurs the method returns false.
  def scrape_core(timeout = 5)
    begin
      url = "http://us.battle.net/d3/en/rankings/season/#{@season}/rift-#{@hero}"
      doc = Timeout::timeout(timeout) do
        Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
      end
      unless doc.nil?
        leaders_unformated = doc.xpath('//*/table/tbody/tr//*/a/@href')
        @ladder.clear
        leaders_unformated.each_with_index do |player, index|
            @ladder << player.value
            @ladder[index].slice!('/d3/en/profile/')
            @ladder[index].slice!('/')
        end
      end
      return true
    rescue
      # Use this as a catch all for any exceptions.
      # In my testing scraping can sometimes take too long.
      return false
    end
  end
end
