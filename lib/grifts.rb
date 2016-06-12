require "grifts/version"
require 'open-uri'
require 'nokogiri'

$classes = {
    "barbarian" => "barbarian",
    "witchdoctor" => "witchdoctor",
    "demonhunter" => "demonhunter",
    "monk" => "monk",
    "wizard" => "wizard",
    "crusader" => "crusader",
    "barb" => "barbarian",
    "wd" => "witchdoctor",
    "dh" => "demonhunter",
    "wiz" => "wizard",
    "sader" => "crusader"
}

module Grifts

    selected_class = ARGV[0].downcase
    top_positions = ARGV[1].to_i
    season = ARGV[2]

    url = "http://us.battle.net/d3/en/rankings/era/6/rift-#{$classes[selected_class]}"
    doc = Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
    leaders = doc.xpath('//*/table/tbody/tr//*/a/@href')



    top_positions.times do |x|
        battle_net_name = leaders[x].value.to_s
        battle_net_name.slice!("/d3/en/profile/")
        battle_net_name.slice!("/")
        puts "Rank #{x + 1 }: " + battle_net_name
    end

end
