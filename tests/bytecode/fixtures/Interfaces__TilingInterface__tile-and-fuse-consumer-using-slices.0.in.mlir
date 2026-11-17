"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32xf32>, tensor<32xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "fuse_tileable_consumer_scf_for"}> ({
    ^bb0(%arg1: tensor<32xf32> loc("<stdin>":5:10), %arg2: tensor<32xf32> loc("<stdin>":5:33), %arg3: tensor<64xf32> loc("<stdin>":5:56)):
      %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:12)
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":7:12)
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:12)
      %6:2 = "scf.for"(%5, %4, %3, %arg3, %arg3) ({
      ^bb0(%arg7: index loc("<stdin>":10:12), %arg8: tensor<64xf32> loc("<stdin>":10:26), %arg9: tensor<64xf32> loc("<stdin>":10:49)):
        %11 = "tensor.extract_slice"(%arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<32xf32> loc("<stdin>":11:15)
        %12 = "linalg.generic"(%arg1, %arg2, %11) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg10: f32 loc("<stdin>":13:14), %arg11: f32 loc("<stdin>":13:27), %arg12: f32 loc("<stdin>":13:40)):
          %14 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:17)
          %15 = "arith.addf"(%arg12, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:17)
          "linalg.yield"(%15) : (f32) -> () loc("<stdin>":16:11)
        }) : (tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32> loc("<stdin>":12:15)
        %13 = "tensor.insert_slice"(%12, %arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (tensor<32xf32>, tensor<64xf32>, index) -> tensor<64xf32> loc("<stdin>":18:15)
        "scf.yield"(%arg9, %13) : (tensor<64xf32>, tensor<64xf32>) -> () loc("<stdin>":19:9)
      }) : (index, index, index, tensor<64xf32>, tensor<64xf32>) -> (tensor<64xf32>, tensor<64xf32>) loc("<stdin>":9:14)
      %7 = "tensor.empty"() : () -> tensor<64xf32> loc("<stdin>":21:12)
      %8 = "tensor.empty"() : () -> tensor<64xf32> loc("<stdin>":22:12)
      %9 = "linalg.add"(%6#1, %7, %8) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32 loc("<stdin>":24:12), %arg5: f32 loc("<stdin>":24:24), %arg6: f32 loc("<stdin>":24:36)):
        %10 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":25:15)
        "linalg.yield"(%10) : (f32) -> () loc("<stdin>":26:9)
      }) : (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32> loc("<stdin>":23:12)
      "func.return"(%9) : (tensor<64xf32>) -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":33:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":34:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":35:12)
      %2:2 = "transform.test.fuse_consumer_using_slice"(%1, %0) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":36:14)
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":32:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":2:1)
