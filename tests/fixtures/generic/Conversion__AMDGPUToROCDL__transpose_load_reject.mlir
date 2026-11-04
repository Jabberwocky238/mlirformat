"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<128x16xi4, 3>) -> vector<16xi4>, sym_name = "transpose_load_to_rocdl_16xi4"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<128x16xi4, 3>):
    %0 = "amdgpu.transpose_load"(%arg2, %arg0, %arg1) : (memref<128x16xi4, 3>, index, index) -> vector<16xi4>
    "func.return"(%0) : (vector<16xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<128x32xi6, 3>) -> vector<16xi6>, sym_name = "transpose_load_to_rocdl_16xi6"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<128x32xi6, 3>):
    %0 = "amdgpu.transpose_load"(%arg2, %arg0, %arg1) : (memref<128x32xi6, 3>, index, index) -> vector<16xi6>
    "func.return"(%0) : (vector<16xi6>) -> ()
  }) : () -> ()
}) : () -> ()

