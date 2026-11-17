"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> f32 loc("<stdin>":5:12)
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : (f32) -> f32 loc("<stdin>":6:12)
      "some_use"(%1) : (f32) -> () loc("<stdin>":7:7)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {sym_name = "convert_layout_scalar"} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
