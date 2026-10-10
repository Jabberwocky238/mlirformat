module {
  func.func @basic_expansion(%arg0: bf16) -> bf16 {
    %cst = arith.constant 1.000000e+00 : bf16
    %0 = arith.addf %arg0, %cst : bf16
    return %0 : bf16
  }
}

// -----
module {
  func.func @chained(%arg0: bf16, %arg1: bf16, %arg2: bf16) -> i1 {
    %0 = arith.addf %arg0, %arg1 : bf16
    %1 = arith.mulf %0, %arg2 : bf16
    %2 = arith.cmpf ole, %0, %1 : bf16
    return %2 : i1
  }
}

// -----
module {
  func.func @memops(%arg0: memref<4xf8E4M3FNUZ>, %arg1: memref<4xf8E4M3FNUZ>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c0] : memref<4xf8E4M3FNUZ>
    memref.store %0, %arg1[%c0] : memref<4xf8E4M3FNUZ>
    %1 = memref.load %arg0[%c1] : memref<4xf8E4M3FNUZ>
    %2 = arith.addf %0, %1 : f8E4M3FNUZ
    memref.store %2, %arg1[%c1] : memref<4xf8E4M3FNUZ>
    return
  }
}

// -----
module {
  func.func @vectors(%arg0: vector<4xf8E4M3FNUZ>) -> vector<4xf32> {
    %0 = arith.mulf %arg0, %arg0 : vector<4xf8E4M3FNUZ>
    %1 = arith.extf %0 : vector<4xf8E4M3FNUZ> to vector<4xf32>
    return %1 : vector<4xf32>
  }
}

// -----
module {
  func.func @no_expansion(%arg0: f32) -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = arith.addf %arg0, %cst : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @no_promote_select(%arg0: i1, %arg1: bf16, %arg2: bf16) -> bf16 {
    %0 = arith.select %arg0, %arg1, %arg2 : bf16
    return %0 : bf16
  }
}

