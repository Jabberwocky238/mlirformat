"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4x4xi8>, vector<4x4xi8>) -> vector<4xi32>, sym_name = "arm_neon_sdot2d_4x4_i8i8"}> ({
  ^bb0(%arg3: vector<4xi32>, %arg4: vector<4x4xi8>, %arg5: vector<4x4xi8>):
    %1 = "arm_neon.2d.sdot"(%arg3, %arg4, %arg5) : (vector<4xi32>, vector<4x4xi8>, vector<4x4xi8>) -> vector<4xi32>
    "func.return"(%1) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>, vector<2x4xi8>, vector<2x4xi8>) -> vector<2xi32>, sym_name = "arm_neon_sdot2d_2x4_i8i8"}> ({
  ^bb0(%arg0: vector<2xi32>, %arg1: vector<2x4xi8>, %arg2: vector<2x4xi8>):
    %0 = "arm_neon.2d.sdot"(%arg0, %arg1, %arg2) : (vector<2xi32>, vector<2x4xi8>, vector<2x4xi8>) -> vector<2xi32>
    "func.return"(%0) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

