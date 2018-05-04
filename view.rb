class View
  def welcome
    system "clear"
    puts "Welcome to Hangman\n"
  end

  def status (word, letters, lives)
    puts "\nHidden word: #{word.join('')}"
    puts "Untried letters: #{letters.join(' ')}"
    puts "There are #{lives} lives remaining!\n"
  end

  def game_over (won)
    if(won)
      puts "You are a winner!"
    else
      puts "The man is hanged!"
    end
  end

  def correct (right)
    if right
      puts "Correct guess"
    else
      puts "Incorrect, you lose a life!"
    end
  end

  def prompt
    puts "Make a guess (a-z): "
    guess = STDIN.gets.chomp
  end

  def reveal(word)
    puts "The secret word was #{word}"
  end

  def wait
    print "Any key to continue\n"
    STDIN.getch
    system "clear"
  end
end
