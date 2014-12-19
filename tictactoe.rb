def welcome
	
	@line_width = 70
	puts ""
	puts ('*' * @line_width)
	puts("Welcome to Tic Tac Toe!".center(@line_width))
	puts ('*' * @line_width)
	puts ""

end

def game_frame # Setting up the game's framework, a 3x3 grid
	
	puts ""
	puts "   #{@grid[0]} | #{@grid[3]} | #{@grid[6]} "
	puts " ~~~~~~~~~~~~~"
	puts "   #{@grid[1]} | #{@grid[4]} | #{@grid[7]} "
	puts " ~~~~~~~~~~~~~"
	puts "   #{@grid[2]} | #{@grid[5]} | #{@grid[8]} "
	puts ""
	puts ""
	puts "Instructions"
	puts ""
	puts "Left Column:       Mid Column:       Right Column:"
	puts "-----------------------------------------------------"
	puts " top:    1          top:    4         top:     7"
	puts " mid:    2          mid:    5         mid:     8"
	puts " bottom: 3          bottom: 6         bottom:  9"
	puts ""
	puts ""

end

def player_profile # 50/50 chance of either player starting first

	coinflip = rand(1..2)

	if coinflip == 1
		@player1_mark = "X"
		@player2_mark = "O"
		status = "Heads"
	else
		@player1_mark = "O"
		@player2_mark = "X"
		status = "Tails"
	end

	puts "Player 1, what's your name?"
	@player1 = gets.chomp.capitalize
	puts ""
	puts "Player 2, what's your name? "
	@player2 = gets.chomp.capitalize
	puts ""
	puts "Welcome, #{@player1} and #{@player2}!"
	puts ""
	puts "Let's flip a coin to see who goes first"
	puts ""
	puts "It's in the air! Press 1 for heads and 2 for tails"
	input = gets.chomp
	puts "...flipping..."
	puts ""
	puts "#{status}! #{@player1} starts and marks with #{@player1_mark}."
	puts ""
	puts "Since #{@player1} is #{@player1_mark}, #{@player2} is #{@player2_mark}."
	puts ("_" * @line_width)

end

def player1_move

	move = gets.to_i - 1

	if move < 10 # takes player1's input and first checks to see that the it's less than 10 because there are only 9 spots on the grid
		if @grid[move] == " " # makes sure that there is an empty space and not a letter in the desired space for player1
			@grid[move] = @player1_mark
			game_frame
		else
			puts "Error: please choose an empty space."
			puts "#{@player1}, it's still your move."
			player1_move
		end
	else
		puts "Error: please enter a number between 1 and 9."
		puts "#{@player1}, it's still your move."
		player1_move
	end

end

def player2_move

	move = gets.to_i - 1

	if move < 10 # takes player2's  input and first checks to see that the it's less than 10 because there are only 9 spots on the grid
		if @grid[move] == " " # makes sure that there is an empty space and not a letter in the desired space for player2
			@grid[move] = @player2_mark
			game_frame
		else
			puts "Error: please choose an empty space."
			puts "#{@player2}, it's still your move."
			player2_move
		end
	else
		puts "Error: please enter a number between 1 and 9."
		puts "#{@player2}, it's still your move."
		player2_move
	end

end

def play_again

	puts "Press any key if you wish to exit, or reply with 'yes' for a new game!"
	response_to_play = gets.chomp.downcase

	if response_to_play == "yes"
		new_game = tictactoe
	end

end

def tictactoe # main method
	
	welcome	

	@grid = [" "," "," "," "," "," "," "," "," ",] # array of empty spaces to be replaced by letters using indexing on the game_frame
	
	player_profile

	game_frame

	puts "#{@player1_mark} goes first."
	puts ""

	counter = 0

	game_over = false # set to false in order to allow game to end when a possible win combination is achieved by either player

	while game_over == false
		
		puts "#{@player1}, your move."

		player1_move

		# player1 possible win combinations

		if @grid[0] == @player1_mark && @grid[3] == @player1_mark && @grid[6] == @player1_mark or @grid[1] == @player1_mark && @grid[4] == @player1_mark && @grid[7] == @player1_mark or @grid[2] == @player1_mark && @grid[5] == @player1_mark && @grid[8] == @player1_mark or @grid[0] == @player1_mark && @grid[1] == @player1_mark && @grid[2] == @player1_mark or 
			@grid[3] == @player1_mark && @grid[4] == @player1_mark && @grid[5] == @player1_mark or @grid[6] == @player1_mark && @grid[7] == @player1_mark && @grid[8] == @player1_mark or @grid[2] == @player1_mark && @grid[4] == @player1_mark && @grid[6] == @player1_mark or @grid[0] == @player1_mark && @grid[4] == @player1_mark && @grid[8] == @player1_mark
			
			puts "#{@player1} Wins!!!"
			puts ""

			game_over = true

			play_again

			break # without a break it would still ask for the next person's turn

		end

		counter +=1

		if counter == 5 # the first player, at a max, will be able to make a mark 5 times, as he/she went first and there are 9 spots
			
			puts "It's a tie!" # tie because game_over never changed and the players have made their maximum number of moves
			puts ""
			
			play_again
			
			break

		end

		puts "#{@player2}, your move."
		
		player2_move

		# player2 possible win combinations

		if @grid[0] == @player2_mark && @grid[3] == @player2_mark && @grid[6] == @player2_mark || @grid[1] == @player2_mark && @grid[4] == @player2_mark && @grid[7] == @player2_mark || @grid[2] == @player2_mark && @grid[5] == @player2_mark && @grid[8] == @player2_mark || @grid[0] == @player2_mark && @grid[1] == @player2_mark && @grid[2] == @player2_mark || 
			@grid[3] == @player2_mark && @grid[4] == @player2_mark && @grid[5] == @player2_mark || @grid[6] == @player2_mark && @grid[7] == @player2_mark && @grid[8] == @player2_mark || @grid[2] == @player2_mark && @grid[4] == @player2_mark && @grid[6] == @player2_mark || @grid[0] == @player2_mark && @grid[4] == @player2_mark && @grid[8] == @player2_mark
			
			puts "#{@player2} Wins!!!"
			puts ""
			
			game_over = true

			play_again

			break # without a break it would still ask for the next person's turn
		
		end

	end

end

tictactoe # running the main method



