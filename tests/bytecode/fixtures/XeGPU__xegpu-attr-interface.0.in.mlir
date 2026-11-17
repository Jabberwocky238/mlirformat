"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = () -> vector<128xindex>}> ({
      %1 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>} : () -> vector<128xindex> loc("<stdin>":4:12)
      "gpu.return"(%1) : (vector<128xindex>) -> () loc("<stdin>":5:7)
    }) {sym_name = "slice_attr"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = () -> vector<128xindex>}> ({
      %0 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [4, 8, 1], sg_data = [32, 32, 1]>, dims = [2]>, dims = [1]>} : () -> vector<128xindex> loc("<stdin>":8:12)
      "gpu.return"(%0) : (vector<128xindex>) -> () loc("<stdin>":9:7)
    }) {sym_name = "nested_slice_attr"} : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
