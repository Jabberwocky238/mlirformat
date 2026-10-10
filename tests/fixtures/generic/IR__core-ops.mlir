#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<()[s0] -> (s0 + 1)>
#map2 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "func_with_ops"}> ({
  ^bb0(%arg9: f32):
    %61 = "getTensor"() : () -> tensor<4x4x?xf32>
    %62 = "arith.constant"() <{value = 2 : index}> : () -> index
    %63 = "tensor.dim"(%61, %62) : (tensor<4x4x?xf32>, index) -> index
    %64 = "arith.addf"(%arg9, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4x?xf32>, f32, i32, index, i64, f16) -> (), sym_name = "standard_instrs"}> ({
  ^bb0(%arg3: tensor<4x4x?xf32>, %arg4: f32, %arg5: i32, %arg6: index, %arg7: i64, %arg8: f16):
    %14 = "arith.constant"() <{value = 2 : index}> : () -> index
    %15 = "tensor.dim"(%arg3, %14) : (tensor<4x4x?xf32>, index) -> index
    %16 = "func.constant"() <{value = @func_with_ops}> : () -> ((f32) -> ())
    %17 = "func.constant"() <{value = @affine_apply}> : () -> (() -> ())
    %18 = "arith.addi"(%arg5, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %19 = "arith.addi"(%18, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %20 = "arith.addi"(%18, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %21 = "arith.addf"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %22 = "arith.addf"(%arg4, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %23 = "arith.constant"() <{value = true}> : () -> i1
    %24 = "arith.constant"() <{value = dense<0> : tensor<42xi32>}> : () -> tensor<42xi32>
    %25 = "arith.constant"() <{value = dense<0> : vector<42xi32>}> : () -> vector<42xi32>
    %26 = "arith.constant"() <{value = dense<true> : tensor<42xi1>}> : () -> tensor<42xi1>
    %27 = "arith.constant"() <{value = dense<true> : vector<42xi1>}> : () -> vector<42xi1>
    %28 = "arith.select"(%23, %arg6, %arg6) : (i1, index, index) -> index
    %29 = "arith.select"(%26, %24, %24) : (tensor<42xi1>, tensor<42xi32>, tensor<42xi32>) -> tensor<42xi32>
    %30 = "arith.select"(%27, %25, %25) : (vector<42xi1>, vector<42xi32>, vector<42xi32>) -> vector<42xi32>
    %31 = "arith.select"(%23, %arg6, %arg6) : (i1, index, index) -> index
    %32 = "arith.select"(%23, %24, %24) : (i1, tensor<42xi32>, tensor<42xi32>) -> tensor<42xi32>
    %33 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %34 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<42xf32>}> : () -> tensor<42xf32>
    %35 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %36 = "arith.cmpf"(%21, %22) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
    %37 = "arith.cmpf"(%21, %22) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
    %38 = "arith.cmpf"(%35, %35) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xi1>
    %39 = "arith.cmpf"(%35, %35) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xi1>
    %40 = "arith.cmpf"(%34, %34) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (tensor<42xf32>, tensor<42xf32>) -> tensor<42xi1>
    %41 = "arith.cmpf"(%35, %35) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xi1>
    %42 = "arith.constant"() <{value = true}> : () -> i1
    %43 = "arith.constant"() <{value = false}> : () -> i1
    %44 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %45 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %46 = "math.absf"(%35) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %47 = "math.absf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    %48 = "math.ceil"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %49 = "math.ceil"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %50 = "math.ceil"(%35) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %51 = "math.ceil"(%arg3) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    %52 = "math.copysign"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %53 = "math.copysign"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %54 = "math.copysign"(%35, %35) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %55 = "math.copysign"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>, tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    %56 = "math.rsqrt"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %57 = "math.floor"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %58 = "math.floor"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %59 = "math.floor"(%35) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %60 = "math.floor"(%arg3) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "affine_apply"}> ({
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "affine.apply"(%10) <{map = #map}> : (index) -> index
    %13 = "affine.apply"(%10) <{map = #map1}> : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "return_op"}> ({
  ^bb0(%arg2: i32):
    "func.return"(%arg2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "calls"}> ({
  ^bb0(%arg1: i32):
    %3 = "func.call"(%arg1) <{callee = @return_op}> : (i32) -> i32
    %4 = "func.call"(%3) <{callee = @return_op}> : (i32) -> i32
    %5 = "func.call"(%3) <{callee = @return_op}> : (i32) -> i32
    %6 = "func.constant"() <{value = @affine_apply}> : () -> (() -> ())
    "func.call_indirect"(%6) : (() -> ()) -> ()
    %7 = "func.constant"() <{value = @return_op}> : () -> ((i32) -> i32)
    %8 = "func.call_indirect"(%7, %arg1) : ((i32) -> i32, i32) -> i32
    %9 = "func.call_indirect"(%7, %arg1) : ((i32) -> i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4x?xf32>) -> (), sym_name = "test_dimop"}> ({
  ^bb0(%arg0: tensor<4x4x?xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<4x4x?xf32>, index) -> index
    %2 = "affine.apply"(%1) <{map = #map2}> : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

