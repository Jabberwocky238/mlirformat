"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "cooperative_matrix_length"}> ({
    %0 = "spirv.KHR.CooperativeMatrixLength"() <{cooperative_matrix_type = !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>}> : () -> i32 loc("<stdin>":3:10)
    "spirv.ReturnValue"(%0) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
