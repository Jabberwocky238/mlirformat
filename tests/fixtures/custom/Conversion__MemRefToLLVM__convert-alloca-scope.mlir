module {
  func.func @empty() {
    memref.alloca_scope  {
    }
    return
  }
  func.func @returns_nothing(%arg0: f32) {
    %cst = arith.constant 1.000000e+01 : f32
    memref.alloca_scope  {
      %0 = arith.addf %cst, %arg0 : f32
    }
    return
  }
  func.func @returns_one_value(%arg0: f32) -> f32 {
    %cst = arith.constant 1.000000e+01 : f32
    %0 = memref.alloca_scope  -> (f32) {
      %1 = arith.addf %cst, %arg0 : f32
      memref.alloca_scope.return %1 : f32
    }
    return %0 : f32
  }
  func.func @returns_multiple_values(%arg0: f32) -> f32 {
    %cst = arith.constant 1.000000e+01 : f32
    %0:2 = memref.alloca_scope  -> (f32, f32) {
      %2 = arith.addf %cst, %arg0 : f32
      %3 = arith.subf %cst, %arg0 : f32
      memref.alloca_scope.return %2, %3 : f32, f32
    }
    %1 = arith.addf %0#0, %0#1 : f32
    return %1 : f32
  }
}

