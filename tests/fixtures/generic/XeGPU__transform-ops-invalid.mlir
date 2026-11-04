"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_desc_layout"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.constant"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.xegpu.set_desc_layout"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_sg_data = array<i64: 32, 32>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_bad_result_index"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %3 = "arith.extf"(%2) : (vector<256x32xf16>) -> vector<256x32xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.extf"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_op_layout_attr"(%0) <{index = 1 : i64, operandSegmentSizes = array<i32: 1, 0, 0, 0>, result, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_bad_operand_index"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %3 = "arith.extf"(%2) : (vector<256x32xf16>) -> vector<256x32xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.extf"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_op_layout_attr"(%0) <{index = 1 : i64, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_multiple"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %3 = "arith.extf"(%2) : (vector<256x32xf16>) -> vector<256x32xf32>
    %4 = "arith.extf"(%3) : (vector<256x32xf32>) -> vector<256x32xf64>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.extf"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_op_layout_attr"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_gpu_launch_threads_bad_handle"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.constant"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_gpu_launch_threads"(%0) <{static_threads = array<i64: 8, 4, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_gpu_launch_threads_many_handles"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index
    %2 = "arith.constant"() <{value = 64 : index}> : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.constant"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_gpu_launch_threads"(%0) <{static_threads = array<i64: 8, 4, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_gpu_launch_threads_bad_threads"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    "gpu.launch"(%2, %2, %1, %1, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["gpu.launch"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_gpu_launch_threads"(%0) <{static_threads = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "insert_prefetch_dpas_c"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>, %arg3: memref<4096x4096xf16>):
    %3 = "arith.constant"() <{value = 32 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4096 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x256xf16>
    %7 = "xegpu.load_nd"(%6, %5, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x256xf16>, index, index) -> vector<256x256xf16>
    %8 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16>
    %10 = "scf.for"(%5, %4, %3, %7) ({
    ^bb0(%arg4: index, %arg5: vector<256x256xf16>):
      %11 = "xegpu.load_nd"(%8, %5, %arg4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x32xf16>, index, index) -> vector<256x32xf16>
      %12 = "xegpu.load_nd"(%9, %arg4, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x256xf16>, index, index) -> vector<32x256xf16>
      %13 = "xegpu.dpas"(%11, %12, %arg5) : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16>) -> vector<256x256xf16>
      "scf.yield"(%13) : (vector<256x256xf16>) -> ()
    }) : (index, index, index, vector<256x256xf16>) -> vector<256x256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.dpas"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 2>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.xegpu.insert_prefetch"(%1) <{static_nb_prefetch = 1 : i64}> : (!transform.any_value) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

