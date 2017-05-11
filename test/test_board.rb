require 'minitest/autorun'
require_relative '../board.rb'
#require_relative '../player.rb'
# require_relative 'game.rb'
# require_relative 'random.rb'



class TestBoard < Minitest::Test

	 def test_for_3x3Board
	 	board = Board.new(3)
	 	result = ['-','-','-','-','-','-','-','-','-']
	 	assert_equal(result, board.board_table)
	 end


	 def test_for_4x4Board
	 	board = Board.new(4)
	 	result = Array.new(16,'-')
	 	assert_equal(result, board.board_table)
	 end

	 def test_for_4x4Board
	 	board = Board.new(27)
	 	result = Array.new(729,'-')
	 	assert_equal(result, board.board_table)
	 end

	 def test_printBoard_4_x_4
	 	board = Board.new(4)
	 	board.printBoard(board,4)
	 end


	 def test_printBoard_27_x_27
	 	board = Board.new(27)
	 	board.printBoard(board,27)
	 end
	# def test_get_set_position
	# 	board = Board.new
	# 	player1 = Player.new("X","Dover")
	# 	result = [0,0,0,"X",0,0,0,0,0]
	# 	assert_equal(result,board.setPosition(player1,3))

	# end

	# def test_check_winner
	# 	board = Board.new
	# 	player1 = Player.new("X","Dover")
	# 	board.setPosition(player1,0)
	# 	board.setPosition(player1,1)
	# 	board.setPosition(player1,2	)
	# 	assert_equal(true,board.check_winner(player1))
	# end

	# def test_player_position
	# 	board = Board.new
	# 	player1 = Player.new("X","Dover")
	# 	board.setPosition(player1,0)
	# 	board.setPosition(player1,1)
	# 	board.setPosition(player1,2)
	# 	result = ["X","X","X","X",0,0,0,0,0]
	# 	assert_equal(result,board.setPosition(player1,board.playerSetPosition()))
	# end

	# def test_print_Board
	# 	board = Board.new
	# 	board.printBoard()
	# end





end
