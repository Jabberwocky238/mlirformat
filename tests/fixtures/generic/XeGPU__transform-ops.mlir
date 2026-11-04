"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "get_desc_op_a"}> ({
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
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.xegpu.get_desc_op"(%1) : (!transform.any_value) -> !transform.any_op
      "transform.debug.emit_remark_at"(%2) <{message = "found desc op"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "get_desc_op_c"}> ({
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
      %2 = "transform.xegpu.get_desc_op"(%1) : (!transform.any_value) -> !transform.any_op
      "transform.debug.emit_remark_at"(%2) <{message = "found desc op"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_desc_layout"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.create_nd_tdesc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.xegpu.set_desc_layout"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 32>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_desc_layout_minimal"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.create_nd_tdesc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.xegpu.set_desc_layout"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_sg_data = array<i64: 32, 32>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_desc_layout_param"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.create_nd_tdesc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 8 : i64}> : () -> !transform.param<i64>
      %2 = "transform.xegpu.set_desc_layout"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 32>, static_sg_layout = array<i64: -9223372036854775808, 4>}> : (!transform.any_op, !transform.param<i64>) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096xf16>) -> (), sym_name = "set_desc_layout_slice"}> ({
  ^bb0(%arg1: memref<4096xf16>):
    %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096xf16>) -> !xegpu.tensor_desc<256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.create_nd_tdesc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.xegpu.set_desc_layout"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, slice_dims = array<i64: 0>, static_sg_data = array<i64: 32, 32>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_result_default_index"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>, %arg3: memref<4096x4096xf16>):
    %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16>
    %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x256xf16>) -> vector<32x256xf16>
    %5 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x256xf16>
    %6 = "xegpu.load_nd"(%5) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x256xf16>) -> vector<256x256xf16>
    %7 = "xegpu.dpas"(%2, %4, %6) : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16>) -> vector<256x256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.dpas"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_op_layout_attr"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, result, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_result_sg_param"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %4 = "arith.extf"(%3) : (vector<256x32xf16>) -> vector<256x32xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.extf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 8 : i64}> : () -> !transform.param<i64>
      "transform.xegpu.set_op_layout_attr"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, result, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: -9223372036854775808, 4>}> : (!transform.any_op, !transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_result_sg_param2"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %5 = "arith.extf"(%4) : (vector<256x32xf16>) -> vector<256x32xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.extf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 8 : i64}> : () -> !transform.param<i64>
      %2 = "transform.param.constant"() <{value = 4 : i64}> : () -> !transform.param<i64>
      "transform.xegpu.set_op_layout_attr"(%0, %1, %2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, result, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>, !transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_result0"}> ({
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
      "transform.xegpu.set_op_layout_attr"(%0) <{index = 0 : i64, operandSegmentSizes = array<i32: 1, 0, 0, 0>, result, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<256xf16>) -> (), sym_name = "set_op_layout_attr_result_slice"}> ({
  ^bb0(%arg1: vector<256xf16>):
    %1 = "arith.extf"(%arg1) : (vector<256xf16>) -> vector<256xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.extf"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_op_layout_attr"(%0) <{index = 0 : i64, operandSegmentSizes = array<i32: 1, 0, 0, 0>, result, slice_dims = array<i64: 0>, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_operand_minimal"}> ({
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
      "transform.xegpu.set_op_layout_attr"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "set_op_layout_attr_operand1"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>):
    %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16>
    %5 = "arith.addf"(%2, %4) <{fastmath = #arith.fastmath<none>}> : (vector<256x32xf16>, vector<256x32xf16>) -> vector<256x32xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addf"]}> : (!transform.any_op) -> !transform.any_op
      "transform.xegpu.set_op_layout_attr"(%0) <{index = 1 : i64, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 64>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_gpu_launch_threads"}> ({
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
      "transform.xegpu.set_gpu_launch_threads"(%0) <{static_threads = array<i64: 8, 4, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_gpu_launch_threads_param"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>):
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    "gpu.launch"(%3, %3, %2, %2, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["gpu.launch"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 4 : i64}> : () -> !transform.param<i64>
      "transform.xegpu.set_gpu_launch_threads"(%0, %1) <{static_threads = array<i64: 8, -9223372036854775808, 1>}> : (!transform.any_op, !transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "insert_prefetch_dpas_a"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>, %arg3: memref<4096x4096xf16>):
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4096 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x256xf16>
    %8 = "xegpu.load_nd"(%7, %6, %6) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x256xf16>, index, index) -> vector<256x256xf16>
    %9 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %10 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16>
    %11 = "scf.for"(%6, %5, %4, %8) ({
    ^bb0(%arg4: index, %arg5: vector<256x256xf16>):
      %12 = "xegpu.load_nd"(%9, %6, %arg4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x32xf16>, index, index) -> vector<256x32xf16>
      %13 = "xegpu.load_nd"(%10, %arg4, %6) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x256xf16>, index, index) -> vector<32x256xf16>
      %14 = "xegpu.dpas"(%12, %13, %arg5) : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16>) -> vector<256x256xf16>
      "scf.yield"(%14) : (vector<256x256xf16>) -> ()
    }) : (index, index, index, vector<256x256xf16>) -> vector<256x256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%0) <{ops = ["xegpu.dpas"]}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.get_operand"(%1) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %3 = "transform.xegpu.insert_prefetch"(%2) <{static_nb_prefetch = 1 : i64}> : (!transform.any_value) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "insert_prefetch_dpas_a_nb_param2"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>, %arg3: memref<4096x4096xf16>):
    %5 = "arith.constant"() <{value = 32 : index}> : () -> index
    %6 = "arith.constant"() <{value = 4096 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x256xf16>
    %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x256xf16>) -> vector<256x256xf16>
    %10 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16>
    %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16>
    %12 = "scf.for"(%7, %6, %5, %9) ({
    ^bb0(%arg4: index, %arg5: vector<256x256xf16>):
      %13 = "xegpu.load_nd"(%10, %arg4) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<256x32xf16>, index) -> vector<256x32xf16>
      %14 = "xegpu.load_nd"(%11, %arg4) <{const_offsets = array<i64: -9223372036854775808, 0>}> : (!xegpu.tensor_desc<32x256xf16>, index) -> vector<32x256xf16>
      %15 = "xegpu.dpas"(%13, %14, %arg5) : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16>) -> vector<256x256xf16>
      "scf.yield"(%15) : (vector<256x256xf16>) -> ()
    }) : (index, index, index, vector<256x256xf16>) -> vector<256x256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%0) <{ops = ["xegpu.dpas"]}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.get_operand"(%1) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %3 = "transform.param.constant"() <{value = 2 : i64}> : () -> !transform.param<i64>
      %4 = "transform.xegpu.insert_prefetch"(%2, %3) : (!transform.any_value, !transform.param<i64>) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "convert_layout_a"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>, %arg3: memref<4096x4096xf16>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16]>>
    %5 = "xegpu.load_nd"(%4, %3, %3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16]>>, index, index) -> vector<256x32xf16>
    %6 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16>
    %7 = "xegpu.load_nd"(%6, %3, %3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x256xf16>, index, index) -> vector<32x256xf16>
    %8 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x256xf16>
    %9 = "xegpu.load_nd"(%8, %3, %3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x256xf16>, index, index) -> vector<256x256xf16>
    %10 = "xegpu.dpas"(%5, %7, %9) : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16>) -> vector<256x256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.dpas"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.xegpu.convert_layout"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>, static_input_inst_data = array<i64: 32, 16>, static_input_sg_data = array<i64: 32, 32>, static_input_sg_layout = array<i64: 8, 4>, static_target_inst_data = array<i64: 8, 16>, static_target_sg_data = array<i64: 32, 32>, static_target_sg_layout = array<i64: 8, 4>}> : (!transform.any_value) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> (), sym_name = "convert_layout_a_sg_param"}> ({
  ^bb0(%arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>, %arg3: memref<4096x4096xf16>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16]>>
    %6 = "xegpu.load_nd"(%5, %4, %4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16]>>, index, index) -> vector<256x32xf16>
    %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16>
    %8 = "xegpu.load_nd"(%7, %4, %4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x256xf16>, index, index) -> vector<32x256xf16>
    %9 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x256xf16>
    %10 = "xegpu.load_nd"(%9, %4, %4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x256xf16>, index, index) -> vector<256x256xf16>
    %11 = "xegpu.dpas"(%6, %8, %10) : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16>) -> vector<256x256xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.dpas"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.param.constant"() <{value = 8 : i64}> : () -> !transform.param<i64>
      %3 = "transform.xegpu.convert_layout"(%1, %2, %2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 1, 0, 0>, static_input_inst_data = array<i64: 32, 16>, static_input_sg_data = array<i64: 32, 32>, static_input_sg_layout = array<i64: -9223372036854775808, 4>, static_target_inst_data = array<i64: 8, 16>, static_target_sg_data = array<i64: 32, 32>, static_target_sg_layout = array<i64: -9223372036854775808, 4>}> : (!transform.any_value, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

