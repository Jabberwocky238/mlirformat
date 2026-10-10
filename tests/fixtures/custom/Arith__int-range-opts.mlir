module {
  func.func @test() -> i1 {
    %c-1 = arith.constant -1 : index
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index} : index
    %1 = arith.cmpi eq, %0, %c-1 : index
    return %1 : i1
  }
}

// -----
module {
  func.func @test() -> i1 {
    %c-1 = arith.constant -1 : index
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index} : index
    %1 = arith.cmpi ne, %0, %c-1 : index
    return %1 : i1
  }
}

// -----
module {
  func.func @test() -> i1 {
    %c0 = arith.constant 0 : index
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index} : index
    %1 = arith.cmpi sge, %0, %c0 : index
    return %1 : i1
  }
}

// -----
module {
  func.func @test() -> i1 {
    %c0 = arith.constant 0 : index
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index} : index
    %1 = arith.cmpi slt, %0, %c0 : index
    return %1 : i1
  }
}

// -----
module {
  func.func @test() -> i1 {
    %c-1 = arith.constant -1 : index
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index} : index
    %1 = arith.cmpi sgt, %0, %c-1 : index
    return %1 : i1
  }
}

// -----
module {
  func.func @test() -> i1 {
    %c-1 = arith.constant -1 : index
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index} : index
    %1 = arith.cmpi sle, %0, %c-1 : index
    return %1 : i1
  }
}

// -----
module {
  func.func @test() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 12 : i8, smin = 0 : i8, umax = 12 : i8, umin = 0 : i8} : i8
    %1 = arith.shli %0, %c1_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
}

// -----
module {
  func.func @test() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8} : i8
    %1 = arith.shli %0, %c1_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
}

// -----
module {
  func.func @trivial_rem() -> i8 {
    %c64_i8 = arith.constant 64 : i8
    %0 = test.with_bounds {smax = 63 : si8, smin = 0 : si8, umax = 63 : ui8, umin = 0 : ui8} : i8
    %1 = arith.remsi %0, %c64_i8 : i8
    return %1 : i8
  }
}

// -----
module {
  func.func @non_const_rhs() -> i8 {
    %c64_i8 = arith.constant 64 : i8
    %0 = test.with_bounds {smax = 2 : si8, smin = 0 : si8, umax = 2 : ui8, umin = 0 : ui8} : i8
    %1 = test.with_bounds {smax = 64 : si8, smin = 63 : si8, umax = 64 : ui8, umin = 63 : ui8} : i8
    %2 = arith.remui %0, %1 : i8
    return %2 : i8
  }
}

// -----
module {
  func.func @wraps() -> i8 {
    %c64_i8 = arith.constant 64 : i8
    %0 = test.with_bounds {smax = 65 : si8, smin = 63 : si8, umax = 65 : ui8, umin = 63 : ui8} : i8
    %1 = arith.remsi %0, %c64_i8 : i8
    return %1 : i8
  }
}

// -----
module {
  func.func @analysis_crash(%arg0: i32, %arg1: tensor<128xi1>) -> tensor<128xi64> {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<-1> : tensor<128xi32>
    %splat = tensor.splat %arg0 : tensor<128xi32>
    %0 = scf.for %arg2 = %c0_i32 to %arg0 step %arg0 iter_args(%arg3 = %splat) -> (tensor<128xi32>)  : i32 {
      scf.yield %arg3 : tensor<128xi32>
    }
    %1 = arith.select %arg1, %0, %cst : tensor<128xi1>, tensor<128xi32>
    %2 = arith.extsi %1 : tensor<128xi32> to tensor<128xi64>
    return %2 : tensor<128xi64>
  }
}

