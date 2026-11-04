"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x1xf32>, vector<1x1xf32>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "m16n8k4_tf32"}> ({
  ^bb0(%arg0: vector<2x1xf32>, %arg1: vector<1x1xf32>, %arg2: vector<2x2xf32>):
    %0 = "nvgpu.mma.sync"(%arg0, %arg1, %arg2) <{mmaShape = [16, 8, 4]}> : (vector<2x1xf32>, vector<1x1xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1xf32>, vector<2x1xf32>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "m16n8k8_tf32"}> ({
  ^bb0(%arg0: vector<4x1xf32>, %arg1: vector<2x1xf32>, %arg2: vector<2x2xf32>):
    %0 = "nvgpu.mma.sync"(%arg0, %arg1, %arg2) <{mmaShape = [16, 8, 8]}> : (vector<4x1xf32>, vector<2x1xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

