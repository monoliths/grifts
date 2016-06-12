require "grifts/version"
require 'open-uri'
require 'nokogiri'

$classes = {
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
}

module Grifts

  def leaderboard
    selected_class = ARGV[0].downcase
    top_positions =( ARGV[1] || '25').to_i
    season = ARGV[2] || '6'

    url = "http://us.battle.net/d3/en/rankings/season/#{season}/rift-#{$classes[selected_class]}"
    doc = Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)

    leaders = doc.xpath('//*/table/tbody/tr//*/a/@href')[0..top_positions]
    ladder = Array.new

    leaders.each_with_index do |player, index|
        ladder << player.value
        ladder[index].slice!("/d3/en/profile/")
        ladder[index].slice!("/")
    end

    puts ladder
  end
  
end
