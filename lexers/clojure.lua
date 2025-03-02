-- Copyright 2018-2023 Mitchell. See LICENSE.
-- Clojure LPeg lexer.
-- Contributed by Christos Chatzifountas.

local lexer = require('lexer')
local token, word_match = lexer.token, lexer.word_match
local P, S = lpeg.P, lpeg.S

local lex = lexer.new('clojure')

-- Whitespace.
lex:add_rule('whitespace', token(lexer.WHITESPACE, lexer.space^1))

-- Keywords.
lex:add_rule('keyword', token(lexer.KEYWORD, word_match{
  'fn', 'try', 'catch', 'finaly', 'defonce', 'and', 'case', 'cond', 'def', 'defn', 'defmacro', 'do',
  'else', 'when', 'when-let', 'if-let', 'if', 'let', 'loop', 'or', 'recur', 'quote'
}))

-- Functions.
lex:add_rule('function', token(lexer.FUNCTION, word_match{
  '*', '+', '-', '->ArrayChunk', '->Eduction', '->Vec', '->VecNode', '->VecSeq', '/', '<', '<=',
  '=', '==', '>', '>=', 'StackTraceElement->vec', 'Throwable->map', 'accessor', 'aclone',
  'add-classpath', 'add-watch', 'agent', 'agent-error', 'agent-errors', 'aget', 'alength', 'alias',
  'all-ns', 'alter', 'alter-meta!', 'alter-var-root', 'ancestors', 'any?', 'apply', 'array-map',
  'aset', 'aset-boolean', 'aset-byte', 'aset-char', 'aset-double', 'aset-float', 'aset-int',
  'aset-long', 'aset-short', 'assoc', 'assoc!', 'assoc-in', 'associative?', 'atom', 'await',
  'await-for', 'bases', 'bean', 'bigdec', 'bigint', 'biginteger', 'bit-and', 'bit-and-not',
  'bit-clear', 'bit-flip', 'bit-not', 'bit-or', 'bit-set', 'bit-shift-left', 'bit-shift-right',
  'bit-test', 'bit-xor', 'boolean', 'boolean-array', 'boolean?', 'booleans', 'bound-fn*', 'bound?',
  'bounded-count', 'butlast', 'byte', 'byte-array', 'bytes', 'bytes?', 'cast', 'cat', 'char',
  'char-array', 'char?', 'chars', 'class', 'class?', 'clear-agent-errors', 'clojure-version',
  'coll?', 'commute', 'comp', 'comparator', 'compare', 'compare-and-set!', 'compile', 'complement',
  'completing', 'concat', 'conj', 'conj!', 'cons', 'constantly', 'construct-proxy', 'contains?',
  'count', 'counted?', 'create-ns', 'create-struct', 'cycle', 'dec', 'decimal?', 'dedupe', 'delay?',
  'deliver', 'denominator', 'deref', 'derive', 'descendants', 'disj', 'disj!', 'dissoc', 'dissoc!',
  'distinct', 'distinct?', 'doall', 'dorun', 'double', 'double-array', 'double?', 'doubles', 'drop',
  'drop-last', 'drop-while', 'eduction', 'empty', 'empty?', 'ensure', 'ensure-reduced',
  'enumeration-seq', 'error-handler', 'error-mode', 'eval', 'even?', 'every-pred', 'every?',
  'ex-data', 'ex-info', 'extend', 'extenders', 'extends?', 'false?', 'ffirst', 'file-seq', 'filter',
  'filterv', 'find', 'find-keyword', 'find-ns', 'find-var', 'first', 'flatten', 'float',
  'float-array', 'float?', 'floats', 'flush', 'fn?', 'fnext', 'fnil', 'force', 'format',
  'frequencies', 'future-call', 'future-cancel', 'future-cancelled?', 'future-done?', 'future?',
  'gensym', 'get', 'get-in', 'get-method', 'get-proxy-class', 'get-thread-bindings',
  'get-validator', 'group-by', 'halt-when', 'hash', 'hash-map', 'hash-ordered-coll', 'hash-set',
  'hash-unordered-coll', 'ident?', 'identical?', 'identity', 'ifn?', 'in-ns', 'inc', 'inc',
  'indexed?', 'init-proxy', 'inst-ms', 'inst?', 'instance?', 'int', 'int-array', 'int?', 'integer?',
  'interleave', 'intern', 'interpose', 'into', 'into-array', 'ints', 'isa?', 'iterate',
  'iterator-seq', 'juxt', 'keep', 'keep-indexed', 'key', 'keys', 'keyword', 'keyword?', 'last',
  'line-seq', 'list', 'list*', 'list?', 'load', 'load-file', 'load-reader', 'load-string',
  'loaded-libs', 'long', 'long-array', 'longs', 'macroexpand', 'macroexpand-1', 'make-array',
  'make-hierarchy', 'map', 'map-entry?', 'map-indexed', 'map?', 'mapcat', 'mapv', 'max', 'max-key',
  'memoize', 'merge', 'merge-with', 'meta', 'methods', 'min', 'min-key', 'mix-collection-hash',
  'mod', 'name', 'namespace', 'namespace-munge', 'nat-int?', 'neg-int?', 'neg?', 'newline', 'next',
  'nfirst', 'nil?', 'nnext', 'not', 'not-any?', 'not-empty', 'not-every?', 'not=', 'ns-aliases',
  'ns-imports', 'ns-interns', 'ns-map', 'ns-name', 'ns-publics', 'ns-refers', 'ns-resolve',
  'ns-unalias', 'ns-unmap', 'nth', 'nthnext', 'nthrest', 'num', 'number?', 'numerator',
  'object-array', 'odd?', 'parents', 'partial', 'partition', 'partition-all', 'partition-by',
  'pcalls', 'peek', 'persistent!', 'pmap', 'pop', 'pop!', 'pop-thread-bindings', 'pos-int?', 'pos?',
  'pr-str', 'prefer-method', 'prefers', 'print', 'print-str', 'printf', 'println', 'println-str',
  'prn', 'prn-str', 'promise', 'proxy-mappings', 'push-thread-bindings', 'qualified-ident?',
  'qualified-keyword?', 'qualified-symbol?', 'quot', 'rand', 'rand-int', 'rand-nth',
  'random-sample', 'range', 'ratio?', 'rational?', 'rationalize', 're-find', 're-groups',
  're-matcher', 're-matches', 're-pattern', 're-seq', 'read', 'read-line', 'read-string',
  'reader-conditional', 'reader-conditional?', 'realized?', 'record?', 'reduce', 'reduce-kv',
  'reduced', 'reduced?', 'reductions', 'ref', 'ref-history-count', 'ref-max-history',
  'ref-min-history', 'ref-set', 'refer', 'release-pending-sends', 'rem', 'remove',
  'remove-all-methods', 'remove-method', 'remove-ns', 'remove-watch', 'repeat', 'repeatedly',
  'replace', 'replicate', 'require', 'reset!', 'reset-meta!', 'reset-vals!', 'resolve', 'rest',
  'restart-agent', 'resultset-seq', 'reverse', 'reversible?', 'rseq', 'rsubseq', 'run!',
  'satisfies?', 'second', 'select-keys', 'send', 'send-off', 'send-via', 'seq', 'seq?', 'seqable?',
  'seque', 'sequence', 'sequential?', 'set', 'set-agent-send-executor!',
  'set-agent-send-off-executor!', 'set-error-handler!', 'set-error-mode!', 'set-validator!', 'set?',
  'short', 'short-array', 'shorts', 'shuffle', 'shutdown-agents', 'simple-ident?',
  'simple-keyword?', 'simple-symbol?', 'slurp', 'some', 'some-fn', 'some?', 'sort', 'sort-by',
  'sorted-map', 'sorted-map-by', 'sorted-set', 'sorted-set-by', 'sorted?', 'special-symbol?',
  'spit', 'split-at', 'split-with', 'str', 'string?', 'struct', 'struct-map', 'subs', 'subseq',
  'subvec', 'supers', 'swap!', 'swap-vals!', 'symbol', 'symbol?', 'tagged-literal',
  'tagged-literal?', 'take', 'take-last', 'take-nth', 'take-while', 'test', 'the-ns',
  'thread-bound?', 'to-array', 'to-array-2d', 'trampoline', 'transduce', 'transient', 'tree-seq',
  'true?', 'type', 'unchecked-add', 'unchecked-add-int', 'unchecked-byte', 'unchecked-char',
  'unchecked-dec', 'unchecked-dec-int', 'unchecked-divide-int', 'unchecked-double',
  'unchecked-float', 'unchecked-inc', 'unchecked-inc-int', 'unchecked-int', 'unchecked-long',
  'unchecked-multiply', 'unchecked-multiply-int', 'unchecked-negate', 'unchecked-negate-int',
  'unchecked-remainder-int', 'unchecked-short', 'unchecked-subtract', 'unchecked-subtract-int',
  'underive', 'unreduced', 'unsigned-bit-shift-right', 'update', 'update-in', 'update-proxy',
  'uri?', 'use', 'uuid?', 'val', 'vals', 'var-get', 'var-set', 'var?', 'vary-meta', 'vec', 'vector',
  'vector-of', 'vector?', 'volatile!', 'volatile?', 'vreset!', 'with-bindings*', 'with-meta',
  'with-redefs-fn', 'xml-seq', 'zero?', 'zipmap', 'diff-similar', 'equality-partition', 'diff',
  'inspect', 'inspect-table', 'inspect-tree', 'validated', 'browse-url', 'as-file', 'as-url',
  'make-input-stream', 'make-output-stream', 'make-reader', 'make-writer', 'as-relative-path',
  'copy', 'delete-file', 'file', 'input-stream', 'make-parents', 'output-stream', 'reader',
  'resource', 'writer', 'add-local-javadoc', 'add-remote-javadoc', 'javadoc', 'sh', 'demunge',
  'load-script', 'main', 'repl', 'repl-caught', 'repl-exception', 'repl-prompt', 'repl-read',
  'root-cause', 'skip-if-eol', 'skip-whitespace', 'stack-element-str', 'cl-format', 'fresh-line',
  'get-pretty-writer', 'pprint', 'pprint-indent', 'pprint-newline', 'pprint-tab', 'print-table',
  'set-pprint-dispatch', 'write', 'write-out', 'resolve-class', 'do-reflect', 'typename',
  '->AsmReflector', '->Constructor', '->Field', '->JavaReflector', '->Method', 'map->Constructor',
  'map->Field', 'map->Method', 'reflect', 'type-reflect', 'apropos', 'dir-fn', 'find-doc', 'pst',
  'set-break-handler!', 'source-fn', 'thread-stopper', 'difference', 'index', 'intersection',
  'join', 'map-invert', 'project', 'rename', 'rename-keys', 'select', 'subset?', 'superset?',
  'union', 'e', 'print-cause-trace', 'print-stack-trace', 'print-throwable', 'print-trace-element',
  'blank?', 'capitalize', 'ends-with?', 'escape', 'includes?', 'index-of', 'last-index-of',
  'lower-case', 're-quote-replacement', 'replace-first', 'split', 'split-lines', 'starts-with?',
  'trim', 'trim-newline', 'triml', 'trimr', 'upper-case', 'apply-template', 'assert-any',
  'assert-predicate', 'compose-fixtures', 'do-report', 'file-position', 'function?',
  'get-possibly-unbound-var', 'inc-report-counter', 'join-fixtures', 'run-all-tests', 'run-tests',
  'successful?', 'test-all-vars', 'test-ns', 'test-vars', 'testing-contexts-str',
  'testing-vars-str', 'keywordize-keys', 'macroexpand-all', 'postwalk', 'postwalk-demo',
  'postwalk-replace', 'prewalk', 'prewalk-demo', 'prewalk-replace', 'stringify-keys', 'walk',
  'append-child', 'branch?', 'children', 'down', 'edit', 'end?', 'insert-child', 'insert-left',
  'insert-right', 'left', 'leftmost', 'lefts', 'make-node', 'node', 'path', 'prev', 'right',
  'rightmost', 'rights', 'root', 'seq-zip', 'up', 'vector-zip', 'xml-zip', 'zipper'
}))

-- Numbers.
lex:add_rule('number', token(lexer.NUMBER, P('-')^-1 * lexer.digit^1 * (S('./') * lexer.digit^1)^-1))

-- Identifiers.
local word = (lexer.alpha + S('-!?*$=-')) * (lexer.alnum + S('.-!?*$+-'))^0
lex:add_rule('identifier', token(lexer.IDENTIFIER, word))

-- Strings.
lex:add_rule('string', token(lexer.STRING, lexer.range('"')))

-- Comments.
local line_comment = lexer.to_eol(';')
local block_comment = lexer.range('#_(', ')')
lex:add_rule('comment', token(lexer.COMMENT, line_comment + block_comment))

-- Operators.
lex:add_rule('operator', token(lexer.OPERATOR, S('`@()')))

-- Clojure keywords.
lex:add_rule('clojure_keyword', token('clojure_keyword', ':' * S(':')^-1 * word * ('/' * word)^-1))
lex:add_style('clojure_keyword', lexer.styles.type)
lex:add_rule('clojure_symbol', token('clojure_symbol', "\'" * word * ('/' * word)^-1))
lex:add_style('clojure_symbol', lexer.styles.type .. {bold = true})

-- Fold points.
lex:add_fold_point(lexer.COMMENT, '#_(', ')')
lex:add_fold_point(lexer.OPERATOR, '(', ')')
lex:add_fold_point(lexer.OPERATOR, '[', ']')
lex:add_fold_point(lexer.OPERATOR, '{', '}')

lexer.property['scintillua.comment'] = ';'

return lex
