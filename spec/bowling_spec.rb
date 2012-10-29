require 'spec_helper'

def roll_many(this_many, pins)
	this_many.times { @game.roll pins }
end

describe BowlingGame, "#score" do

	before do
		@game = BowlingGame.new
	end

	it "returns 0 for a gutter game" do
		roll_many(20, 0)
		@game.score.should eq(0)
	end

	it "returns 20 for all ones" do
		roll_many(20, 1)
		@game.score.should eq(20)
	end

	it "calculates one spare correctly" do
		roll_many(2, 5)
		@game.roll(3)
		roll_many(17, 0)
		@game.score.should eq(16)
	end

	it "calculates one strike correctly" do
		@game.roll(10)
		@game.roll(3)
		@game.roll(4)
		roll_many(16, 0)
		@game.score.should eq(24)
	end

	it "calculates a perfect game correctly" do
		roll_many(12, 10)
		@game.score.should eq(300)
	end

end
