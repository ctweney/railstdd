require 'test_helper'

class BowlingTest < ActiveSupport::TestCase

	def setup
	   @game = BowlingGame.new
	end

	def roll_many(pins, times)
		for i in 1..times
			@game.roll(pins)
		end
	end

	test "all gutterballs" do
		roll_many(0, 20)
		assert_equal(0, @game.score)
	end

	test "all ones" do
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

	test "perfect game" do
		roll_many(10, 12)
		assert_equal(300, @game.score)
	end

end