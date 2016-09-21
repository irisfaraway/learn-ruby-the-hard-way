# This code is disgusting and I am sorry
class Lexicon
  def self.scan(phrase)
    # set up the dictionary
    dictionary = {
      'north' => 'direction',
      'south' => 'direction',
      'east' => 'direction',
      'west' => 'direction',
      'down' => 'direction',
      'up' => 'direction',
      'left' => 'direction',
      'right' => 'direction',
      'back' => 'direction',
      'go' => 'verb',
      'stop' => 'verb',
      'kill' => 'verb',
      'eat' => 'verb',
      'the' => 'stop',
      'in' => 'stop',
      'of' => 'stop',
      'from' => 'stop',
      'at' => 'stop',
      'it' => 'stop',
      'door' => 'noun',
      'bear' => 'noun',
      'princess' => 'noun',
      'cabinet' => 'noun'
    }

    # set up definitions array
    definitions = []

    # split the phrase into words
    all_the_words = phrase.split(' ')

    all_the_words.each do |word|
      # lowercase the word for consistency
      word = word.downcase

      # check what type of word the thing is
      token = dictionary[word]

      # if the token is nil, check if it's an integer - otherwise it's an error
      if token.nil? && /\A\d+\z/.match(word)
        token = 'number'
        # convert string to integer
        word = word.to_i
      elsif token.nil?
        token = 'error'
      end

      # add the word with its definition to definitions
      definitions << [token, word]
    end

    # send it back
    definitions
  end
end
