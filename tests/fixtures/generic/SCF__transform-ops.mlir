"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "loop_outline_op"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index):
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg5: index):
      "scf.for"(%arg1, %arg2, %arg3) ({
      ^bb0(%arg6: index):
        %4 = "arith.addi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index):
      %3 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      %2:2 = "transform.loop.outline"(%1) <{func_name = "foo"}> : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_peel_op"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 41 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    "scf.for"(%3, %4, %5) ({
    ^bb0(%arg1: index):
      %6 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      %2:2 = "transform.loop.peel"(%1) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      "transform.debug.emit_remark_at"(%2#0) <{message = "main loop"}> : (!transform.op<"scf.for">) -> ()
      "transform.debug.emit_remark_at"(%2#1) <{message = "remainder loop"}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_peel_first_iter_op"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 41 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    "scf.for"(%3, %4, %5) ({
    ^bb0(%arg1: index):
      %6 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      %2:2 = "transform.loop.peel"(%1) <{fail_if_already_divisible = false, peel_front = true}> : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "loop_pipeline_op"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg3: index):
      %7 = "memref.load"(%arg1, %arg3) : (memref<?xf32>, index) -> f32
      %8 = "arith.addf"(%7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%8, %arg2, %arg3) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.pipeline"(%1) <{iteration_interval = 1 : i64, read_latency = 10 : i64}> : (!transform.op<"scf.for">) -> !transform.any_op
      "transform.debug.emit_remark_at"(%2) <{message = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_op"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg1: index):
      %5 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      "transform.loop.unroll"(%1) <{factor = 4 : i64}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_and_jam_op"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 40 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg1: index):
      %5 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      "transform.loop.unroll_and_jam"(%1) <{factor = 4 : i64}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<96x128xi8, 3>, memref<128xi8, 3>) -> (), sym_name = "loop_unroll_and_jam_op", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<96x128xi8, 3>, %arg2: memref<128xi8, 3>):
    %2 = "arith.constant"() <{value = 96 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 128 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    "scf.for"(%5, %4, %3) ({
    ^bb0(%arg3: index):
      %6 = "memref.load"(%arg2, %arg3) : (memref<128xi8, 3>, index) -> i8
      %7 = "scf.for"(%5, %2, %3, %6) ({
      ^bb0(%arg4: index, %arg5: i8):
        %8 = "memref.load"(%arg1, %arg4, %arg3) : (memref<96x128xi8, 3>, index, index) -> i8
        %9 = "arith.addi"(%8, %6) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
        "scf.yield"(%9) : (i8) -> ()
      }) : (index, index, index, i8) -> i8
      "memref.store"(%7, %arg2, %arg3) : (i8, memref<128xi8, 3>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.store"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      "transform.loop.unroll_and_jam"(%1) <{factor = 4 : i64}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_and_jam_op"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg1: index):
      %5 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      "transform.loop.unroll_and_jam"(%1) <{factor = 4 : i64}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_and_jam_op"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg1: index):
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for">
      "transform.loop.unroll_and_jam"(%1) <{factor = 2 : i64}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (30)>
#map3 = affine_map<() -> (21)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<21x30xf32, 1>, f32, f32) -> (), sym_name = "loop_unroll_and_jam_op"}> ({
  ^bb0(%arg1: memref<21x30xf32, 1>, %arg2: f32, %arg3: f32):
    %3 = "affine.for"(%arg2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index, %arg5: f32):
      %4 = "affine.for"(%arg3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg6: index, %arg7: f32):
        %6 = "affine.load"(%arg1, %arg4, %arg6) <{map = #map}> : (memref<21x30xf32, 1>, index, index) -> f32
        %7 = "arith.addf"(%arg7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%7) : (f32) -> ()
      }) : (f32) -> f32
      %5 = "arith.mulf"(%arg5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%5) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "affine.for"}> : (!transform.any_op) -> !transform.op<"affine.for">
      %2 = "transform.get_parent_op"(%1) <{nth_parent = 1 : i64, op_name = "affine.for"}> : (!transform.op<"affine.for">) -> !transform.op<"affine.for">
      "transform.loop.unroll_and_jam"(%2) <{factor = 2 : i64}> : (!transform.op<"affine.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_unroll_op"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    "affine.for"(%2, %3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map}> ({
    ^bb0(%arg1: index):
      %5 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "affine.for"}> : (!transform.any_op) -> !transform.op<"affine.for">
      "transform.debug.emit_remark_at"(%1) <{message = "affine for loop"}> : (!transform.op<"affine.for">) -> ()
      "transform.loop.unroll"(%1) <{factor = 4 : i64}> {affine = true} : (!transform.op<"affine.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_mixed_loops"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg1: index):
      "affine.for"(%2, %3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map}> ({
      ^bb0(%arg2: index):
        %5 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "affine.for"}> : (!transform.any_op) -> !transform.op<"affine.for">
      "transform.debug.emit_remark_at"(%1) <{message = "affine for loop"}> : (!transform.op<"affine.for">) -> ()
      "transform.loop.unroll"(%1) <{factor = 4 : i64}> : (!transform.op<"affine.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "test_promote_if_one_iteration"}> ({
  ^bb0(%arg1: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "scf.for"(%1, %2, %2, %arg1) ({
    ^bb0(%arg2: index, %arg3: index):
      %4 = "test.foo"(%arg1) : (index) -> index
      "scf.yield"(%4) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.loop.promote_if_one_iteration"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "test_structural_conversion_patterns"}> ({
  ^bb0(%arg1: tensor<f32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index
    %4 = "scf.for"(%1, %3, %2, %arg1) ({
    ^bb0(%arg2: index, %arg3: tensor<f32>):
      %5 = "test.foo"(%arg3) : (tensor<f32>) -> tensor<f32>
      "scf.yield"(%5) : (tensor<f32>) -> ()
    }) : (index, index, index, tensor<f32>) -> tensor<f32>
    "func.return"(%4) : (tensor<f32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_conversion_patterns"(%0) <{partial_conversion}> ({
        "transform.apply_conversion_patterns.scf.structural_conversions"() : () -> ()
      }, {
        "transform.apply_conversion_patterns.transform.test_type_converter"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "coalesce_i32_loops"}> ({
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 64 : i32}> : () -> i32
    "scf.for"(%3, %4, %5) ({
    ^bb0(%arg1: i32):
      "scf.for"(%3, %6, %5) ({
      ^bb0(%arg2: i32):
        %7 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
      "scf.yield"() : () -> ()
    }) {coalesce} : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "loop_pipeline"}> ({
  ^bb0(%arg1: memref<4x16xf32>, %arg2: vector<16xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index
    %6 = "scf.for"(%2, %5, %3, %arg2) ({
    ^bb0(%arg3: index, %arg4: vector<16xf32>):
      %7 = "vector.transfer_read"(%arg1, %arg3, %2, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x16xf32>, index, index, f32) -> vector<16xf32>
      %8 = "arith.addf"(%7, %arg4) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      "scf.yield"(%8) : (vector<16xf32>) -> ()
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32>
    "func.return"(%6) : (vector<16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.op<"scf.for">
      %1 = "transform.loop.pipeline"(%0) <{iteration_interval = 1 : i64, read_latency = 5 : i64}> {scheduling_type = "full-loops"} : (!transform.op<"scf.for">) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "loop_pipeline_lb_gt_0"}> ({
  ^bb0(%arg1: memref<4x16xf32>, %arg2: vector<16xf32>):
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    %5 = "scf.for"(%2, %4, %2, %arg2) ({
    ^bb0(%arg3: index, %arg4: vector<16xf32>):
      %6 = "vector.transfer_read"(%arg1, %arg3, %2, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x16xf32>, index, index, f32) -> vector<16xf32>
      %7 = "arith.addf"(%6, %arg4) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      "scf.yield"(%7) : (vector<16xf32>) -> ()
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32>
    "func.return"(%5) : (vector<16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.op<"scf.for">
      %1 = "transform.loop.pipeline"(%0) <{iteration_interval = 1 : i64, read_latency = 5 : i64}> {scheduling_type = "full-loops"} : (!transform.op<"scf.for">) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

