class Game

	# allow read  && write
	attr_accessor :player1,:player2	,:board_table,:aiLevel 

def initialize(board)
	@board = board
end
	
def play(board_table,position,player1,player2,turn,flag)
		
		#Check if flag is human(game between human players)
		if flag == "human"	   
	   	#Check if player X turn player 1 plays 		
	   		if turn == 'X'
	   	 		#Check if there any move left 	
	   			if  board_table.results(board_table,player1,player2) == ""
             		if player1.positionAvailable?(board_table.getBoard(),position) == true
                		board_table.setPosition(player1,position)
               		end
               		#CHECK IF PLAYER 1 WON
            		if board_table.check_winner(player1) == true ||  board_table.anyMoveLeft?() == false
                		board_table.finishBoard
            		end
       			end 
    		
		# else if O turn, player 2 plays 		
	   		else	#Check if there any move left 	
	   			if  board_table.results(board_table,player1,player2) == ""
            		#Check if the player is human
            		if player2.positionAvailable?(board_table.getBoard(),position) == true
  		   				board_table.setPosition(player2,position)
 	 				end
 	 			end
            #CHECK IF PLAYER 2 WON
 	 			if board_table.check_winner(player2) == true ||  board_table.anyMoveLeft?() == false
					board_table.finishBoard
        	    end
      		end
      	#if flag is not human
      	else
      		if  board_table.results(board_table,player1,player2) == ""
             	if player1.positionAvailable?(board_table.getBoard(),position) == true
                		board_table.setPosition(player1,position)
               	end
          
            #CHECK IF PLAYER 1 WON
            	if board_table.check_winner(player1) == true ||  board_table.anyMoveLeft?() == false
                	board_table.finishBoard
            	end
       		end 
    	
		# player 2 plays 		
	   		if  board_table.results(board_table,player1,player2) == ""
            	position1 = player2.getMove(board_table.getBoard())
            		if player2.positionAvailable?(board_table.getBoard(),position1) == true
  		   				board_table.setPosition(player2,position1)
 	 				end
 	 		end
            #CHECK IF PLAYER 2 WON
 	 		if board_table.check_winner(player2) == true ||  board_table.anyMoveLeft?() == false
				board_table.finishBoard
            end
       	end

       return board_table
		
	end

	#print the movement in the board
	def play_Print()
	   
		loop do 
			#call the method set position returning player and position
			board_table.printBoard(@board_table, @board_table.getBoardDimension())
			position = player1.getMove(board_table.getBoard())
			board_table.setPosition(player1,position)
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player1) == true

			board_table.printBoard(@board_table, @board_table.getBoardDimension())
			position = player2.getMove(board_table.getBoard())
			board_table.setPosition(player2,position)
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player2) == true
		end
			board_table.printBoard(@board_table, @board_table.getBoardDimension())
		return board_table.results(board_table,player1,player2)
	end
end