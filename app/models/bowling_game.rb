class BowlingGame

	def initialize
		@score = 0
		@rolls = Array.new(22, 0)
		@current = 0
	end

	def roll(pins)
		@rolls[@current] = pins
		@current += 1
	end

	def score
		roll_index = 0
		for frame in 0...10
			if is_strike(roll_index)
				@score += strike_bonus(roll_index)
				roll_index += 1
			elsif is_spare(roll_index)
				@score += spare_bonus(roll_index)
				roll_index += 2
			else
				@score += sum_of_frame(roll_index)
				roll_index += 2
			end
		end
		@score
	end

	def sum_of_frame(roll_index)
		@rolls[roll_index] + @rolls[roll_index+1]
	end

	def spare_bonus(roll_index)
		10 + @rolls[roll_index+2]
	end

	def strike_bonus(roll_index)
		10 + @rolls[roll_index+1] + @rolls[roll_index+2]
	end

	def is_spare(roll_index)
		@rolls[roll_index] + @rolls[roll_index+1] == 10
	end

	def is_strike(roll_index)
		@rolls[roll_index] == 10
	end

end