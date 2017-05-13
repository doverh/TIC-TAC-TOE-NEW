require 'sinatra'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'random_player.rb'
require_relative 'sequential_player.rb'
require_relative 'unbeatable_player.rb'


enable 'sessions'

get '/' do
	session[:board] = Board.new(3)
	erb:ttt_board

end

 #Select level to create players
 post '/getLevel' do
 	 session[:board] = Board.new(3)
     session[:player2] = params["player2"]
 	 session[:game] = Game.new(session[:board])
     erb:ttt_board, :locals => {:player1=>session[:player1],:player2=>session[:player2],:board=>session[:board],:game=>session[:game]}
end
 
 post '/getMove' do

     #CREATE PLAYERS AND BOARD
     player1 = Human_player.new("X") 
     board_table = session[:board]
     player2 = session[:player2]
    
     #Check if game is againt human
    if player2 =="Human_player"
        flag = "human"
    else 
        flag = "computer"  
    end    

    # Create an object depending on what user selected
     if player2 == "Human_player"
        player2 = Human_player.new("O")
     elsif player2 == "Random_player"
        player2 = Random_player.new("O")
     elsif player2 == "Sequential_player"
        player2 = Sequential_player.new("O")
     else 
        player2 = Unbeatable_player.new("O")
     end

     #CREATE GAME
     game = session[:game]
     #Game.new(player1,player2,board_table)


     #GET THE POSITION CHOOSE BY THE PLAYER WHEN THIS PRESS A BUTTON
     if params["position"][0].to_i == 0
     	position = 0
     elsif params["position"][0].to_i == 1
     	position = 1
     elsif params["position"][0].to_i == 2
     	position = 2
     elsif params["position"][0].to_i ==3
     	position = 3
     elsif params["position"][0].to_i == 4
     	position = 4
     elsif params["position"][0].to_i == 5
     	position = 5
     elsif params["position"][0].to_i == 6
     	position = 6
     elsif params["position"][0].to_i == 7
     	position = 7	
    else position = 8
    end 
    

    

    #Check who has the turn
    count = 0
    board_table.getBoard().each do |elem|
        if elem != "-" 
            count+=1
        end
    end

    if count % 2 == 0
        turn = "X"
    else

        turn = "O"
    end

    puts "#{turn}"

    session[:board_table] = game.play(board_table,position,player1,player2,turn,flag)
    session[:result]  = board_table.results(board_table,player1,player2)
        
    erb:ttt_board, :locals => {:board_table=>params[:board_table], :result=>session[:result], :playerWin=>session[:playerWin], :computerWin=>session[:computerWin]}
	
	
	end




	
	
