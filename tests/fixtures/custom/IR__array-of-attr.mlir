module {
  test.array_of_attr_op a = [ begin 0 : index end,  begin 2 : index end ], b = [0, 1, -42, 42], c = [a, b, b, a, "+"]
  test.array_of_attr_op a = [], b = [], c = []
  "test.test_array_float"() {test.float_arr = [1.000000e+00 : f32, 1.000000e+00, 0x7FF0000000000000 : f64]} : () -> ()
}

