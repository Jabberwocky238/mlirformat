"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dense_custom_element_type"}> ({
    "test.dummy"() {attr = dense<tensor<3x!test.dense_element> : [1 : i32, 2 : i32, 3 : i32]>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dense_custom_element_type_2d"}> ({
    "test.dummy"() {attr = dense<tensor<2x2x!test.dense_element> : [[1 : i32, 2 : i32], [3 : i32, 4 : i32]]>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dense_custom_element_splat"}> ({
    "test.dummy"() {attr = dense<tensor<4x!test.dense_element> : 42 : i32>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dense_i32_1d"}> ({
    "test.dummy"() {attr = dense<[1, 2, 3]> : tensor<3xi32>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
