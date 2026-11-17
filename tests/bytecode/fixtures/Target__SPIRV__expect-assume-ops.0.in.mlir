"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, ExpectAssumeKHR], [SPV_KHR_expect_assume]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> (), sym_name = "assume_true"}> ({
    ^bb0(%arg8: i1 loc("<stdin>":4:10)):
      "spirv.KHR.AssumeTrue"(%arg8) : (i1) -> () loc("<stdin>":5:7)
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> i32, sym_name = "expect_scalar_int"}> ({
    ^bb0(%arg6: i32 loc("<stdin>":9:10), %arg7: i32 loc("<stdin>":9:22)):
      %3 = "spirv.KHR.Expect"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":10:12)
      "spirv.ReturnValue"(%3) : (i32) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1, i1) -> i1, sym_name = "expect_scalar_bool"}> ({
    ^bb0(%arg4: i1 loc("<stdin>":14:10), %arg5: i1 loc("<stdin>":14:21)):
      %2 = "spirv.KHR.Expect"(%arg4, %arg5) : (i1, i1) -> i1 loc("<stdin>":15:12)
      "spirv.ReturnValue"(%2) : (i1) -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi32>, sym_name = "expect_vector_int"}> ({
    ^bb0(%arg2: vector<4xi32> loc("<stdin>":19:10), %arg3: vector<4xi32> loc("<stdin>":19:32)):
      %1 = "spirv.KHR.Expect"(%arg2, %arg3) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":20:12)
      "spirv.ReturnValue"(%1) : (vector<4xi32>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>, vector<4xi1>) -> vector<4xi1>, sym_name = "expect_vector_bool"}> ({
    ^bb0(%arg0: vector<4xi1> loc("<stdin>":24:10), %arg1: vector<4xi1> loc("<stdin>":24:31)):
      %0 = "spirv.KHR.Expect"(%arg0, %arg1) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1> loc("<stdin>":25:12)
      "spirv.ReturnValue"(%0) : (vector<4xi1>) -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
