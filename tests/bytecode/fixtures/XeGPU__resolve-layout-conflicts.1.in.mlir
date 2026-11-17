"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_convert_layout_bridge"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "convert_layout_bridge_input_mismatch"}> ({
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<32x32xf16> loc("<stdin>":5:12)
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.layout<inst_data = [16, 16]>, target_layout = #xegpu.layout<inst_data = [32, 16]>}> : (vector<32x32xf16>) -> vector<32x32xf16> loc("<stdin>":6:12)
      "func.return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
