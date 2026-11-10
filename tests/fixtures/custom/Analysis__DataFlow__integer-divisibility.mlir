module {
  func.func @constant() -> index {
    %c8 = arith.constant 8 : index
    %0 = "test.int_divisibility"(%c8) : (index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @muli_constant(%arg0: index) -> index {
    %c4 = arith.constant 4 : index
    %0 = arith.muli %arg0, %c4 : index
    %1 = "test.int_divisibility"(%0) : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @addi_gcd_of_muli_operands(%arg0: index, %arg1: index) -> index {
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %0 = arith.muli %arg0, %c8 : index
    %1 = arith.muli %arg1, %c12 : index
    %2 = arith.addi %0, %1 : index
    %3 = "test.int_divisibility"(%2) : (index) -> index
    return %3 : index
  }
}

// -----
module {
  func.func @addi_same_divisibility(%arg0: index, %arg1: index) -> index {
    %c16 = arith.constant 16 : index
    %0 = arith.muli %arg0, %c16 : index
    %1 = arith.muli %arg1, %c16 : index
    %2 = arith.addi %0, %1 : index
    %3 = "test.int_divisibility"(%2) : (index) -> index
    return %3 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 16)>
module {
  func.func @affine_apply_mul(%arg0: index) -> index {
    %c2 = arith.constant 2 : index
    %0 = arith.muli %arg0, %c2 : index
    %1 = affine.apply #map(%0)
    %2 = "test.int_divisibility"(%1) : (index) -> index
    return %2 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 16)>
#map1 = affine_map<(d0) -> (d0 floordiv 4)>
module {
  func.func @affine_apply_mul_then_floordiv(%arg0: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%0)
    %2 = "test.int_divisibility"(%1) : (index) -> index
    return %2 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 16)>
#map1 = affine_map<(d0) -> (d0 mod 16)>
module {
  func.func @affine_apply_mod_zero(%arg0: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%0)
    %2 = "test.int_divisibility"(%1) : (index) -> index
    return %2 : index
  }
}

// -----
#map = affine_map<() -> (64)>
module {
  func.func @affine_apply_constant() -> index {
    %0 = affine.apply #map()
    %1 = "test.int_divisibility"(%0) : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @scf_for_constant_step() {
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c64 step %c8 {
      %0 = "test.int_divisibility"(%arg0) : (index) -> index
    }
    return
  }
}

// -----
module {
  func.func @scf_for_nontrivial_gcd() {
    %c12 = arith.constant 12 : index
    %c100 = arith.constant 100 : index
    %c18 = arith.constant 18 : index
    scf.for %arg0 = %c12 to %c100 step %c18 {
      %0 = "test.int_divisibility"(%arg0) : (index) -> index
    }
    return
  }
}

// -----
module {
  func.func @scf_for_coprime() {
    %c15 = arith.constant 15 : index
    %c100 = arith.constant 100 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c15 to %c100 step %c8 {
      %0 = "test.int_divisibility"(%arg0) : (index) -> index
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 8 + 16)>
module {
  func.func @affine_apply_mul_plus_const(%arg0: index) -> index {
    %c4 = arith.constant 4 : index
    %0 = arith.muli %arg0, %c4 : index
    %1 = affine.apply #map(%0)
    %2 = "test.int_divisibility"(%1) : (index) -> index
    return %2 : index
  }
}

