"builtin.module"() ({
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<64x8xf32, 3>}> : () -> ()
  "memref.global"() <{sym_name = "bufferRhsGlobal", sym_visibility = "private", type = memref<8x128xf32, 3>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = 10000000 : index}> : () -> index
    %2 = "arith.constant"() <{value = 6144 : index}> : () -> index
    %3 = "arith.constant"() <{value = 45 : index}> : () -> index
    %4 = "arith.constant"() <{value = 7 : index}> : () -> index
    %5 = "arith.constant"() <{value = 64 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 8 : index}> : () -> index
    %9 = "arith.constant"() <{value = 128 : index}> : () -> index
    %10 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x8xf32>
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x128xf32>
    "scf.for"(%7, %8, %6) ({
    ^bb0(%arg19: index):
      "scf.for"(%7, %9, %6) ({
      ^bb0(%arg20: index):
        "memref.store"(%10, %12, %arg19, %arg20) : (f32, memref<8x128xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%7, %5, %6) ({
    ^bb0(%arg17: index):
      "scf.for"(%7, %8, %6) ({
      ^bb0(%arg18: index):
        %24 = "arith.index_cast"(%arg18) : (index) -> i64
        %25 = "arith.uitofp"(%24) : (i64) -> f32
        "memref.store"(%25, %11, %arg17, %arg18) : (f32, memref<64x8xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "gpu.wait"() : () -> !gpu.async.token
    %14:2 = "gpu.alloc"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x8xf32>, !gpu.async.token)
    %15:2 = "gpu.alloc"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<8x128xf32>, !gpu.async.token)
    %16 = "gpu.memcpy"(%13, %14#0, %11) : (!gpu.async.token, memref<64x8xf32>, memref<64x8xf32>) -> !gpu.async.token
    %17 = "gpu.memcpy"(%13, %15#0, %12) : (!gpu.async.token, memref<8x128xf32>, memref<8x128xf32>) -> !gpu.async.token
    "gpu.launch"(%6, %6, %6, %9, %6, %6) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
      %18 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<64x8xf32, 3>
      %19 = "memref.get_global"() <{name = @bufferRhsGlobal}> : () -> memref<8x128xf32, 3>
      "linalg.copy"(%14#0, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg15: f32, %arg16: f32):
        "linalg.yield"(%arg15) : (f32) -> ()
      }) : (memref<64x8xf32>, memref<64x8xf32, 3>) -> ()
      "linalg.copy"(%15#0, %19) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32, %arg14: f32):
        "linalg.yield"(%arg13) : (f32) -> ()
      }) : (memref<8x128xf32>, memref<8x128xf32, 3>) -> ()
      %20 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %21 = "arith.cmpi"(%20, %7) <{predicate = 0 : i64}> : (index, index) -> i1
      "scf.if"(%21) ({
        %22 = "memref.load"(%18, %3, %4) : (memref<64x8xf32, 3>, index, index) -> f32
        %23 = "memref.load"(%19, %4, %7) : (memref<8x128xf32, 3>, index, index) -> f32
        "gpu.printf"(%22) <{format = "[GPU] TMA LOADED lhs[45][7] %f\0A"}> : (f32) -> ()
        "gpu.printf"(%23) <{format = "[GPU] TMA LOADED rhs[7][0] %f\0A"}> : (f32) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      "transform.nvgpu.rewrite_copy_as_tma"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

