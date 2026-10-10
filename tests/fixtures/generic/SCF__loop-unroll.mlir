#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<?xf32>) -> (), sym_name = "dynamic_loop_unroll"}> ({
  ^bb0(%arg33: index, %arg34: index, %arg35: index, %arg36: memref<?xf32>):
    %31 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg33, %arg34, %arg35) ({
    ^bb0(%arg37: index):
      "memref.store"(%31, %arg36, %arg37) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index, memref<?xf32>) -> (), sym_name = "dynamic_loop_unroll_outer_by_2"}> ({
  ^bb0(%arg24: index, %arg25: index, %arg26: index, %arg27: index, %arg28: index, %arg29: index, %arg30: memref<?xf32>):
    %30 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg24, %arg25, %arg26) ({
    ^bb0(%arg31: index):
      "scf.for"(%arg27, %arg28, %arg29) ({
      ^bb0(%arg32: index):
        "memref.store"(%30, %arg30, %arg32) : (f32, memref<?xf32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index, memref<?xf32>) -> (), sym_name = "dynamic_loop_unroll_inner_by_2"}> ({
  ^bb0(%arg15: index, %arg16: index, %arg17: index, %arg18: index, %arg19: index, %arg20: index, %arg21: memref<?xf32>):
    %29 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg15, %arg16, %arg17) ({
    ^bb0(%arg22: index):
      "scf.for"(%arg18, %arg19, %arg20) ({
      ^bb0(%arg23: index):
        "memref.store"(%29, %arg21, %arg23) : (f32, memref<?xf32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_2"}> ({
  ^bb0(%arg13: memref<?xf32>):
    %25 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "arith.constant"() <{value = 20 : index}> : () -> index
    %28 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%26, %27, %28) ({
    ^bb0(%arg14: index):
      "memref.store"(%25, %arg13, %arg14) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_step_2_unroll_by_2"}> ({
  ^bb0(%arg11: memref<?xf32>):
    %21 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "arith.constant"() <{value = 19 : index}> : () -> index
    %24 = "arith.constant"() <{value = 2 : index}> : () -> index
    "scf.for"(%22, %23, %24) ({
    ^bb0(%arg12: index):
      "memref.store"(%21, %arg11, %arg12) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_3"}> ({
  ^bb0(%arg9: memref<?xf32>):
    %17 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 20 : index}> : () -> index
    %20 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%18, %19, %20) ({
    ^bb0(%arg10: index):
      "memref.store"(%17, %arg9, %arg10) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_3_promote_epilogue"}> ({
  ^bb0(%arg7: memref<?xf32>):
    %13 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 10 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%14, %15, %16) ({
    ^bb0(%arg8: index):
      "memref.store"(%13, %arg7, %arg8) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_up_to_factor"}> ({
  ^bb0(%arg5: memref<?xf32>):
    %10 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index
    "affine.for"(%11, %12) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg6: index):
      "affine.store"(%10, %arg5, %arg6) <{map = #map}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (f32, f32), sym_name = "static_loop_unroll_by_3_rename_epilogue_arguments"}> ({
    %3 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 20 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7:2 = "scf.for"(%4, %5, %6, %3, %3) ({
    ^bb0(%arg2: index, %arg3: f32, %arg4: f32):
      %8 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%8, %9) : (f32, f32) -> ()
    }) : (index, index, index, f32, f32) -> (f32, f32)
    "func.return"(%7#0, %7#1) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_5_with_cleanup"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    "affine.for"(%1, %2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index):
      "memref.store"(%0, %arg0, %arg1) : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 64, (d0 floordiv 8) ceildiv 64, -d0 - 16, d0 * -64)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (40)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_static_yield_value_test1"}> ({
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index, %arg1: i1):
      %3 = "affine.max"(%1) <{map = #map}> : (index) -> index
      "affine.yield"(%0) : (i1) -> ()
    }) : (i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 64, (d0 floordiv 8) ceildiv 64, -d0 - 16, d0 * -64)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (40)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_yield_loop_iv"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index, %arg1: index):
      %2 = "affine.max"(%arg0) <{map = #map}> : (index) -> index
      "affine.yield"(%arg0) : (index) -> ()
    }) : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 64, (d0 floordiv 8) ceildiv 64, -d0 - 16, d0 * -64)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (40)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_yield_iter_arg"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index, %arg1: index):
      %2 = "affine.max"(%arg1) <{map = #map}> : (index) -> index
      "affine.yield"(%arg1) : (index) -> ()
    }) : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32), sym_name = "static_loop_unroll_with_integer_iv"}> ({
    %0 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 20 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4:2 = "scf.for"(%1, %2, %3, %0, %0) ({
    ^bb0(%arg0: i32, %arg1: f32, %arg2: f32):
      %5 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%5, %6) : (f32, f32) -> ()
    }) : (i32, i32, i32, f32, f32) -> (f32, f32)
    "func.return"(%4#0, %4#1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "loop_unroll_static_yield_value_defined_above"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4:2 = "scf.for"(%1, %3, %2, %0, %arg0) ({
    ^bb0(%arg1: index, %arg2: i32, %arg3: i32):
      %5 = "arith.andi"(%arg3, %arg2) : (i32, i32) -> i32
      "scf.yield"(%5, %arg0) : (i32, i32) -> ()
    }) : (index, index, index, i32, i32) -> (i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

