-- Copyright 2006-2010 Mitchell mitchell<att>caladbolg.net. See LICENSE.
-- Shell LPeg lexer

local l = lexer
local token, style, color, word_match = l.token, l.style, l.color, l.word_match
local P, R, S = l.lpeg.P, l.lpeg.R, l.lpeg.S

module(...)

local ws = token('whitespace', l.space^1)

-- comments
local comment = token('comment', '#' * l.nonnewline^0)

-- strings
local sq_str = l.delimited_range("'", nil, true)
local dq_str = l.delimited_range('"', '\\', true)
local ex_str = l.delimited_range('`', '\\', true)
local heredoc = '<<' * P(function(input, index)
  local s, e, _, delimiter = input:find('(["\']?)([%a_][%w_]*)%1[\n\r\f;]+', index)
  if s == index and delimiter then
    local _, e = input:find('[\n\r\f]+'..delimiter, e)
    return e and e + 1 or #input + 1
  end
end)
local string = token('string', sq_str + dq_str + ex_str + heredoc)

-- numbers
local number = token('number', l.float + l.integer)

-- keywords
local keyword = token('keyword', word_match({
  'if', 'then', 'elif', 'else', 'fi', 'case', 'in', 'esac', 'while', 'for',
  'do', 'done', 'continue', 'local', 'return',
  -- operators
  '-a', '-b', '-c', '-d', '-e', '-f', '-g', '-h', '-k', '-p', '-r', '-s', '-t',
  '-u', '-w', '-x', '-O', '-G', '-L', '-S', '-N', '-nt', '-ot', '-ef', '-o',
  '-z', '-n', '-eq', '-ne', '-lt', '-le', '-gt', '-ge'
}, '-'))

-- identifiers
local identifier = token('identifier', l.word)

-- variables
local variable = token('variable', '$' * (S('!#?*@$') +
  l.delimited_range('()', nil, true, false, '\n') +
  l.delimited_range('[]', nil, true, false, '\n') +
  l.delimited_range('{}', nil, true, false, '\n') +
  l.delimited_range('`', nil, true, false, '\n') +
  l.digit^1 +
  l.word))

-- operators
local operator = token('operator', S('=!<>+-/*^~.,:;?()[]{}'))

_rules = {
  { 'whitespace', ws },
  { 'keyword', keyword },
  { 'identifier', identifier },
  { 'string', string },
  { 'comment', comment },
  { 'number', number },
  { 'variable', variable },
  { 'operator', operator },
  { 'any_char', l.any_char },
}
