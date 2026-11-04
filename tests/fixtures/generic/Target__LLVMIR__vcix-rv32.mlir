"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_fv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: f32, %arg2: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 1 : i32}> : (vector<[4]xf32>, f32, i32) -> vector<[4]xf32>
    "llvm.return"(%0) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_xv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: i32, %arg2: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i32}> : (vector<[4]xf32>, i32, i32) -> vector<[4]xf32>
    "llvm.return"(%0) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, vector<[4]xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_vv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i32}> : (vector<[4]xf32>, vector<[4]xf32>, i32) -> vector<[4]xf32>
    "llvm.return"(%0) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_iv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: i32):
    %0 = "vcix.v.iv"(%arg0, %arg1) <{imm = 5 : i32, opcode = 3 : i32}> : (vector<[4]xf32>, i32) -> vector<[4]xf32>
    "llvm.return"(%0) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<4xf32>, f32)>, linkage = #llvm.linkage<external>, sym_name = "binary_fixed_fv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: f32):
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 1 : i32}> : (vector<4xf32>, f32) -> vector<4xf32>
    "llvm.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_fixed_xv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i32}> : (vector<4xf32>, i32) -> vector<4xf32>
    "llvm.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<4xf32>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "binary_fixed_vv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: vector<4xf32>):
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i32}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "binary_fixed_iv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "vcix.v.iv"(%arg0) <{imm = 5 : i32, opcode = 3 : i32}> : (vector<4xf32>) -> vector<4xf32>
    "llvm.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_fv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: f32, %arg2: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 1 : i32}> : (vector<[4]xi32>, f32, i32) -> vector<[4]xi32>
    "llvm.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_xv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: i32, %arg2: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i32}> : (vector<[4]xi32>, i32, i32) -> vector<[4]xi32>
    "llvm.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, vector<[4]xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_vv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i32}> : (vector<[4]xi32>, vector<[4]xi32>, i32) -> vector<[4]xi32>
    "llvm.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_iv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: i32):
    %0 = "vcix.v.iv"(%arg0, %arg1) <{imm = 5 : i32, opcode = 3 : i32}> : (vector<[4]xi32>, i32) -> vector<[4]xi32>
    "llvm.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>, f32)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_fixed_fv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: f32):
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 1 : i32}> : (vector<4xi32>, f32) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_fixed_xv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: i32):
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i32}> : (vector<4xi32>, i32) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_fixed_vv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i32}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "binary_i_fixed_iv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "vcix.v.iv"(%arg0) <{imm = 5 : i32, opcode = 3 : i32}> : (vector<4xi32>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

