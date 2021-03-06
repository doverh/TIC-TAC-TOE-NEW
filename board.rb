class Board

	# allow read  && write
	attr_accessor :board_table

	#Create an empty array as a board
	def initialize(num)
		@num = num
		@board_table = Array.new(num * num,"-")
	end

	def getBoardDimension()
		return @num
	end	
		
	def setPosition(player, position)
		board_table[position] = player.mark
		return board_table
	end


	def getPosition(position)
		return board_table[position]
	end	

	#Method to print a dinamic board on screen. 
	#Num represents one side of the dimension, for example num=4 for 4X4 board
	def printBoard(board,num)
		
		totalSize = num * num
		lineSize = 0
		dimension1 = 0
		dimension2 = num
		while(totalSize>lineSize)
			puts ""
			while(lineSize < dimension1)
				print"#{board.board_table[lineSize]}|"
				lineSize+=1
			end	
			dimension1+=dimension2	
			
		end
	end

    
    #Check for a winner
	def check_winner(player)
		
		# dimension = board.getBoardDimension
		# while(totalSize>lineSize)
		# 	puts ""
		# 	while(lineSize < dimension1)
		# 		print"#{board.board_table[lineSize]}"
		# 		lineSize+=1
		# 	end	
		# 	dimension1+=dimension2	
			
		# end



		 win_lines = [[board_table[0],board_table[1],board_table[2]],
		 			[board_table[3],board_table[4],board_table[5]],
		 			[board_table[6],board_table[7],board_table[8]],
		 			[board_table[0],board_table[3],board_table[6]],
		 			[board_table[1],board_table[4],board_table[7]],
					[board_table[2],board_table[5],board_table[8]],	
					[board_table[0],board_table[4],board_table[8]],
					[board_table[2],board_table[4],board_table[6]]]

		 	 win_lines.each do |winning_line|
                if winning_line.count(player.mark) == 3
                	return true
                end
         	 end
        return false
    end
  	



	#Check if its position available
	def anyMoveLeft?
		if board_table.include?("-")
			return true
		else
			return false
		end

	end

	def getIndexat(position)
		return board_table[position]	
	end

	def isBoardFull
		!board_table.include?("-")
	end
	
	def finishBoard
		while board_table.include?("-")
		 position = board_table.index("-")	
		 board_table[position] = "/"
		end
	end
		
	def getBoard()
		return board_table
	end

	#show results
	def results(board,player1,player2)
		if board.check_winner(player1) == true
			finalResult = "Player 1 won!"
		elsif board.check_winner(player2) == true
			finalResult = "Player 2 won!!"
		elsif
			board.isBoardFull == true
			finalResult = "We have a tie!"
		else 
			finalResult = ""
		end
	return finalResult
	end
end	