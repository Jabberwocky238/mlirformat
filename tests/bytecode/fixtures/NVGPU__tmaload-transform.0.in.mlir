"builtin.module"() ({
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<64x32xf32, #gpu.address_space<workgroup>>}> : () -> () loc("<stdin>":2:3)
  "memref.global"() <{sym_name = "bufferRhsGlobal", sym_visibility = "private", type = memref<8x32xf32, #gpu.address_space<workgroup>>}> : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":7:10)
    %4:2 = "gpu.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x32xf32>, !gpu.async.token) loc("<stdin>":8:12)
    %5:2 = "gpu.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<8x32xf32>, !gpu.async.token) loc("<stdin>":9:12)
    "gpu.launch"(%1, %1, %1, %2, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":11:10), %arg2: index loc("<stdin>":11:24), %arg3: index loc("<stdin>":11:38), %arg4: index loc("<stdin>":11:52), %arg5: index loc("<stdin>":11:66), %arg6: index loc("<stdin>":11:80), %arg7: index loc("<stdin>":11:94), %arg8: index loc("<stdin>":11:108), %arg9: index loc("<stdin>":11:122), %arg10: index loc("<stdin>":11:136), %arg11: index loc("<stdin>":11:151), %arg12: index loc("<stdin>":11:166)):
      %6 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<64x32xf32, #gpu.address_space<workgroup>> loc("<stdin>":12:12)
      %7 = "memref.get_global"() <{name = @bufferRhsGlobal}> : () -> memref<8x32xf32, #gpu.address_space<workgroup>> loc("<stdin>":13:12)
      "linalg.copy"(%4#0, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg15: f32 loc("<stdin>":15:12), %arg16: f32 loc("<stdin>":15:25)):
        "linalg.yield"(%arg15) : (f32) -> () loc("<stdin>":16:9)
      }) : (memref<64x32xf32>, memref<64x32xf32, #gpu.address_space<workgroup>>) -> () loc("<stdin>":14:7)
      "linalg.copy"(%5#0, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32 loc("<stdin>":19:12), %arg14: f32 loc("<stdin>":19:25)):
        "linalg.yield"(%arg13) : (f32) -> () loc("<stdin>":20:9)
      }) : (memref<8x32xf32>, memref<8x32xf32, #gpu.address_space<workgroup>>) -> () loc("<stdin>":18:7)
      "gpu.terminator"() : () -> () loc("<stdin>":22:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":28:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":29:12)
      "transform.nvgpu.rewrite_copy_as_tma"(%0) : (!transform.any_op) -> () loc("<stdin>":30:7)
      "transform.yield"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":27:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
