"builtin.module"() ({
  "test.array_of_attr_op"() <{a = #test<array_of_ugly[ begin 0 : index end,  begin 2 : index end ]>, b = #test<array_of_ints[0, 1, -42, 42]>, c = #test<array_of_enums[a, b, b, a, "+"]>}> : () -> ()
  "test.array_of_attr_op"() <{a = #test<array_of_ugly[]>, b = #test<array_of_ints[]>, c = #test<array_of_enums[]>}> : () -> ()
  "test.test_array_float"() {test.float_arr = [1.000000e+00 : f32, 1.000000e+00, 0x7FF0000000000000 : f64]} : () -> ()
}) : () -> ()

