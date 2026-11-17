"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "fuse_tileable_op"}> ({
  ^bb0(%arg1: index loc("<stdin>":7:8), %arg2: tensor<?xf32> loc("<stdin>":7:22), %arg3: tensor<?xf32> loc("<stdin>":7:44)):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:10)
    %5 = "linalg.fill"(%3, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":11:10), %arg9: f32 loc("<stdin>":11:22)):
      "linalg.yield"(%arg8) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":10:10)
    %6 = "tensor.dim"(%arg2, %4) : (tensor<?xf32>, index) -> index loc("<stdin>":14:10)
    %7 = "affine.apply"(%6, %arg1) <{map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>}> : (index, index) -> index loc("<stdin>":15:10)
    %8 = "scf.forall"(%7, %arg3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index loc("<stdin>":17:10), %arg5: tensor<?xf32> loc("<stdin>":17:24)):
      %9 = "affine.apply"(%arg4, %arg1) <{map = affine_map<(d0)[s0] -> (d0 * s0)>}> : (index, index) -> index loc("<stdin>":18:12)
      %10 = "affine.min"(%arg4, %6, %arg1) <{map = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>}> : (index, index, index) -> index loc("<stdin>":19:13)
      %11 = "tensor.extract_slice"(%arg5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32> loc("<stdin>":20:13)
      %12 = "tensor.extract_slice"(%5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32> loc("<stdin>":21:13)
      %13 = "linalg.elementwise"(%12, %11) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32 loc("<stdin>":23:12), %arg7: f32 loc("<stdin>":23:24)):
        %14 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":24:15)
        "linalg.yield"(%14) : (f32) -> () loc("<stdin>":25:9)
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":22:13)
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> () loc("<stdin>":28:9)
      }) : () -> () loc("<stdin>":27:7)
    }) : (index, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":16:10)
    "func.return"(%8) : (tensor<?xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "dummy1"}> ({
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = () -> (), sym_name = "dummy2"}> ({
    "func.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = () -> (), sym_name = "dummy3"}> ({
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":39:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":44:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.op<"linalg.fill"> loc("<stdin>":45:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall"> loc("<stdin>":46:12)
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.fill">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op) loc("<stdin>":47:14)
      "transform.yield"() : () -> () loc("<stdin>":48:7)
    }) : () -> () loc("<stdin>":43:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":42:3)
}) : () -> () loc("<stdin>":5:1)
