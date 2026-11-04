module {
  llvm.func @binary_fv(%arg0: vector<[4]xf32>, %arg1: f32, %arg2: i64) -> vector<[4]xf32> {
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 1 : i64}> : (vector<[4]xf32>, f32, i64) -> vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
}

// -----
module {
  llvm.func @binary_xv(%arg0: vector<[4]xf32>, %arg1: i64, %arg2: i64) -> vector<[4]xf32> {
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i64}> : (vector<[4]xf32>, i64, i64) -> vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
}

// -----
module {
  llvm.func @binary_vv(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: i64) -> vector<[4]xf32> {
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i64}> : (vector<[4]xf32>, vector<[4]xf32>, i64) -> vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
}

// -----
module {
  llvm.func @binary_iv(%arg0: vector<[4]xf32>, %arg1: i64) -> vector<[4]xf32> {
    %0 = "vcix.v.iv"(%arg0, %arg1) <{imm = 5 : i64, opcode = 3 : i64}> : (vector<[4]xf32>, i64) -> vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
}

// -----
module {
  llvm.func @binary_fixed_fv(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 1 : i64}> : (vector<4xf32>, f32) -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
}

// -----
module {
  llvm.func @binary_fixed_xv(%arg0: vector<4xf32>, %arg1: i64) -> vector<4xf32> {
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i64}> : (vector<4xf32>, i64) -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
}

// -----
module {
  llvm.func @binary_fixed_vv(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
}

// -----
module {
  llvm.func @binary_fixed_iv(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = "vcix.v.iv"(%arg0) <{imm = 5 : i64, opcode = 3 : i64}> : (vector<4xf32>) -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
}

// -----
module {
  llvm.func @binary_i_fv(%arg0: vector<[4]xi32>, %arg1: f32, %arg2: i64) -> vector<[4]xi32> {
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 1 : i64}> : (vector<[4]xi32>, f32, i64) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
}

// -----
module {
  llvm.func @binary_i_xv(%arg0: vector<[4]xi32>, %arg1: i64, %arg2: i64) -> vector<[4]xi32> {
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i64}> : (vector<[4]xi32>, i64, i64) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
}

// -----
module {
  llvm.func @binary_i_vv(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: i64) -> vector<[4]xi32> {
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 3 : i64}> : (vector<[4]xi32>, vector<[4]xi32>, i64) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
}

// -----
module {
  llvm.func @binary_i_iv(%arg0: vector<[4]xi32>, %arg1: i64) -> vector<[4]xi32> {
    %0 = "vcix.v.iv"(%arg0, %arg1) <{imm = 5 : i64, opcode = 3 : i64}> : (vector<[4]xi32>, i64) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
}

// -----
module {
  llvm.func @binary_i_fixed_fv(%arg0: vector<4xi32>, %arg1: f32) -> vector<4xi32> {
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 1 : i64}> : (vector<4xi32>, f32) -> vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @binary_i_fixed_xv(%arg0: vector<4xi32>, %arg1: i64) -> vector<4xi32> {
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i64}> : (vector<4xi32>, i64) -> vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @binary_i_fixed_vv(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = "vcix.v.sv"(%arg0, %arg1) <{opcode = 3 : i64}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @binary_i_fixed_iv(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = "vcix.v.iv"(%arg0) <{imm = 5 : i64, opcode = 3 : i64}> : (vector<4xi32>) -> vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

