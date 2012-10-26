require 'test_helper'

class BowlingTest < ActiveSupport::TestCase

	def setup
	   @g = BowlingGame.new
	end

	def roll_many(pins, times)
		for i in 1..times
			@g.roll(pins)
		end
	end

	test "all gutterballs" do
		roll_many(0, 20)
		assert_equal(0, @g.score)
	end

	test "all ones" do
		roll_many(1, 20)
		assert_equal(20, @g.score)
	end

	test "one spare" do
		@g.roll(5)
		@g.roll(5) # spare
		@g.roll(3)
		roll_many(0, 17)
		assert_equal(16, @g.score)
	end

	test "one strike" do
		@g.roll(10) # strike
		@g.roll(3)
		@g.roll(4)
		roll_many(0, 16)
		assert_equal(24, @g.score)
	end

	test "perfect game" do
		roll_many(10, 12)
		assert_equal(300, @g.score)
	end

end