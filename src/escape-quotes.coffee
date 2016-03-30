regexEscape = require 'escape-string-regexp'

# reverses a string
reverse = (s) -> s.split('').reverse().join('')

module.exports = (s, chars = '\'', escapeChar = '\\') ->
    return s if typeof s != 'string'
    regex = new RegExp("([#{regexEscape chars}])(?!#{regexEscape escapeChar})",'g')
    # as JS doesn't support lookbehind, but _does_ support lookahead,
    # we'll reverse the string first, use lookaheads, then reverse it back!
    reverse reverse(s).replace regex, "$1#{escapeChar}"
