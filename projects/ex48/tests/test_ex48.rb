require 'ex48/lexicon.rb'
require 'ex48/parser.rb'
require 'test/unit'

# Tests for the lexicon
class TestLexicon < Test::Unit::TestCase
  def test_directions
    assert_equal(Lexicon.scan('north'), [['direction', 'north']])
    result = Lexicon.scan('north south east')

    assert_equal(result, [['direction', 'north'],
                          ['direction', 'south'],
                          ['direction', 'east']])
  end

  def test_verbs
    assert_equal(Lexicon.scan('go'), [['verb', 'go']])
    result = Lexicon.scan('go kill eat')
    assert_equal(result, [['verb', 'go'],
                          ['verb', 'kill'],
                          ['verb', 'eat']])
  end

  def test_stops
    assert_equal(Lexicon.scan('the'), [['stop', 'the']])
    result = Lexicon.scan('the in of')
    assert_equal(result, [['stop', 'the'],
                          ['stop', 'in'],
                          ['stop', 'of']])
  end

  def test_nouns
    assert_equal(Lexicon.scan('bear'), [['noun', 'bear']])
    result = Lexicon.scan('bear princess')
    assert_equal(result, [['noun', 'bear'],
                          ['noun', 'princess']])
  end

  def test_numbers
    assert_equal(Lexicon.scan('1234'), [['number', 1234]])
    result = Lexicon.scan('3 91234')
    assert_equal(result, [['number', 3],
                          ['number', 91234]])
  end

  def test_errors
    assert_equal(Lexicon.scan('kdajsfhasdkfs'), [['error', 'kdajsfhasdkfs']])
    result = Lexicon.scan('bear ias princess')
    assert_equal(result, [['noun', 'bear'],
                          ['error', 'ias'],
                          ['noun', 'princess']])
  end

  def test_capitalisation
    assert_equal(Lexicon.scan('Bear'), [['noun', 'bear']])
  end
end

# Tests for the parser
class TestParser < Test::Unit::TestCase
  def test_subject
    x = parse_sentence([['noun', 'princess'], ['verb', 'eat'], ['noun', 'bear']])
    assert_equal(x.subject, 'princess')
  end

  def test_verb
    x = parse_sentence([['noun', 'princess'], ['verb', 'eat'], ['noun', 'bear']])
    assert_equal(x.verb, 'eat')
  end

  def test_object
    x = parse_sentence([['noun', 'princess'], ['verb', 'eat'], ['noun', 'bear']])
    assert_equal(x.object, 'bear')
  end

  def test_exception
    assert_raise do
      parse_sentence([['noun', 'bear'], ['noun', 'princess']])
    end
  end
end
