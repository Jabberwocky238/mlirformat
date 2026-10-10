module {
  test.with_properties a = 32, b = "foo", c = "bar", flag = true, array = [1, 2, 3, 4], array32 = [5, 6]
  test.with_nice_properties "foo bar" is -3
  test.with_wrapped_properties <{prop = "content for properties"}>
  test.empty_properties 
  test.using_property_in_custom [1, 4, 20]
  test.using_property_ref_in_custom 1 + 4 = 5
  %c0_i64 = arith.constant 0 : i64
  %b1:2, %b2 = test.variadic_segment_prop %c0_i64, %c0_i64 : %c0_i64 : i64, i64 : i64  end
  test.with_default_valued_properties na
  test.with_default_valued_properties 1 "foo" 0 unit
  test.with_optional_properties simple = 0
  test.with_optional_properties simple = 1 simplei8 = -1 simpleui8 = 255
  test.with_optional_properties
  test.with_optional_properties anAttr = 0 simple = 1 nonTrivialStorage = "foo" hasDefault = some<0> nested = some<1> longSyntax = some<"bar"> hasUnit maybeUnit = some<unit>
  test.with_optional_properties nested = some<none>
  test.with_array_properties ints = [1, 2] strings = ["a", "b"] nested = [[1, 2], [3, 4]] opt = [-1, -2] explicitOptions = [none, 0] explicitUnits = [unit, unit_absent]
}

