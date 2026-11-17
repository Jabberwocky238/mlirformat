"builtin.module"() ({
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<64x8xf32, 3>}> : () -> () loc("<stdin>":2:3)
  "memref.global"() <{sym_name = "bufferRhsGlobal", sym_visibility = "private", type = memref<8x128xf32, 3>}> : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = 10000000 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 6144 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 45 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":8:10)
    %5 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":9:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:10)
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:10)
    %8 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":12:10)
    %9 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":13:10)
    %10 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32 loc("<stdin>":14:11)
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x8xf32> loc("<stdin>":15:11)
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x128xf32> loc("<stdin>":16:11)
    "scf.for"(%7, %8, %6) ({
    ^bb0(%arg19: index loc("<stdin>":18:10)):
      "scf.for"(%7, %9, %6) ({
      ^bb0(%arg20: index loc("<stdin>":20:12)):
        "memref.store"(%10, %12, %arg19, %arg20) : (f32, memref<8x128xf32>, index, index) -> () loc("<stdin>":21:9)
        "scf.yield"() : () -> () loc("<stdin>":22:9)
      }) : (index, index, index) -> () loc("<stdin>":19:7)
      "scf.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index) -> () loc("<stdin>":17:5)
    "scf.for"(%7, %5, %6) ({
    ^bb0(%arg17: index loc("<stdin>":27:10)):
      "scf.for"(%7, %8, %6) ({
      ^bb0(%arg18: index loc("<stdin>":29:12)):
        %24 = "arith.index_cast"(%arg18) : (index) -> i64 loc("<stdin>":30:15)
        %25 = "arith.uitofp"(%24) : (i64) -> f32 loc("<stdin>":31:15)
        "memref.store"(%25, %11, %arg17, %arg18) : (f32, memref<64x8xf32>, index, index) -> () loc("<stdin>":32:9)
        "scf.yield"() : () -> () loc("<stdin>":33:9)
      }) : (index, index, index) -> () loc("<stdin>":28:7)
      "scf.yield"() : () -> () loc("<stdin>":35:7)
    }) : (index, index, index) -> () loc("<stdin>":26:5)
    %13 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":37:11)
    %14:2 = "gpu.alloc"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x8xf32>, !gpu.async.token) loc("<stdin>":38:13)
    %15:2 = "gpu.alloc"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<8x128xf32>, !gpu.async.token) loc("<stdin>":39:13)
    %16 = "gpu.memcpy"(%13, %14#0, %11) : (!gpu.async.token, memref<64x8xf32>, memref<64x8xf32>) -> !gpu.async.token loc("<stdin>":40:11)
    %17 = "gpu.memcpy"(%13, %15#0, %12) : (!gpu.async.token, memref<8x128xf32>, memref<8x128xf32>) -> !gpu.async.token loc("<stdin>":41:11)
    "gpu.launch"(%6, %6, %6, %9, %6, %6) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":43:10), %arg2: index loc("<stdin>":43:24), %arg3: index loc("<stdin>":43:38), %arg4: index loc("<stdin>":43:52), %arg5: index loc("<stdin>":43:66), %arg6: index loc("<stdin>":43:80), %arg7: index loc("<stdin>":43:94), %arg8: index loc("<stdin>":43:108), %arg9: index loc("<stdin>":43:122), %arg10: index loc("<stdin>":43:136), %arg11: index loc("<stdin>":43:151), %arg12: index loc("<stdin>":43:166)):
      %18 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<64x8xf32, 3> loc("<stdin>":44:13)
      %19 = "memref.get_global"() <{name = @bufferRhsGlobal}> : () -> memref<8x128xf32, 3> loc("<stdin>":45:13)
      "linalg.copy"(%14#0, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg15: f32 loc("<stdin>":47:12), %arg16: f32 loc("<stdin>":47:25)):
        "linalg.yield"(%arg15) : (f32) -> () loc("<stdin>":48:9)
      }) : (memref<64x8xf32>, memref<64x8xf32, 3>) -> () loc("<stdin>":46:7)
      "linalg.copy"(%15#0, %19) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32 loc("<stdin>":51:12), %arg14: f32 loc("<stdin>":51:25)):
        "linalg.yield"(%arg13) : (f32) -> () loc("<stdin>":52:9)
      }) : (memref<8x128xf32>, memref<8x128xf32, 3>) -> () loc("<stdin>":50:7)
      %20 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":54:13)
      %21 = "arith.cmpi"(%20, %7) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":55:13)
      "scf.if"(%21) ({
        %22 = "memref.load"(%18, %3, %4) : (memref<64x8xf32, 3>, index, index) -> f32 loc("<stdin>":57:15)
        %23 = "memref.load"(%19, %4, %7) : (memref<8x128xf32, 3>, index, index) -> f32 loc("<stdin>":58:15)
        "gpu.printf"(%22) <{format = "[GPU] TMA LOADED lhs[45][7] %f\0A"}> : (f32) -> () loc("<stdin>":59:9)
        "gpu.printf"(%23) <{format = "[GPU] TMA LOADED rhs[7][0] %f\0A"}> : (f32) -> () loc("<stdin>":60:9)
        "scf.yield"() : () -> () loc("<stdin>":61:9)
      }, {
      }) : (i1) -> () loc("<stdin>":56:7)
      "gpu.terminator"() : () -> () loc("<stdin>":64:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":70:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":71:12)
      "transform.nvgpu.rewrite_copy_as_tma"(%0) : (!transform.any_op) -> () loc("<stdin>":72:7)
      "transform.yield"() : () -> () loc("<stdin>":73:7)
    }) : () -> () loc("<stdin>":69:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":68:3)
}) : () -> () loc("<stdin>":1:1)
