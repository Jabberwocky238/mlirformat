"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "set_anchor_layout"}> ({
  ^bb0(%arg1: memref<4096x4096xf16> loc("<stdin>":3:8)):
    %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16> loc("<stdin>":4:10)
    %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xf16>) -> vector<256x32xf16> loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":10:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["xegpu.load_nd"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":11:12)
      "transform.xegpu.set_anchor_layout"(%0) <{index = 0 : i64, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_inst_data = array<i64: 8, 16>, static_sg_data = array<i64: 32, 32>, static_sg_layout = array<i64: 8, 4>}> : (!transform.any_op) -> () loc("<stdin>":12:7)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
