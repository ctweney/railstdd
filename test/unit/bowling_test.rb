require 'test_helper'

class BowlingGameTest < ActiveSupport::TestCase

	def setup
		@game = BowlingGame.new
	end

	def roll_many(_pins, _times)
		for i in 1.._times
			@game.roll(_pins)
		end
	end

	test "all gutterballs" do
		roll_many(0, 20)
		assert_equal(0, @game.score)
	end

	test "all ones" do
		@game = BowlingGame.new
		assert_equal(0, @game.score)
		roll_many(1, 20)
		assert_equal(20, @game.score)
	end

	test "one spare" do
		@game.roll(5)
		@game.roll(5) # spare
		@game.roll(3)
		roll_many(0, 17)
		assert_equal(16, @game.score)
	end

	test "one strike" do
		@game.roll(10) # strike
		@game.roll(3)
		@game.roll(4)
		roll_many(0, 16)
		assert_equal(24, @game.score)
	end

end
