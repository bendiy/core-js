{module, test} = QUnit
module \ES6

test 'String#split regression' (assert)->
  assert.isFunction ''split
  assert.arity ''split, 2
  assert.name ''split, \split
  assert.looksNative ''split
  assert.nonEnumerable String::, \split
  # based on https://github.com/es-shims/es5-shim/blob/master/tests/spec/s-string.js
  assert.arrayEqual 'ab'split!, <[ab]>, 'If "separator" is undefined must return Array with one String - "this" string'
  assert.arrayEqual 'ab'split(void), <[ab]>, 'If "separator" is undefined must return Array with one String - "this" string'
  assert.arrayEqual 'ab'split(void, 0), [], 'If "separator" is undefined and "limit" set to 0 must return Array[]'
  assert.arrayEqual ''split!, [''], "''.split() results in ['']"
  assert.arrayEqual ''split(/./), [''], "''.split(/./) results in ['']"
  assert.arrayEqual ''split(/.?/), [], "''.split(/.?/) results in []"
  assert.arrayEqual ''split(/.??/), [], "''.split(/.??/) results in []"
  assert.arrayEqual 'ab'split(/a*/), ['' \b], "'ab'.split(/a*/) results in ['', 'b']"
  assert.arrayEqual 'ab'split(/a*?/), <[a b]>, "'ab'.split(/a*?/) results in ['a', 'b']"
  assert.arrayEqual 'ab'split(/(?:ab)/), ['' ''], "'ab'.split(/(?:ab)/) results in ['', '']"
  assert.arrayEqual 'ab'split(/(?:ab)*/), ['' ''], "'ab'.split(/(?:ab)*/) results in ['', '']"
  assert.arrayEqual 'ab'split(/(?:ab)*?/), <[a b]>, "'ab'.split(/(?:ab)*?/) results in ['a', 'b']"
  assert.arrayEqual 'test'split(''), <[t e s t]>, "'test'.split('') results in ['t', 'e', 's', 't']"
  assert.arrayEqual 'test'split!, <[test]>, "'test'.split() results in ['test']"
  assert.arrayEqual '111'split(1), ['' '' '' ''], "'111'.split(1) results in ['', '', '', '']"
  assert.arrayEqual 'test'split(/(?:)/, 2), <[t e]>, "'test'.split(/(?:)/, 2) results in ['t', 'e']"
  assert.arrayEqual 'test'split(/(?:)/, -1), <[t e s t]>, "'test'.split(/(?:)/, -1) results in ['t', 'e', 's', 't']"
  assert.arrayEqual 'test'split(/(?:)/, void), <[t e s t]>, "'test'.split(/(?:)/, undefined) results in ['t', 'e', 's', 't']"
  assert.arrayEqual 'test'split(/(?:)/, null), [], "'test'.split(/(?:)/, null) results in []"
  assert.arrayEqual 'test'split(/(?:)/, NaN), [], "'test'.split(/(?:)/, NaN) results in []"
  assert.arrayEqual 'test'split(/(?:)/, on), <[t]>, "'test'.split(/(?:)/, true) results in ['t']"
  assert.arrayEqual 'test'split(/(?:)/, '2'), <[t e]>, "'test'.split(/(?:)/, '2') results in ['t', 'e']"
  assert.arrayEqual 'test'split(/(?:)/, \two), [], "'test'.split(/(?:)/, 'two') results in []"
  assert.arrayEqual 'a'split(/-/), <[a]>, "'a'.split(/-/) results in ['a']"
  assert.arrayEqual 'a'split(/-?/), <[a]>, "'a'.split(/-?/) results in ['a']"
  assert.arrayEqual 'a'split(/-??/), <[a]>, "'a'.split(/-??/) results in ['a']"
  assert.arrayEqual 'a'split(/a/), ['' ''], "'a'.split(/a/) results in ['', '']"
  assert.arrayEqual 'a'split(/a?/), ['' ''], "'a'.split(/a?/) results in ['', '']"
  assert.arrayEqual 'a'split(/a??/), <[a]>, "'a'.split(/a??/) results in ['a']"
  assert.arrayEqual 'ab'split(/-/), <[ab]>, "'ab'.split(/-/) results in ['ab']"
  assert.arrayEqual 'ab'split(/-?/), <[a b]>, "'ab'.split(/-?/) results in ['a', 'b']"
  assert.arrayEqual 'ab'split(/-??/), <[a b]>, "'ab'.split(/-??/) results in ['a', 'b']"
  assert.arrayEqual 'a-b'split(/-/), <[a b]>, "'a-b'.split(/-/) results in ['a', 'b']"
  assert.arrayEqual 'a-b'split(/-?/), <[a b]>, "'a-b'.split(/-?/) results in ['a', 'b']"
  assert.arrayEqual 'a-b'split(/-??/), <[a - b]>, "'a-b'.split(/-??/) results in ['a', '-', 'b']"
  assert.arrayEqual 'a--b'split(/-/), [\a '' \b], "'a--b'.split(/-/) results in ['a', '', 'b']"
  assert.arrayEqual 'a--b'split(/-?/), [\a '' \b], "'a--b'.split(/-?/) results in ['a', '', 'b']"
  assert.arrayEqual 'a--b'split(/-??/), <[a - - b]>, "'a--b'.split(/-??/) results in ['a', '-', '-', 'b']"
  assert.arrayEqual ''split(/()()/), [], "''.split(/()()/) results in []"
  assert.arrayEqual '.'split(/()()/), <[.]>, "'.'.split(/()()/) results in ['.']"
  assert.arrayEqual '.'split(/(.?)(.?)/), ['' '.' '' ''], "'.'.split(/(.?)(.?)/) results in ['', '.', '', '']"
  assert.arrayEqual '.'split(/(.??)(.??)/), <[.]>, "'.'.split(/(.??)(.??)/) results in ['.']"
  assert.arrayEqual '.'split(/(.)?(.)?/), ['' '.' void, ''], "'.'.split(/(.)?(.)?/) results in ['', '.', undefined, '']"
  assert.arrayEqual 'A<B>bold</B>and<CODE>coded</CODE>'split(/<(\/)?([^<>]+)>/), [\A void, \B \bold '/' \B \and void, \CODE \coded '/' \CODE ''], "'A<B>bold</B>and<CODE>coded</CODE>'.split(/<(\\/)?([^<>]+)>/) results in ['A', undefined, 'B', 'bold', '/', 'B', 'and', undefined, 'CODE', 'coded', '/', 'CODE', '']"
  assert.arrayEqual 'tesst'split(/(s)*/), [\t void, \e \s \t], "'tesst'.split(/(s)*/) results in ['t', undefined, 'e', 's', 't']"
  assert.arrayEqual 'tesst'split(/(s)*?/), [\t void, \e void, \s void, \s void, \t], "'tesst'.split(/(s)*?/) results in ['t', undefined, 'e', undefined, 's', undefined, 's', undefined, 't']"
  assert.arrayEqual 'tesst'split(/(s*)/), [\t '' \e \ss \t], "'tesst'.split(/(s*)/) results in ['t', '', 'e', 'ss', 't']"
  assert.arrayEqual 'tesst'split(/(s*?)/), [\t '' \e '' \s '' \s '' \t], "'tesst'.split(/(s*?)/) results in ['t', '', 'e', '', 's', '', 's', '', 't']"
  assert.arrayEqual 'tesst'split(/(?:s)*/), <[t e t]>, "'tesst'.split(/(?:s)*/) results in ['t', 'e', 't']"
  assert.arrayEqual 'tesst'split(/(?=s+)/), <[te s st]>, "'tesst'.split(/(?=s+)/) results in ['te', 's', 'st']"
  assert.arrayEqual 'test'split(\t), ['' \es ''], "'test'.split('t') results in ['', 'es', '']"
  assert.arrayEqual 'test'split(\es), <[t t]>, "'test'.split('es') results in ['t', 't']"
  assert.arrayEqual 'test'split(/t/), ['' \es ''], "'test'.split(/t/) results in ['', 'es', '']"
  assert.arrayEqual 'test'split(/es/), <[t t]>, "'test'.split(/es/) results in ['t', 't']"
  assert.arrayEqual 'test'split(/(t)/), ['' \t \es \t ''], "'test'.split(/(t)/) results in ['', 't', 'es', 't', '']"
  assert.arrayEqual 'test'split(/(es)/), <[t es t]>, "'test'.split(/(es)/) results in ['t', 'es', 't']"
  assert.arrayEqual 'test'split(/(t)(e)(s)(t)/), ['' \t \e \s \t ''], "'test'.split(/(t)(e)(s)(t)/) results in ['', 't', 'e', 's', 't', '']"
  assert.arrayEqual '.'split(/(((.((.??)))))/), ['' '.' '.' '.' '' '' ''], "'.'.split(/(((.((.??)))))/) results in ['', '.', '.', '.', '', '', '']"
  assert.arrayEqual '.'split(/(((((.??)))))/), <[.]>, "'.'.split(/(((((.??)))))/) results in ['.']"
  assert.arrayEqual 'a b c d'split(/ /, -(Math.pow(2 32) - 1)), <[a]>, "'a b c d'.split(\/ \/, -(Math.pow(2, 32) - 1)) results in ['a']"
  assert.arrayEqual 'a b c d'split(/ /, Math.pow(2, 32) + 1), <[a]>, "'a b c d'.split(\/ \/, Math.pow(2, 32) + 1) results in ['a']"
  assert.arrayEqual 'a b c d'split(/ /, Infinity), [], "'a b c d'.split(\/ \/, Infinity) results in []"
  # based on https://github.com/tc39/test262/tree/master/test/built-ins/String/prototype/split
  instance = Object on
  instance.split = String::split
  split = instance.split on, no
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T1 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T1 #2'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A1_T1 #3'
  instance = Object no
  instance.split = String::split
  split = instance.split no, 0, null
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T2 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T2 #2'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A1_T2 #3'
  split = ''split!
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T4 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T4 #2'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T4 #3'
  assert.strictEqual split.0, '', 'S15.5.4.14_A1_T4 #4'
  split = 'gnulluna'split null
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T5 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T5 #2'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A1_T5 #3'
  assert.strictEqual split.0, \g, 'S15.5.4.14_A1_T5 #4'
  assert.strictEqual split.1, \una, 'S15.5.4.14_A1_T5 #5'
  if NATIVE # wrong behavior in some old browsers
    split = Object(\1undefined)split void
    assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T6 #1'
    assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T6 #2'
    assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T6 #3'
    assert.strictEqual split.0, \1undefined, 'S15.5.4.14_A1_T6 #4'
    split = 'undefinedd'split void
    assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T7 #1'
    assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T7 #2'
    assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T7 #3'
    assert.strictEqual split.0, \undefinedd, 'S15.5.4.14_A1_T7 #4'
    split = String({toString: ->})split void
    assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T8 #1'
    assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T8 #2'
    assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T8 #3'
    assert.strictEqual split.0, \undefined, 'S15.5.4.14_A1_T8 #4'
  split = new String({valueOf: (->), toString: void})split ->
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T9 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T9 #2'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T9 #3'
  assert.strictEqual split.0, \undefined, 'S15.5.4.14_A1_T9 #4'
  split = 'ABB\u0041BABAB'split {toString: -> '\u0042B'}, {valueOf: -> on}
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T10 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T10 #2'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T10 #3'
  assert.strictEqual split.0, \A, 'S15.5.4.14_A1_T10 #4'
  try
    'ABB\u0041BABAB'split {toString: -> '\u0041B'}, {valueOf: throw \intointeger}
    assert.ok no, 'S15.5.4.14_A1_T11 #1 lead to throwing exception'
  catch e
    assert.strictEqual e, \intointeger, 'S15.5.4.14_A1_T11 #2'
  if NATIVE # wrong behavior in old IE
    try
      new String('ABB\u0041BABAB')split {toString: -> '\u0041B'}, {valueOf: (-> {}), toString: -> throw \intointeger}
      assert.ok no, 'S15.5.4.14_A1_T12 #1 lead to throwing exception'
    catch e
      assert.strictEqual e, \intointeger, 'S15.5.4.14_A1_T12 #2'
  split = 'ABB\u0041BABAB\u0042cc^^\u0042Bvv%%B\u0042xxx'split {toString: -> '\u0042\u0042'}, {valueOf: (-> {}), toString: -> \2}
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T13 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T13 #2'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A1_T13 #3'
  assert.strictEqual split.0, \A, 'S15.5.4.14_A1_T13 #4'
  assert.strictEqual split.1, \ABABA, 'S15.5.4.14_A1_T13 #5'
  if NATIVE # wrong behavior in old IE
    try
      instance = Object 10001.10001
      instance.split = String::split
      instance.split {toString: -> throw \intostr}, {valueOf: -> throw \intoint}
      assert.ok no, 'S15.5.4.14_A1_T14 #1 lead to throwing exception'
    catch e
      assert.strictEqual e, \intoint, 'S15.5.4.14_A1_T14 #2'
    try
      class F
        costructor: (@value)->
        valueOf: -> ''+@value
        toString: -> new Number
        split: String::split
      new F!split {toString: (-> {}), valueOf: -> throw \intostr}, {valueOf: -> throw \intoint}
      assert.ok no, 'S15.5.4.14_A1_T15 #1 lead to throwing exception'
    catch e
      assert.strictEqual e, \intoint, 'S15.5.4.14_A1_T15 #2'
  try
    String::split.call 6776767677.006771122677555, {toString: -> /\u0037\u0037/g}
    assert.ok no, 'S15.5.4.14_A1_T16 #1 lead to throwing exception'
  catch e
    assert.ok e instanceof TypeError, 'S15.5.4.14_A1_T16 #2'
  split = String::split.call 6776767677.006771122677555, /\u0037\u0037/g
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T17 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T17 #2'
  assert.strictEqual split.length, 4, 'S15.5.4.14_A1_T17 #3'
  assert.strictEqual split.0, \6, 'S15.5.4.14_A1_T17 #4'
  assert.strictEqual split.1, \67676, 'S15.5.4.14_A1_T17 #5'
  assert.strictEqual split.2, '.006', 'S15.5.4.14_A1_T17 #6'
  assert.strictEqual split.3, \1, 'S15.5.4.14_A1_T17 #7'
  split = String::split.call 6776767677.006771122677555, /00/, 1
  assert.strictEqual typeof split, \object, 'S15.5.4.14_A1_T18 #1'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A1_T18 #2'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A1_T18 #3'
  assert.strictEqual split.0, '6776767677.', 'S15.5.4.14_A1_T18 #4'
  split = Object('one,two,three,four,five')split \,
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T1 #1'
  assert.strictEqual split.length, 5, 'S15.5.4.14_A2_T1 #2'
  assert.strictEqual split.0, \one, 'S15.5.4.14_A2_T1 #3'
  assert.strictEqual split.1, \two, 'S15.5.4.14_A2_T1 #4'
  assert.strictEqual split.2, \three, 'S15.5.4.14_A2_T1 #5'
  assert.strictEqual split.3, \four, 'S15.5.4.14_A2_T1 #6'
  assert.strictEqual split.4, \five, 'S15.5.4.14_A2_T1 #7'
  split = Object('one two three four five')split ' '
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T2 #1'
  assert.strictEqual split.length, 5, 'S15.5.4.14_A2_T2 #2'
  assert.strictEqual split.0, \one, 'S15.5.4.14_A2_T2 #3'
  assert.strictEqual split.1, \two, 'S15.5.4.14_A2_T2 #4'
  assert.strictEqual split.2, \three, 'S15.5.4.14_A2_T2 #5'
  assert.strictEqual split.3, \four, 'S15.5.4.14_A2_T2 #6'
  assert.strictEqual split.4, \five, 'S15.5.4.14_A2_T2 #7'
  split = Object('one two three four five')split RegExp(' '), 2
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T3 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T3 #2'
  assert.strictEqual split.0, \one, 'S15.5.4.14_A2_T3 #3'
  assert.strictEqual split.1, \two, 'S15.5.4.14_A2_T3 #4'
  split = Object('one two three')split ''
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T4 #1'
  assert.strictEqual split.length, 'one two three'length, 'S15.5.4.14_A2_T4 #2'
  assert.strictEqual split.0, \o, 'S15.5.4.14_A2_T4 #3'
  assert.strictEqual split.1, \n, 'S15.5.4.14_A2_T4 #4'
  assert.strictEqual split.11, \e, 'S15.5.4.14_A2_T4 #5'
  assert.strictEqual split.12, \e, 'S15.5.4.14_A2_T4 #6'
  split = Object('one-1,two-2,four-4')split /,/
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T5 #1'
  assert.strictEqual split.length, 3, 'S15.5.4.14_A2_T5 #2'
  assert.strictEqual split.0, 'one-1', 'S15.5.4.14_A2_T5 #3'
  assert.strictEqual split.1, 'two-2', 'S15.5.4.14_A2_T5 #4'
  assert.strictEqual split.2, 'four-4', 'S15.5.4.14_A2_T5 #5'
  string = Object 'one-1 two-2 three-3'
  split = string.split ''
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T6 #1'
  assert.strictEqual split.length, string.length, 'S15.5.4.14_A2_T6 #2'
  for i til split.length
    assert.strictEqual split[i], string.charAt(i), "S15.5.4.14_A2_T6 #" + (i + 3)
  if NATIVE # wrong behavior in some old browsers
    string = 'thisundefinedisundefinedaundefinedstringundefinedobject'
    split = string.split void
    assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T7 #1'
    assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T7 #2'
    assert.strictEqual split.0, string, 'S15.5.4.14_A2_T7 #3'
  string = \thisnullisnullanullstringnullobject
  expected = <[this is a string object]>
  split = string.split null
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T8 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T8 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T8 #" + (i + 3)
  string = \thistrueistrueatruestringtrueobject
  expected = <[this is a string object]>
  split = string.split true
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T9 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T9 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T9 #" + (i + 3)
  string = \this123is123a123string123object
  expected = <[this is a string object]>
  split = string.split 123
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T10 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T10 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T10 #" + (i + 3)
  split = Object('one-1,two-2,four-4')split ':'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T11 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T11 #2'
  assert.strictEqual split.0, 'one-1,two-2,four-4', 'S15.5.4.14_A2_T11 #3'
  split = Object('one-1 two-2 four-4')split 'r-42'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T12 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T12 #2'
  assert.strictEqual split.0, 'one-1 two-2 four-4', 'S15.5.4.14_A2_T12 #3'
  split = Object('one-1 two-2 four-4')split '-4'
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T13 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T13 #2'
  assert.strictEqual split.0, 'one-1 two-2 four', 'S15.5.4.14_A2_T13 #3'
  assert.strictEqual split.1, '', 'S15.5.4.14_A2_T13 #4'
  split = Object('one-1 two-2 four-4')split \on
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T14 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T14 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A2_T14 #3'
  assert.strictEqual split.1, 'e-1 two-2 four-4', 'S15.5.4.14_A2_T14 #4'
  split = new String!split ''
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T15 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A2_T15 #2'
  assert.strictEqual split.0, void, 'S15.5.4.14_A2_T15 #3'
  split = new String!split ' '
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T16 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T16 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A2_T16 #3'
  split = Object(' ')split ''
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T18 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T18 #2'
  assert.strictEqual split.0, ' ', 'S15.5.4.14_A2_T18 #3'
  split = Object(' ')split ' '
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T19 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T19 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A2_T19 #3'
  assert.strictEqual split.1, '', 'S15.5.4.14_A2_T19 #4'
  split = ''split \x
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T19 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T19 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A2_T19 #3'
  string = Object 'one-1 two-2 three-3'
  split = string.split new RegExp
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T20 #1'
  assert.strictEqual split.length, string.length, 'S15.5.4.14_A2_T20 #2'
  for i til split.length
    assert.strictEqual split[i], string.charAt(i), "S15.5.4.14_A2_T20 #" + (i + 3)
  split = Object(\hello)split \ll
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T21 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T21 #2'
  assert.strictEqual split.0, \he, 'S15.5.4.14_A2_T21 #3'
  assert.strictEqual split.1, \o, 'S15.5.4.14_A2_T21 #4'
  split = Object(\hello)split \l
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T22 #1'
  assert.strictEqual split.length, 3, 'S15.5.4.14_A2_T22 #2'
  assert.strictEqual split.0, \he, 'S15.5.4.14_A2_T22 #3'
  assert.strictEqual split.1, '', 'S15.5.4.14_A2_T22 #4'
  assert.strictEqual split.2, \o, 'S15.5.4.14_A2_T22 #5'
  split = Object(\hello)split \x
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T23 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T23 #2'
  assert.strictEqual split.0, \hello, 'S15.5.4.14_A2_T23 #3'
  split = Object(\hello)split \h
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T24 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T24 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A2_T24 #3'
  assert.strictEqual split.1, \ello, 'S15.5.4.14_A2_T24 #4'
  split = Object(\hello)split \o
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T25 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T25 #2'
  assert.strictEqual split.0, \hell, 'S15.5.4.14_A2_T25 #3'
  assert.strictEqual split.1, '', 'S15.5.4.14_A2_T25 #4'
  split = Object(\hello)split \hello
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T26 #1'
  assert.strictEqual split.length, 2, 'S15.5.4.14_A2_T26 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A2_T26 #3'
  assert.strictEqual split.1, '', 'S15.5.4.14_A2_T26 #4'
  split = Object(\hello)split void
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T27 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T27 #2'
  assert.strictEqual split.0, \hello, 'S15.5.4.14_A2_T27 #3'
  split = Object(\hello)split \hellothere
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T28 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T28 #2'
  assert.strictEqual split.0, \hello, 'S15.5.4.14_A2_T28 #3'
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1
  expected = ['' \00 '' '' '' \22 \33 \44 \60]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T29 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T29 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T29 #" + (i + 3)
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 1
  expected = ['']
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T30 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T30 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T30 #" + (i + 3)
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 2
  expected = ['' \00]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T31 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T31 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T31 #" + (i + 3)
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 0
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T32 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A2_T32 #2'
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 100
  expected = ['' \00 '' '' '' \22 \33 \44 \60]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T33 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T33 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T33 #" + (i + 3)
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 void
  expected = ['' \00 '' '' '' \22 \33 \44 \60]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T34 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T34 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T34 #" + (i + 3)
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 Math.pow(2 32) - 1
  expected = ['' \00 '' '' '' \22 \33 \44 \60]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T35 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T35 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T35 #" + (i + 3)
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 \boo
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T36 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A2_T36 #2'
  if NATIVE # wrong behavior in most browsers
    instance = Object 100111122133144155
    instance.split = String::split
    split = instance.split 1, -Math.pow(2 32) + 1
    assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T37 #1'
    assert.strictEqual split.length, 0, 'S15.5.4.14_A2_T37 #2'
  instance = Object 100111122133144155
  instance.split = String::split
  split = instance.split 1 NaN
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T38 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A2_T38 #2'
  instance = Object(\hello)split \l 0
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T39 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A2_T39 #2'
  split = Object(\hello)split \l 1
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T40 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A2_T40 #2'
  assert.strictEqual split.0, \he, 'S15.5.4.14_A2_T40 #3'
  split = Object(\hello)split \l 2
  expected = [\he '']
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T41 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T41 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T41 #" + (i + 3)
  split = Object(\hello)split \l 3
  expected = [\he '' \o]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T42 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T42 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T42 #" + (i + 3)
  split = Object(\hello)split \l 4
  expected = [\he '' \o]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A2_T43 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A2_T43 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A2_T43 #" + (i + 3)
  split = Object('one,two,three,four,five')split!
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T1 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T1 #2'
  assert.strictEqual split.0, 'one,two,three,four,five', 'S15.5.4.14_A3_T1 #3'
  split = String::split.call {}
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T2 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T2 #2'
  assert.strictEqual split.0, '[object Object]', 'S15.5.4.14_A3_T2 #3'
  split = String::split.call {toString: -> 'function(){}'}
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T3 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T3 #2'
  assert.strictEqual split.0, 'function(){}', 'S15.5.4.14_A3_T3 #3'
  split = String::split.call Object NaN
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T4 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T4 #2'
  assert.strictEqual split.0, \NaN, 'S15.5.4.14_A3_T4 #3'
  split = String::split.call Object -1234567890
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T5 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T5 #2'
  assert.strictEqual split.0, '-1234567890', 'S15.5.4.14_A3_T5 #3'
  instance = Object -1e21
  split = String::split.call instance
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T6 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T6 #2'
  assert.strictEqual split.0, instance.toString!, 'S15.5.4.14_A3_T6 #3'
  split = String::split.call Math
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T7 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T7 #2'
  assert.strictEqual split.0, '[object Math]', 'S15.5.4.14_A3_T7 #3'
  split = String::split.call [1 2 3 4 5]
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T8 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T8 #2'
  assert.strictEqual split.0, '1,2,3,4,5', 'S15.5.4.14_A3_T8 #3'
  split = String::split.call Object no
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T9 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T9 #2'
  assert.strictEqual split.0, \false, 'S15.5.4.14_A3_T9 #3'
  split = String::split.call new String
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T10 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T10 #2'
  assert.strictEqual split.0, '', 'S15.5.4.14_A3_T10 #3'
  split = String::split.call Object ' '
  assert.strictEqual split@@, Array, 'S15.5.4.14_A3_T11 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A3_T11 #2'
  assert.strictEqual split.0, ' ', 'S15.5.4.14_A3_T11 #3'
  if NATIVE # wrong behavior in old IE
    split = Object(\hello)split /l/
    assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T1 #1'
    assert.strictEqual split.length, 3, 'S15.5.4.14_A4_T1 #2'
    assert.strictEqual split.0, 'he', 'S15.5.4.14_A4_T1 #3'
    assert.strictEqual split.1, '', 'S15.5.4.14_A4_T1 #4'
    assert.strictEqual split.2, 'o', 'S15.5.4.14_A4_T1 #5'
  split = Object(\hello)split /l/, 0
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T2 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A4_T2 #2'
  split = Object(\hello)split /l/, 1
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T3 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A4_T3 #2'
  assert.strictEqual split.0, 'he', 'S15.5.4.14_A4_T3 #3'
  if NATIVE # wrong behavior in old IE
    split = Object(\hello)split /l/, 2
    assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T4 #1'
    assert.strictEqual split.length, 2, 'S15.5.4.14_A4_T4 #2'
    assert.strictEqual split.0, 'he', 'S15.5.4.14_A4_T4 #3'
    assert.strictEqual split.1, '', 'S15.5.4.14_A4_T4 #4'
    split = Object(\hello)split /l/, 3
    assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T5 #1'
    assert.strictEqual split.length, 3, 'S15.5.4.14_A4_T5 #2'
    assert.strictEqual split.0, 'he', 'S15.5.4.14_A4_T5 #3'
    assert.strictEqual split.1, '', 'S15.5.4.14_A4_T5 #4'
    assert.strictEqual split.2, 'o', 'S15.5.4.14_A4_T5 #5'
    split = Object(\hello)split /l/, 4
    assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T6 #1'
    assert.strictEqual split.length, 3, 'S15.5.4.14_A4_T6 #2'
    assert.strictEqual split.0, 'he', 'S15.5.4.14_A4_T6 #3'
    assert.strictEqual split.1, '', 'S15.5.4.14_A4_T6 #4'
    assert.strictEqual split.2, 'o', 'S15.5.4.14_A4_T6 #5'
    split = Object(\hello)split /l/, void
    assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T7 #1'
    assert.strictEqual split.length, 3, 'S15.5.4.14_A4_T7 #2'
    assert.strictEqual split.0, 'he', 'S15.5.4.14_A4_T7 #3'
    assert.strictEqual split.1, '', 'S15.5.4.14_A4_T7 #4'
    assert.strictEqual split.2, 'o', 'S15.5.4.14_A4_T7 #5'
  split = Object(\hello)split /l/, \hi
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T8 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A4_T8 #2'
  split = Object(\hello)split new RegExp
  expected = <[h e l l o]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T10 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T10 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T10 #" + (i + 3)
  split = Object(\hello)split new RegExp!, 0
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T11 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A4_T11 #2'
  split = Object(\hello)split new RegExp!, 1
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T12 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A4_T12 #2'
  assert.strictEqual split.0, \h, 'S15.5.4.14_A4_T12 #3'
  split = Object(\hello)split new RegExp!, 2
  expected = <[h e]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T13 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T13 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T13 #" + (i + 3)
  split = Object(\hello)split new RegExp!, 3
  expected = <[h e l]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T14 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T14 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T14 #" + (i + 3)
  split = Object(\hello)split new RegExp!, 4
  expected = <[h e l l]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T15 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T15 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T15 #" + (i + 3)
  split = Object(\hello)split new RegExp!, void
  expected = <[h e l l o]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T16 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T16 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T16 #" + (i + 3)
  split = Object(\hello)split new RegExp!, \hi
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T18 #1'
  assert.strictEqual split.length, 0, 'S15.5.4.14_A4_T18 #2'
  split = Object('a b c de f')split /\s/
  expected = <[a b c de f]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T19 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T19 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T19 #" + (i + 3)
  split = Object('a b c de f')split /\s/, 3
  expected = <[a b c]>
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T20 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T20 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T20 #" + (i + 3)
  split = Object('a b c de f')split /X/
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T21 #1'
  assert.strictEqual split.length, 1, 'S15.5.4.14_A4_T21 #2'
  assert.strictEqual split.0, 'a b c de f', "S15.5.4.14_A4_T21 #3"
  split = Object('dfe23iu 34 =+65--')split /\d+/
  expected = ['dfe' 'iu ' ' =+' '--']
  assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T22 #1'
  assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T22 #2'
  for i til expected.length
    assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T22 #" + (i + 3)
  if NATIVE # wrong behavior in old IE
    split = Object(\abc)split /[a-z]/
    expected = ['' '' '' '']
    assert.strictEqual split@@, Array, 'S15.5.4.14_A4_T24 #1'
    assert.strictEqual split.length, expected.length, 'S15.5.4.14_A4_T24 #2'
    for i til expected.length
      assert.strictEqual expected[i], split[i], "S15.5.4.14_A4_T24 #" + (i + 3)

test 'RegExp#@@split' (assert)->
  assert.isFunction /./[Symbol?split]
  assert.arity /./[Symbol?split], 2
  assert.strictEqual /\s/[Symbol?split]('a b c de f').length, 5
  assert.strictEqual /\s/[Symbol?split]('a b c de f' void).length, 5
  assert.strictEqual /\s/[Symbol?split]('a b c de f' 1).length, 1
  assert.strictEqual /\s/[Symbol?split]('a b c de f' 10).length, 5

test '@@split logic' (assert)->
  'use strict'
  str = if STRICT => \qwe else Object \qwe
  num = if STRICT => 123 else Object 123
  O = {(Symbol?split): (a, b)-> {a, b}}
  assert.strictEqual str.split(O, 42)a, str
  assert.strictEqual str.split(O, 42)b, 42
  assert.strictEqual ''split.call(num, O, 42)a, num
  assert.strictEqual ''split.call(num, O, 42)b, 42
  re = /./
  re[Symbol?split] = (a, b)-> {a, b}
  assert.strictEqual str.split(re, 42)a, str
  assert.strictEqual str.split(re, 42)b, 42
  assert.strictEqual ''split.call(num, re, 42)a, num
  assert.strictEqual ''split.call(num, re, 42)b, 42