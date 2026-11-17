"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> f32, sym_name = "compute_linspace_val"}> ({
  ^bb0(%arg22: index loc("<stdin>":6:8), %arg23: index loc("<stdin>":6:23), %arg24: index loc("<stdin>":6:38)):
    %20 = "arith.index_cast"(%arg22) : (index) -> i32 loc("<stdin>":7:11)
    %21 = "arith.index_cast"(%arg23) : (index) -> i32 loc("<stdin>":8:11)
    %22 = "arith.index_cast"(%arg24) : (index) -> i32 loc("<stdin>":9:11)
    %23 = "arith.muli"(%20, %22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":10:11)
    %24 = "arith.addi"(%21, %23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:11)
    %25 = "arith.sitofp"(%24) : (i32) -> f32 loc("<stdin>":12:11)
    "func.return"(%25) : (f32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32> loc("<stdin>":16:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32> loc("<stdin>":17:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf32> loc("<stdin>":18:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:10)
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":20:10)
    %6 = "memref.dim"(%3, %4) : (memref<16x8xf32>, index) -> index loc("<stdin>":21:10)
    %7 = "memref.dim"(%3, %5) : (memref<16x8xf32>, index) -> index loc("<stdin>":22:10)
    %8 = "memref.dim"(%1, %5) : (memref<16x4xf32>, index) -> index loc("<stdin>":23:10)
    %9 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":24:10)
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":25:11)
    %11 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":26:11)
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg20: index loc("<stdin>":28:10)):
      "scf.for"(%4, %8, %5) ({
      ^bb0(%arg21: index loc("<stdin>":30:12)):
        %19 = "func.call"(%arg20, %arg21, %8) <{callee = @compute_linspace_val}> : (index, index, index) -> f32 loc("<stdin>":31:15)
        "memref.store"(%19, %1, %arg20, %arg21) : (f32, memref<16x4xf32>, index, index) -> () loc("<stdin>":32:9)
        "scf.yield"() : () -> () loc("<stdin>":33:9)
      }) : (index, index, index) -> () loc("<stdin>":29:7)
      "scf.yield"() : () -> () loc("<stdin>":35:7)
    }) : (index, index, index) -> () loc("<stdin>":27:5)
    "scf.for"(%4, %8, %5) ({
    ^bb0(%arg18: index loc("<stdin>":38:10)):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg19: index loc("<stdin>":40:12)):
        %18 = "func.call"(%arg18, %arg19, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f32 loc("<stdin>":41:15)
        "memref.store"(%18, %2, %arg18, %arg19) : (f32, memref<4x8xf32>, index, index) -> () loc("<stdin>":42:9)
        "scf.yield"() : () -> () loc("<stdin>":43:9)
      }) : (index, index, index) -> () loc("<stdin>":39:7)
      "scf.yield"() : () -> () loc("<stdin>":45:7)
    }) : (index, index, index) -> () loc("<stdin>":37:5)
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg16: index loc("<stdin>":48:10)):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg17: index loc("<stdin>":50:12)):
        %17 = "func.call"(%arg16, %arg17, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f32 loc("<stdin>":51:15)
        "memref.store"(%17, %3, %arg16, %arg17) : (f32, memref<16x8xf32>, index, index) -> () loc("<stdin>":52:9)
        "scf.yield"() : () -> () loc("<stdin>":53:9)
      }) : (index, index, index) -> () loc("<stdin>":49:7)
      "scf.yield"() : () -> () loc("<stdin>":55:7)
    }) : (index, index, index) -> () loc("<stdin>":47:5)
    %12 = "memref.cast"(%1) : (memref<16x4xf32>) -> memref<*xf32> loc("<stdin>":57:11)
    %13 = "memref.cast"(%2) : (memref<4x8xf32>) -> memref<*xf32> loc("<stdin>":58:11)
    %14 = "memref.cast"(%3) : (memref<16x8xf32>) -> memref<*xf32> loc("<stdin>":59:11)
    "gpu.host_register"(%12) : (memref<*xf32>) -> () loc("<stdin>":60:5)
    "gpu.host_register"(%13) : (memref<*xf32>) -> () loc("<stdin>":61:5)
    "gpu.host_register"(%14) : (memref<*xf32>) -> () loc("<stdin>":62:5)
    "func.call"(%12) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":63:5)
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":64:5)
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":65:5)
    "gpu.launch"(%5, %5, %5, %11, %5, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":67:10), %arg2: index loc("<stdin>":67:24), %arg3: index loc("<stdin>":67:38), %arg4: index loc("<stdin>":67:52), %arg5: index loc("<stdin>":67:66), %arg6: index loc("<stdin>":67:80), %arg7: index loc("<stdin>":67:94), %arg8: index loc("<stdin>":67:108), %arg9: index loc("<stdin>":67:122), %arg10: index loc("<stdin>":67:136), %arg11: index loc("<stdin>":67:151), %arg12: index loc("<stdin>":67:166)):
      "linalg.matmul"(%1, %2, %3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg13: f32 loc("<stdin>":69:12), %arg14: f32 loc("<stdin>":69:25), %arg15: f32 loc("<stdin>":69:38)):
        %15 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":70:15)
        %16 = "arith.addf"(%arg15, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":71:15)
        "linalg.yield"(%16) : (f32) -> () loc("<stdin>":72:9)
      }) : (memref<16x4xf32>, memref<4x8xf32>, memref<16x8xf32>) -> () loc("<stdin>":68:7)
      "gpu.terminator"() : () -> () loc("<stdin>":74:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":66:5)
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":76:5)
    "func.return"() : () -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":79:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":83:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":84:12)
      "transform.nvgpu.rewrite_matmul_as_mma_sync"(%0) : (!transform.any_op) -> () loc("<stdin>":85:7)
      "transform.yield"() : () -> () loc("<stdin>":86:7)
    }) : () -> () loc("<stdin>":82:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":81:3)
}) : () -> () loc("<stdin>":4:1)
