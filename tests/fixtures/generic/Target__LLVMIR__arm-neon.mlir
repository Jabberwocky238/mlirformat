"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> (vector<8xi8>, vector<8xi8>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_smull", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>):
    %0 = "arm_neon.intr.smull"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> vector<8xi16>
    %1 = "llvm.shufflevector"(%0, %0) <{mask = array<i32: 3, 4, 5, 6>}> : (vector<8xi16>, vector<8xi16>) -> vector<4xi16>
    %2 = "arm_neon.intr.smull"(%1, %1) : (vector<4xi16>, vector<4xi16>) -> vector<4xi32>
    %3 = "llvm.shufflevector"(%2, %2) <{mask = array<i32: 1, 2>}> : (vector<4xi32>, vector<4xi32>) -> vector<2xi32>
    %4 = "arm_neon.intr.smull"(%3, %3) : (vector<2xi32>, vector<2xi32>) -> vector<2xi64>
    %5 = "llvm.mlir.undef"() : () -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>
    %6 = "llvm.insertvalue"(%5, %0) <{position = array<i64: 0>}> : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>, vector<8xi16>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>
    %7 = "llvm.insertvalue"(%6, %2) <{position = array<i64: 1>}> : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>, vector<4xi32>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>
    %8 = "llvm.insertvalue"(%7, %4) <{position = array<i64: 2>}> : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>, vector<2xi64>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>
    "llvm.return"(%8) : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi32> (vector<2xi32>, vector<8xi8>, vector<8xi8>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_sdot_8_i8i8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi32>, %arg1: vector<8xi8>, %arg2: vector<8xi8>):
    %0 = "arm_neon.intr.sdot"(%arg0, %arg1, %arg2) : (vector<2xi32>, vector<8xi8>, vector<8xi8>) -> vector<2xi32>
    "llvm.return"(%0) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>, vector<16xi8>, vector<16xi8>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_sdot_16_i8i8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<16xi8>, %arg2: vector<16xi8>):
    %0 = "arm_neon.intr.sdot"(%arg0, %arg1, %arg2) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<16xi8>, vector<16xi8>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_smmla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>):
    %0 = "arm_neon.intr.smmla"(%arg2, %arg0, %arg1) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<16xi8>, vector<16xi8>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_ummla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>):
    %0 = "arm_neon.intr.ummla"(%arg2, %arg0, %arg1) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<16xi8>, vector<16xi8>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_usmmla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>):
    %0 = "arm_neon.intr.usmmla"(%arg2, %arg0, %arg1) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<8xbf16>, vector<8xbf16>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_bfmmla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xbf16>, %arg1: vector<8xbf16>, %arg2: vector<4xf32>):
    %0 = "arm_neon.intr.bfmmla"(%arg2, %arg0, %arg1) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>
    "llvm.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

