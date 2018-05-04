class View
  def show_welcome
    system "clear"
    puts "Welcome to Hangman\n"
  end

  def show_status (word, letters, lives)
    puts "\nHidden word: #{word.join('')}"
    puts "Untried letters: #{letters.join(' ')}"
    puts "There are #{lives} lives remaining!\n"
  end

  def show_game_over (won)
    if(won)
      puts "You are a winner!"
    else
      puts "The man is hanged!"
    end
  end

  def show_guess_outcome (right)
    if right
      puts "Correct guess"
    else
      puts "Incorrect, you lose a life!"
    end
  end

  def prompt_for_guess
    print "Make a guess (a-z): "
    STDIN.gets.chomp
  end

  def show_secret(word)
    puts "The secret word was '#{word}'"
  end

  def wait_and_clear_screen
    puts "Any key to continue"
    STDIN.getch
    system "clear"
  end
end
