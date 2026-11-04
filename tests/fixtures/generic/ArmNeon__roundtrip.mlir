"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>) -> (vector<8xi16>, vector<4xi32>, vector<2xi64>), sym_name = "arm_neon_smull"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>):
    %0 = "arm_neon.intr.smull"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> vector<8xi16>
    %1 = "vector.extract_strided_slice"(%0) <{offsets = [3], sizes = [4], strides = [1]}> : (vector<8xi16>) -> vector<4xi16>
    %2 = "arm_neon.intr.smull"(%1, %1) : (vector<4xi16>, vector<4xi16>) -> vector<4xi32>
    %3 = "vector.extract_strided_slice"(%2) <{offsets = [1], sizes = [2], strides = [1]}> : (vector<4xi32>) -> vector<2xi32>
    %4 = "arm_neon.intr.smull"(%3, %3) : (vector<2xi32>, vector<2xi32>) -> vector<2xi64>
    "func.return"(%0, %2, %4) : (vector<8xi16>, vector<4xi32>, vector<2xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi32>, vector<8xi8>, vector<8xi8>) -> vector<2xi32>, sym_name = "arm_neon_sdot"}> ({
  ^bb0(%arg0: vector<2xi32>, %arg1: vector<8xi8>, %arg2: vector<8xi8>):
    %0 = "arm_neon.intr.sdot"(%arg0, %arg1, %arg2) : (vector<2xi32>, vector<8xi8>, vector<8xi8>) -> vector<2xi32>
    "func.return"(%0) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xi8>, vector<16xi8>, vector<4xi32>) -> vector<4xi32>, sym_name = "arm_neon_smmla"}> ({
  ^bb0(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>):
    %0 = "arm_neon.intr.smmla"(%arg2, %arg0, %arg1) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xi8>, vector<16xi8>, vector<4xi32>) -> vector<4xi32>, sym_name = "arm_neon_ummla"}> ({
  ^bb0(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>):
    %0 = "arm_neon.intr.ummla"(%arg2, %arg0, %arg1) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xi8>, vector<16xi8>, vector<4xi32>) -> vector<4xi32>, sym_name = "arm_neon_usmmla"}> ({
  ^bb0(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>):
    %0 = "arm_neon.intr.usmmla"(%arg2, %arg0, %arg1) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xbf16>, vector<8xbf16>, vector<4xf32>) -> vector<4xf32>, sym_name = "arm_neon_bfmmla"}> ({
  ^bb0(%arg0: vector<8xbf16>, %arg1: vector<8xbf16>, %arg2: vector<4xf32>):
    %0 = "arm_neon.intr.bfmmla"(%arg2, %arg0, %arg1) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

