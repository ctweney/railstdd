require 'test_helper'

class BowlingGameTest < ActiveSupport::TestCase

	def setup
		@game = BowlingGame.new
	end

	def roll_many(this_many, pins)
		this_many.times { @game.roll pins }
	end

	test "all gutterballs" do
		roll_many(20, 0)
		assert_equal(0, @game.score)
	end

	test "all ones" do
		roll_many(20, 1)
		assert_equal(20, @game.score)
	end

	test "one spare" do
		@game.roll(5)
		@game.roll(5) # spare
		@game.roll(3)
		roll_many(17, 0)
		assert_equal(16, @game.score)
	end

	test "one strike" do
		@game.roll(10)
		@game.roll(3)
		@game.roll(4)
		roll_many(16, 0)
		assert_equal(24, @game.score)
	end

	test "perfect game" do
		roll_many(12, 10)
		assert_equal(300, @game.score)
	end

end