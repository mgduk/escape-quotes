chai = require 'chai'
expect = chai.expect
escape_quotes = require '../src/escape-quotes'

tests =
    "I\\'m a little teapot": ["I'm a little teapot"]
    "No th*anks, I *alre*ady h*ave *a penguin": ["No thanks, I already have a penguin", "a", "*"]
    "No th*anks, I *alr*e*ady h*av*e *a p*enguin": ["No thanks, I already have a penguin", "ae", "*"]

describe 'escape_quotes', ->
    for s, a of tests
        it "outputs \"#{s}\" given #{JSON.stringify a}", do (s, a) -> -> expect(escape_quotes.apply(this, a)).to.equal s
