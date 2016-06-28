require "./lib/leaderboard/leaderboard.rb"
require "test/unit"

class TestLeaderboard < Test::Unit::TestCase

  def test_default_leaderboard
    t_board = Leaderboard.new
    assert_equal('6', t_board.season)
    assert_equal('barbarian', t_board.hero)
    assert_equal([], t_board.ladder)
  end

  def test_default_leaderboard_scrape
    # scrape the same leaderbaord twice
    t_board_a = Leaderboard.new
    t_board_b = Leaderboard.new
    scrape_a = t_board_a.scrape
    scrape_b = t_board_b.scrape
    assert_equal(t_board_a.hero, t_board_b.hero)
    assert_equal(t_board_a.season, t_board_b.season)
    assert_equal(t_board_a.ladder, t_board_b.ladder) if scrape_a and scrape_b
  end

  def test_custom_leaderboard
    # scrape the same leaderbaord twice
    t_board_a = Leaderboard.new(5, :wd)
    t_board_b = Leaderboard.new(5, :wd)
    scrape_a = t_board_a.scrape
    scrape_b = t_board_b.scrape
    assert_equal(t_board_a.hero, t_board_b.hero)
    assert_equal(t_board_a.season, t_board_b.season)
    assert_equal(t_board_a.ladder, t_board_b.ladder) if scrape_a and scrape_b
  end

  def test_invalid_hero
    t_board = Leaderboard.new(6, :necromancer)
    scrape = t_board.scrape
    assert_equal(false, scrape)
  end
  
end
