module {
  func.func @arith_constants() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0> : tensor<i32>
    %cst_1 = arith.constant dense<[[1, 2], [-3, 9], [0, 0], [2, -1]]> : tensor<4x2xi64>
    return
  }
}

// -----
module {
  func.func @arith_ops(%arg0: f32, %arg1: f32) {
    %0 = arith.addf %arg0, %arg1 : f32
    %1 = arith.divf %arg0, %arg1 : f32
    %2 = arith.mulf %arg0, %arg1 : f32
    %3 = arith.subf %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @arith_integer_ops(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 : i32
    %1 = arith.subi %arg0, %arg1 : i32
    %2 = arith.muli %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @arith_integer_ops_signed_nsw(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 overflow<nsw> : i32
    %1 = arith.subi %arg0, %arg1 overflow<nsw> : i32
    %2 = arith.muli %arg0, %arg1 overflow<nsw> : i32
    return
  }
}

// -----
module {
  func.func @arith_index(%arg0: i32, %arg1: i32) {
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg1 : i32 to index
    %2 = arith.addi %0, %1 : index
    %3 = arith.subi %0, %1 : index
    %4 = arith.muli %0, %1 : index
    return
  }
}

// -----
module {
  func.func @arith_bitwise(%arg0: i32, %arg1: i32) {
    %0 = arith.andi %arg0, %arg1 : i32
    %1 = arith.ori %arg0, %arg1 : i32
    %2 = arith.xori %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @arith_bitwise_bool(%arg0: i1, %arg1: i1) {
    %0 = arith.andi %arg0, %arg1 : i1
    %1 = arith.ori %arg0, %arg1 : i1
    %2 = arith.xori %arg0, %arg1 : i1
    return
  }
}

// -----
module {
  func.func @arith_signed_integer_div_rem(%arg0: i32, %arg1: i32) {
    %0 = arith.divsi %arg0, %arg1 : i32
    %1 = arith.remsi %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @arith_shift_left(%arg0: i32, %arg1: i32) {
    %0 = arith.shli %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @arith_shift_right(%arg0: i32, %arg1: i32) {
    %0 = arith.shrui %arg0, %arg1 : i32
    %1 = arith.shrsi %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @arith_shift_left_index(%arg0: i32) {
    %c42 = arith.constant 42 : index
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.shli %c42, %0 : index
    return
  }
}

// -----
module {
  func.func @arith_shift_right_index(%arg0: i32) {
    %c42 = arith.constant 42 : index
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.shrui %c42, %0 : index
    %2 = arith.shrsi %c42, %0 : index
    return
  }
}

// -----
module {
  func.func @arith_select(%arg0: i1, %arg1: tensor<8xi32>, %arg2: tensor<8xi32>) {
    %0 = arith.select %arg0, %arg1, %arg2 : tensor<8xi32>
    return
  }
}

// -----
module {
  func.func @arith_cmpf_false(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf false, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_oeq(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf oeq, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ogt(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ogt, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_oge(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf oge, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_olt(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf olt, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ole(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ole, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_one(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf one, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ord(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ord, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ueq(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ueq, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ugt(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ugt, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_uge(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf uge, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ult(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ult, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_ule(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf ule, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_une(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf une, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_uno(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf uno, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpf_true(%arg0: f32, %arg1: f32) -> i1 {
    %0 = arith.cmpf true, %arg0, %arg1 : f32
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_cmpi_eq(%arg0: i32, %arg1: i32) -> i1 {
    %0 = arith.cmpi eq, %arg0, %arg1 : i32
    return %0 : i1
  }
  func.func @arith_cmpi_ult(%arg0: i32, %arg1: i32) -> i1 {
    %0 = arith.cmpi ult, %arg0, %arg1 : i32
    return %0 : i1
  }
  func.func @arith_cmpi_predicates(%arg0: i32, %arg1: i32) {
    %0 = arith.cmpi ult, %arg0, %arg1 : i32
    %1 = arith.cmpi slt, %arg0, %arg1 : i32
    %2 = arith.cmpi ule, %arg0, %arg1 : i32
    %3 = arith.cmpi sle, %arg0, %arg1 : i32
    %4 = arith.cmpi ugt, %arg0, %arg1 : i32
    %5 = arith.cmpi sgt, %arg0, %arg1 : i32
    %6 = arith.cmpi uge, %arg0, %arg1 : i32
    %7 = arith.cmpi sge, %arg0, %arg1 : i32
    %8 = arith.cmpi eq, %arg0, %arg1 : i32
    %9 = arith.cmpi ne, %arg0, %arg1 : i32
    return
  }
  func.func @arith_cmpi_index(%arg0: i32, %arg1: i32) -> i1 {
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg0 : i32 to index
    %2 = arith.cmpi ult, %0, %1 : index
    %3 = arith.cmpi slt, %0, %1 : index
    return %3 : i1
  }
}

// -----
module {
  func.func @arith_negf(%arg0: f32) -> f32 {
    %0 = arith.negf %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @arith_float_to_int_cast_ops(%arg0: f32, %arg1: f64) {
    %0 = arith.fptosi %arg0 : f32 to i32
    %1 = arith.fptosi %arg1 : f64 to i32
    %2 = arith.fptosi %arg0 : f32 to i16
    %3 = arith.fptosi %arg1 : f64 to i16
    %4 = arith.fptoui %arg0 : f32 to i32
    %5 = arith.fptoui %arg0 : f32 to i16
    return
  }
  func.func @arith_int_to_float_cast_ops(%arg0: i8, %arg1: i64) {
    %0 = arith.sitofp %arg0 : i8 to f32
    %1 = arith.sitofp %arg1 : i64 to f32
    %2 = arith.uitofp %arg0 : i8 to f32
    return
  }
}

// -----
module {
  func.func @arith_trunci(%arg0: i32) -> i8 {
    %0 = arith.trunci %arg0 : i32 to i8
    %1 = arith.trunci %arg0 : i32 to i1
    return %0 : i8
  }
}

// -----
module {
  func.func @arith_trunci_to_i1(%arg0: i32) -> i1 {
    %0 = arith.trunci %arg0 : i32 to i1
    return %0 : i1
  }
}

// -----
module {
  func.func @arith_extsi(%arg0: i32) {
    %0 = arith.extsi %arg0 : i32 to i64
    return
  }
}

// -----
module {
  func.func @arith_extui(%arg0: i32) {
    %0 = arith.extui %arg0 : i32 to i64
    return
  }
}

// -----
module {
  func.func @arith_extui_i1_to_i32(%arg0: i1) {
    %0 = arith.extui %arg0 : i1 to i32
    return
  }
}

// -----
module {
  func.func @arith_index_cast(%arg0: i32) -> i32 {
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %0 : index to i32
    %2 = arith.index_cast %0 : index to i1
    return %1 : i32
  }
}

// -----
module {
  func.func @arith_index_castui(%arg0: i32) -> i32 {
    %0 = arith.index_castui %arg0 : i32 to index
    %1 = arith.index_castui %0 : index to i32
    %2 = arith.index_castui %0 : index to i1
    return %1 : i32
  }
}

// -----
module {
  func.func @arith_divui_remui(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.divui %arg0, %arg1 : i32
    %1 = arith.remui %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @arith_extf(%arg0: f16) -> f64 {
    %0 = arith.extf %arg0 : f16 to f32
    %1 = arith.extf %0 : f32 to f64
    return %1 : f64
  }
}

// -----
module {
  func.func @arith_truncf(%arg0: f64) -> f16 {
    %0 = arith.truncf %arg0 : f64 to f32
    %1 = arith.truncf %0 : f32 to f16
    return %1 : f16
  }
}

