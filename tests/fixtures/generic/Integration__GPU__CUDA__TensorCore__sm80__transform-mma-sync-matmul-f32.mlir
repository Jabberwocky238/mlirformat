#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> f32, sym_name = "compute_linspace_val"}> ({
  ^bb0(%arg22: index, %arg23: index, %arg24: index):
    %20 = "arith.index_cast"(%arg22) : (index) -> i32
    %21 = "arith.index_cast"(%arg23) : (index) -> i32
    %22 = "arith.index_cast"(%arg24) : (index) -> i32
    %23 = "arith.muli"(%20, %22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %24 = "arith.addi"(%21, %23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %25 = "arith.sitofp"(%24) : (i32) -> f32
    "func.return"(%25) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf32>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "memref.dim"(%3, %4) : (memref<16x8xf32>, index) -> index
    %7 = "memref.dim"(%3, %5) : (memref<16x8xf32>, index) -> index
    %8 = "memref.dim"(%1, %5) : (memref<16x4xf32>, index) -> index
    %9 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "arith.constant"() <{value = 32 : index}> : () -> index
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg20: index):
      "scf.for"(%4, %8, %5) ({
      ^bb0(%arg21: index):
        %19 = "func.call"(%arg20, %arg21, %8) <{callee = @compute_linspace_val}> : (index, index, index) -> f32
        "memref.store"(%19, %1, %arg20, %arg21) : (f32, memref<16x4xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%4, %8, %5) ({
    ^bb0(%arg18: index):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg19: index):
        %18 = "func.call"(%arg18, %arg19, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f32
        "memref.store"(%18, %2, %arg18, %arg19) : (f32, memref<4x8xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg16: index):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg17: index):
        %17 = "func.call"(%arg16, %arg17, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f32
        "memref.store"(%17, %3, %arg16, %arg17) : (f32, memref<16x8xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "memref.cast"(%1) : (memref<16x4xf32>) -> memref<*xf32>
    %13 = "memref.cast"(%2) : (memref<4x8xf32>) -> memref<*xf32>
    %14 = "memref.cast"(%3) : (memref<16x8xf32>) -> memref<*xf32>
    "gpu.host_register"(%12) : (memref<*xf32>) -> ()
    "gpu.host_register"(%13) : (memref<*xf32>) -> ()
    "gpu.host_register"(%14) : (memref<*xf32>) -> ()
    "func.call"(%12) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "gpu.launch"(%5, %5, %5, %11, %5, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
      "linalg.matmul"(%1, %2, %3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg13: f32, %arg14: f32, %arg15: f32):
        %15 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %16 = "arith.addf"(%arg15, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%16) : (f32) -> ()
      }) : (memref<16x4xf32>, memref<4x8xf32>, memref<16x8xf32>) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      "transform.nvgpu.rewrite_matmul_as_mma_sync"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

