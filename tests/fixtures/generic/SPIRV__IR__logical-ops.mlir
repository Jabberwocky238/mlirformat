"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi1>) -> i1, sym_name = "any_vector2"}> ({
  ^bb0(%arg0: vector<2xi1>):
    %0 = "spirv.Any"(%arg0) : (vector<2xi1>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi1>) -> i1, sym_name = "any_vector3"}> ({
  ^bb0(%arg0: vector<3xi1>):
    %0 = "spirv.Any"(%arg0) : (vector<3xi1>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi1>) -> i1, sym_name = "any_vector4"}> ({
  ^bb0(%arg0: vector<4xi1>):
    %0 = "spirv.Any"(%arg0) : (vector<4xi1>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi1>) -> i1, sym_name = "all_vector2"}> ({
  ^bb0(%arg0: vector<2xi1>):
    %0 = "spirv.All"(%arg0) : (vector<2xi1>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi1>) -> i1, sym_name = "all_vector3"}> ({
  ^bb0(%arg0: vector<3xi1>):
    %0 = "spirv.All"(%arg0) : (vector<3xi1>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi1>) -> i1, sym_name = "all_vector4"}> ({
  ^bb0(%arg0: vector<4xi1>):
    %0 = "spirv.All"(%arg0) : (vector<4xi1>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "iequal_scalar"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "spirv.IEqual"(%arg0, %arg1) : (i32, i32) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "iequal_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.IEqual"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "inotequal_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.INotEqual"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i1, sym_name = "isfinite_scalar"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.IsFinite"(%arg1) : (f32) -> i1
    "func.return"(%1) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xi1>, sym_name = "isfinite_vector"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.IsFinite"(%arg0) : (vector<2xf32>) -> vector<2xi1>
    "func.return"(%0) : (vector<2xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i1, sym_name = "isinf_scalar"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.IsInf"(%arg1) : (f32) -> i1
    "func.return"(%1) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xi1>, sym_name = "isinf_vector"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.IsInf"(%arg0) : (vector<2xf32>) -> vector<2xi1>
    "func.return"(%0) : (vector<2xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i1, sym_name = "isnan_scalar"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.IsNan"(%arg1) : (f32) -> i1
    "func.return"(%1) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xi1>, sym_name = "isnan_vector"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.IsNan"(%arg0) : (vector<2xf32>) -> vector<2xi1>
    "func.return"(%0) : (vector<2xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i1, sym_name = "isnormal_scalar"}> ({
  ^bb0(%arg6: f32):
    %4 = "spirv.IsNormal"(%arg6) : (f32) -> i1
    "func.return"(%4) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xi1>, sym_name = "isnormal_vector"}> ({
  ^bb0(%arg5: vector<2xf32>):
    %3 = "spirv.IsNormal"(%arg5) : (vector<2xf32>) -> vector<2xi1>
    "func.return"(%3) : (vector<2xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1, i1) -> (), sym_name = "logicalBinary"}> ({
  ^bb0(%arg2: i1, %arg3: i1, %arg4: i1):
    %1 = "spirv.LogicalAnd"(%arg2, %arg3) : (i1, i1) -> i1
    %2 = "spirv.LogicalAnd"(%1, %arg4) : (i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "logicalBinary2"}> ({
  ^bb0(%arg0: vector<4xi1>, %arg1: vector<4xi1>):
    %0 = "spirv.LogicalAnd"(%arg0, %arg1) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "logicalUnary"}> ({
  ^bb0(%arg1: i1, %arg2: i1):
    %1 = "spirv.LogicalNot"(%arg1) : (i1) -> i1
    %2 = "spirv.LogicalNot"(%1) : (i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi1>) -> (), sym_name = "logicalUnary2"}> ({
  ^bb0(%arg0: vector<4xi1>):
    %0 = "spirv.LogicalNot"(%arg0) : (vector<4xi1>) -> vector<4xi1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "select_op_bool"}> ({
  ^bb0(%arg15: i1):
    %21 = "spirv.Constant"() <{value = true}> : () -> i1
    %22 = "spirv.Constant"() <{value = false}> : () -> i1
    %23 = "spirv.Select"(%arg15, %21, %22) : (i1, i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "select_op_int"}> ({
  ^bb0(%arg14: i1):
    %18 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
    %19 = "spirv.Constant"() <{value = 3 : i32}> : () -> i32
    %20 = "spirv.Select"(%arg14, %18, %19) : (i1, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "select_op_float"}> ({
  ^bb0(%arg13: i1):
    %15 = "spirv.Constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %16 = "spirv.Constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %17 = "spirv.Select"(%arg13, %15, %16) : (i1, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "select_op_bfloat16"}> ({
  ^bb0(%arg12: i1):
    %12 = "spirv.Constant"() <{value = 2.000000e+00 : bf16}> : () -> bf16
    %13 = "spirv.Constant"() <{value = 3.000000e+00 : bf16}> : () -> bf16
    %14 = "spirv.Select"(%arg12, %12, %13) : (i1, bf16, bf16) -> bf16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "select_op_ptr"}> ({
  ^bb0(%arg11: i1):
    %9 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %10 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %11 = "spirv.Select"(%arg11, %9, %10) : (i1, !spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> !spirv.ptr<f32, Function>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "select_op_vec"}> ({
  ^bb0(%arg10: i1):
    %6 = "spirv.Constant"() <{value = dense<[2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<3xf32>}> : () -> vector<3xf32>
    %7 = "spirv.Constant"() <{value = dense<[5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<3xf32>}> : () -> vector<3xf32>
    %8 = "spirv.Select"(%arg10, %6, %7) : (i1, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi1>) -> (), sym_name = "select_op_vec_condn_vec"}> ({
  ^bb0(%arg9: vector<3xi1>):
    %3 = "spirv.Constant"() <{value = dense<[2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<3xf32>}> : () -> vector<3xf32>
    %4 = "spirv.Constant"() <{value = dense<[5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<3xf32>}> : () -> vector<3xf32>
    %5 = "spirv.Select"(%arg9, %3, %4) : (vector<3xi1>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, !spirv.array<4 x i32>, !spirv.array<4 x i32>) -> (), sym_name = "select_op_array"}> ({
  ^bb0(%arg6: i1, %arg7: !spirv.array<4 x i32>, %arg8: !spirv.array<4 x i32>):
    %2 = "spirv.Select"(%arg6, %arg7, %arg8) : (i1, !spirv.array<4 x i32>, !spirv.array<4 x i32>) -> !spirv.array<4 x i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, !spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>) -> (), sym_name = "select_op_struct"}> ({
  ^bb0(%arg3: i1, %arg4: !spirv.struct<(i32, i32)>, %arg5: !spirv.struct<(i32, i32)>):
    %1 = "spirv.Select"(%arg3, %arg4, %arg5) : (i1, !spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>) -> !spirv.struct<(i32, i32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, !spirv.matrix<4 x vector<3xf32>>, !spirv.matrix<4 x vector<3xf32>>) -> (), sym_name = "select_op_matrix"}> ({
  ^bb0(%arg0: i1, %arg1: !spirv.matrix<4 x vector<3xf32>>, %arg2: !spirv.matrix<4 x vector<3xf32>>):
    %0 = "spirv.Select"(%arg0, %arg1, %arg2) : (i1, !spirv.matrix<4 x vector<3xf32>>, !spirv.matrix<4 x vector<3xf32>>) -> !spirv.matrix<4 x vector<3xf32>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "sgt_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.SGreaterThan"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "sge_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.SGreaterThanEqual"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "slt_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.SLessThan"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "slte_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.SLessThanEqual"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "ugt_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.UGreaterThan"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "ugte_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.UGreaterThanEqual"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "ult_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.ULessThan"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi1>, sym_name = "ulte_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "spirv.ULessThanEqual"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%0) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

