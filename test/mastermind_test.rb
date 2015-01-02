require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/evaluator'
require './lib/printer'

class MastermindTest < MiniTest::Test

	def setup
		@evaluator = Evaluator.new
		@mastermind = Mastermind.new
	end
#test evaluator
	def test_it_exists
		assert @evaluator
	end

	def test_it_counts_number_of_times_of_each_color
		assert_equal 1, @evaluator.count_colors("gbyg")
	end

	def test_it_counts_correct_position_matches
		assert_equal 4, @evaluator.match_position("gggg")
		assert_equal 2, @evaluator.match_position("gbgb")
	end
#test mastermind
	def test_it_only_accepts_valid_RBGY_or_rbgy_4_strings
		assert_equal "bggg", @mastermind.user_input("bggg")
		assert_equal Printer.too_few, @mastermind.user_input("YYY")
		assert_equal Printer.too_many, @mastermind.user_input("ponytail")
		assert_equal Printer.invalid_input, @mastermind.user_input("9999")
	end

	def test_it_grades_a_users_input_correctly
		assert_equal "'ggbg' has 1 of the correct elements with 3 in the correct positions. You have taken 1 guesses.", @mastermind.user_input_valid_string("ggbg")
		assert_equal "You win! GG.", @mastermind.user_input_valid_string("gggg")
	end
end