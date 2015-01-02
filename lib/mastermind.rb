class Evaluator

	def initialize(target_array = ["g", "g", "g", "g"])
		@target_array = target_array
	end

	def match_position(aString)
		user_array = aString.split("")
		match_count = 0
		user_array.each_with_index do |entry, index|
			if entry == @target_array[index]
				match_count += 1
			end
		end
		return match_count
	end

	def count_colors(aString)
		user_uniq_array = aString.split("").uniq
		color_count = 0
		user_uniq_array.each {|x| @target_array.include?(x) ? color_count +=1:nil}
		color_count
	end

end

class Mastermind
	def initialize
		@target_array = Array.new(4){['r','g','b','y'].sample}.join
		@evaluator = Evaluator.new#(@target_array)
		@guesses = 0
		@first_time = true
	end

	def prompt_user(aString)
		if @first_time == true
			Printer.first_guess
			self.user_input(aString)
			@first_time == false
		else
			Printer.whats_your_guess
			self.user_input(aString)
		end
	end

	def user_input(aString)
		Printer.whats_your_guess
		downcased = aString.downcase
		if downcased.length == 4 && downcased[/[bgy]{4}/]
			downcased
		elsif aString.length < 4
			Printer.too_few
			# self.prompt_user
		elsif aString.length > 4
			Printer.too_many
			# self.prompt_user
		elsif aString == 'q'
			$user_choice = 'q'
		else
			Printer.invalid_input
			# self.prompt_user
		end
	end

	def user_input_valid_string(aString)
		position_matches = @evaluator.match_position(aString)
		color_matches = @evaluator.count_colors(aString)
		@guesses += 1
		if position_matches == aString.length
			Printer.you_win
		else
			"'#{aString}' has #{color_matches} of the correct elements with #{position_matches} in the correct positions. You have taken #{@guesses} guesses."
			# self.prompt_user		
		end
	end
end

module Printer
	def self.too_few
		"Please enter more characters."
	end
	def self.too_many
		"Please enter fewer characters."
	end
	def self.invalid_input
		"Please enter valid characters."
	end
	def self.welcome
		"Welcome to MASTERMIND.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
	end
	def self.guess_again
		"'RRGB' has 3 of the correct elements with 2 in the correct positionsYou've taken 1 guess."
	end

	def self.first_guess
		"I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.What's your guess?"
	end

	def self.you_win
		"You win! GG."
	end

	def self.instructions
		"Guess the 4 letter string made up of (r)ed, (g)reen, (b)lue, and/or (y)ellow. You will be told how many colors and positions you guessed correctly."
	end

	def self.whats_your_guess
		"What's your guess?"
	end
end


if __FILE__ == $0
	puts Printer.welcome
	$user_choice
	until $user_choice == "q"
		$user_choice = gets.chomp.split(" ")
		if $user_choice == "p"
			game = Game.new
			game.user_input
		elsif $user_choice[0] == i
			Printer.instructions
		else
			input = "q"
		end
	end	
end
