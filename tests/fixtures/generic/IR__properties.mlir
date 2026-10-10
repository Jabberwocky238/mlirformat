"builtin.module"() ({
  "test.with_properties"() <{a = 32 : i64, array = array<i64: 1, 2, 3, 4>, array32 = array<i32: 5, 6>, b = "foo", c = "bar", flag = true}> : () -> ()
  "test.with_nice_properties"() <{prop = {label = "foo bar", value = -3 : i32}}> : () -> ()
  "test.with_wrapped_properties"() <{prop = "content for properties"}> : () -> ()
  "test.empty_properties"() : () -> ()
  "test.using_property_in_custom"() <{prop = array<i64: 1, 4, 20>}> : () -> ()
  "test.using_property_ref_in_custom"() <{first = 1 : i64, second = 4 : i64}> : () -> ()
  %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64
  %1:3 = "test.variadic_segment_prop"(%0, %0, %0) <{operandSegmentSizes = array<i32: 2, 1>, resultSegmentSizes = array<i32: 2, 1>}> : (i64, i64, i64) -> (i64, i64, i64)
  "test.with_default_valued_properties"() <{a = 0 : i32, b = "", c = -1 : i32, unit = false}> : () -> ()
  "test.with_default_valued_properties"() <{a = 1 : i32, b = "foo", c = 0 : i32, unit}> : () -> ()
  "test.with_optional_properties"() <{hasDefault = [], hasUnit = false, longSyntax = [], maybeUnit = [], nested = [], nonTrivialStorage = [], simple = [0], simplei8 = [], simpleui8 = []}> : () -> ()
  "test.with_optional_properties"() <{hasDefault = [], hasUnit = false, longSyntax = [], maybeUnit = [], nested = [], nonTrivialStorage = [], simple = [1], simplei8 = [-1 : i8], simpleui8 = [-1 : i8]}> : () -> ()
  "test.with_optional_properties"() <{hasDefault = [], hasUnit = false, longSyntax = [], maybeUnit = [], nested = [], nonTrivialStorage = [], simple = [], simplei8 = [], simpleui8 = []}> : () -> ()
  "test.with_optional_properties"() <{anAttr = 0 : i32, hasDefault = [0], hasUnit, longSyntax = ["bar"], maybeUnit = [unit], nested = [[1]], nonTrivialStorage = ["foo"], simple = [1], simplei8 = [], simpleui8 = []}> : () -> ()
  "test.with_optional_properties"() <{hasDefault = [], hasUnit = false, longSyntax = [], maybeUnit = [], nested = [[]], nonTrivialStorage = [], simple = [], simplei8 = [], simpleui8 = []}> : () -> ()
  "test.with_array_properties"() <{explicitOptions = [[], [0]], explicitUnits = [unit, false], hasDefault = [], ints = [1, 2], nested = [[1 : i32, 2 : i32], [3 : i32, 4 : i32]], opt = [[-1 : i32, -2 : i32]], strings = ["a", "b"]}> : () -> ()
}) : () -> ()

