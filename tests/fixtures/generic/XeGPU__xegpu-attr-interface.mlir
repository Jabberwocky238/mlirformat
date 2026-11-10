"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = () -> vector<128xindex>}> ({
      %1 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>} : () -> vector<128xindex>
      "gpu.return"(%1) : (vector<128xindex>) -> ()
    }) {sym_name = "slice_attr"} : () -> ()
    "gpu.func"() <{function_type = () -> vector<128xindex>}> ({
      %0 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [4, 8, 1], sg_data = [32, 32, 1]>, dims = [2]>, dims = [1]>} : () -> vector<128xindex>
      "gpu.return"(%0) : (vector<128xindex>) -> ()
    }) {sym_name = "nested_slice_attr"} : () -> ()
  }) : () -> ()
}) : () -> ()

