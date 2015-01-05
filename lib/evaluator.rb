class Evaluator
	def initialize(target_array = ["G", "G", "G", "G"])
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