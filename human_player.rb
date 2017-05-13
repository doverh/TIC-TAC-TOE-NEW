class Human_player

	attr_accessor :mark#, :id

	#Human or Computer
	def initialize(mark)
		@mark = mark
		#@id = id
	end

	def getMove(board)
		# puts ""
		# puts "Player #{@mark} inform a position: "

			# position = gets.chomp
			# return position.to_i

	end
	
	def getHumanity
		return true
	end

	def positionAvailable?(board,position)
		if board[position] == "-"
			return true
		else
			return false
		end
	end
end 