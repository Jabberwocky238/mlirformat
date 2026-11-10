"builtin.module"() ({
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<64x32xf32, #gpu.address_space<workgroup>>}> : () -> ()
  "memref.global"() <{sym_name = "bufferRhsGlobal", sym_visibility = "private", type = memref<8x32xf32, #gpu.address_space<workgroup>>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 128 : index}> : () -> index
    %3 = "gpu.wait"() : () -> !gpu.async.token
    %4:2 = "gpu.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x32xf32>, !gpu.async.token)
    %5:2 = "gpu.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<8x32xf32>, !gpu.async.token)
    "gpu.launch"(%1, %1, %1, %2, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
      %6 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<64x32xf32, #gpu.address_space<workgroup>>
      %7 = "memref.get_global"() <{name = @bufferRhsGlobal}> : () -> memref<8x32xf32, #gpu.address_space<workgroup>>
      "linalg.copy"(%4#0, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg15: f32, %arg16: f32):
        "linalg.yield"(%arg15) : (f32) -> ()
      }) : (memref<64x32xf32>, memref<64x32xf32, #gpu.address_space<workgroup>>) -> ()
      "linalg.copy"(%5#0, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32, %arg14: f32):
        "linalg.yield"(%arg13) : (f32) -> ()
      }) : (memref<8x32xf32>, memref<8x32xf32, #gpu.address_space<workgroup>>) -> ()
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

