require "./lib/leaderboard/leaderboard.rb"
require "test/unit"

class TestLeaderboard < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2+2)
  end

  def base_leaderboard
    t_board = Leaderboard.new
    assert_equal('barbrian', t_board.hero)
  end

end
