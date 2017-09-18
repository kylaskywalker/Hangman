require 'rubygems'

class Hangman 

	def initialize()
		puts "o hai, hooman! welcome to hangman!"
		self.welcome()
	end

	#ask if user wants to play or not
	def welcome()
		puts "wanna play? y/n"
		yesorno = ""
		yesorno = gets.chomp
		yesorno.downcase!
		if yesorno == "y"
			playGame()
		elsif yesorno == "n"
			exitGame()
	    else 
	    	puts "sorry, I didn't catch that"
	    	welcome()
		end
	end

	def playGame()
		#define variables
		answer = ""
		answer = IO.readlines("./wordslist.tx")[rand(0...105)].chomp
		answer = answer.split("")
		attempts = 7
		placehold = "_"
		userguess = ""
		correctguesses = []
		correctguesses = Array.new(answer.size, placehold)
		incorrectguesses = []
		#gameplay
		while attempts > 0
			puts "the word is #{answer.size} letters long. you have #{attempts} left. guess a letter to continue!"
			userguess = gets.chomp
			userguess.downcase!
			puts "you have guessed #{userguess}"
			if incorrectguesses.include? userguess or correctguesses.include? userguess
				puts "you have already guessed that letter"
			elsif answer.include? userguess
				puts "you guessed correct!"
				answer.each_with_index do |curletter, index|
					curletter==userguess ? correctguesses[index]=userguess : ""
				end
				puts "here are your guesses so far"
				puts "correct guesses: #{correctguesses.join(' ')}"
				puts "incorrect guesses: #{incorrectguesses.join(' ')}"
			else
				puts "you have guessed incorrectly"
				incorrectguesses<<userguess
				attempts = attempts - 1
				puts "here are your guesses so far"
				puts "correct guesses: #{correctguesses.join(' ')}"
				puts "incorrect guesses: #{incorrectguesses.join(' ')}"
			end
			unless correctguesses.include?(placehold)
				puts "you have won! the word was #{answer.join('')}"
				continuePlaying()
			end
		end
		puts "oh noes! you have lost!"
		puts "X_X"
		puts "the word was #{answer.join("")}"
		puts "too bad"
		continuePlaying()
	end

	def continuePlaying()
		puts "wanna play again? y/n"
		yesorno = gets.chomp
		yesorno.downcase!
		if yesorno == "y"
			playGame()
		elsif yesorno == "n"
			exitGame()
	    else 
	    	puts "sorry, I didn't catch that"
	    	welcome()
		end
	end

	def exitGame()
		puts "kthxbai."
		exit
	end
end

game = Hangman.new()

game.initialize()