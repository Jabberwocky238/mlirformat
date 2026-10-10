#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x512xf32>, tensor<512x2000xf32>, tensor<1024x2000xf32>) -> tensor<1024x2000xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg1: tensor<1024x512xf32>, %arg2: tensor<512x2000xf32>, %arg3: tensor<1024x2000xf32>):
    %5 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %6 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<1024x512xf32>, tensor<512x2000xf32>, tensor<1024x2000xf32>) -> tensor<1024x2000xf32>
    "func.return"(%5) : (tensor<1024x2000xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, true, false>, static_sizes = array<i64: 8, 16, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      %2:2 = "transform.loop.peel"(%1#2) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      %3 = "transform.structured.match"(%2#0) <{ops = ["linalg.matmul"]}> : (!transform.op<"scf.for">) -> !transform.any_op
      "transform.structured.vectorize"(%3) <{scalable_sizes = array<i1: false, true, false>, static_vector_sizes = array<i64: 8, 16, 1>}> : (!transform.any_op) -> ()
      %4 = "transform.structured.match"(%2#1) <{ops = ["linalg.matmul"]}> : (!transform.op<"scf.for">) -> !transform.any_op
      "transform.structured.vectorize"(%4) <{scalable_sizes = array<i1: false, true, false>, static_vector_sizes = array<i64: 8, 16, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

