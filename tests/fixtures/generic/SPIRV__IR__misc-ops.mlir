"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "undef"}> ({
    %0 = "spirv.Undef"() : () -> f32
    %1 = "spirv.Undef"() : () -> vector<4xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "assume_true"}> ({
  ^bb0(%arg0: i1):
    "spirv.KHR.AssumeTrue"(%arg0) : (i1) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "expect_scalar_int"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "spirv.KHR.Expect"(%arg0, %arg1) : (i32, i32) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i1) -> i1, sym_name = "expect_scalar_bool"}> ({
  ^bb0(%arg0: i1, %arg1: i1):
    %0 = "spirv.KHR.Expect"(%arg0, %arg1) : (i1, i1) -> i1
    "spirv.ReturnValue"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi32>, sym_name = "expect_vector_int"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.KHR.Expect"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "spirv.ReturnValue"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi1>, vector<4xi1>) -> vector<4xi1>, sym_name = "expect_vector_bool"}> ({
  ^bb0(%arg0: vector<4xi1>, %arg1: vector<4xi1>):
    %0 = "spirv.KHR.Expect"(%arg0, %arg1) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    "spirv.ReturnValue"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
