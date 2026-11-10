module {
  func.func @vector_ops(%arg0: vector<4xf32>, %arg1: vector<4xi1>, %arg2: vector<4xi64>, %arg3: vector<4xi64>) -> vector<4xf32> {
    %cst = arith.constant dense<4.200000e+01> : vector<4xf32>
    %0 = arith.addf %arg0, %cst : vector<4xf32>
    %1 = arith.divsi %arg2, %arg2 : vector<4xi64>
    %2 = arith.divui %arg2, %arg2 : vector<4xi64>
    %3 = arith.remsi %arg2, %arg2 : vector<4xi64>
    %4 = arith.remui %arg2, %arg2 : vector<4xi64>
    %5 = arith.divf %arg0, %cst : vector<4xf32>
    %6 = arith.remf %arg0, %cst : vector<4xf32>
    %7 = arith.andi %arg2, %arg3 : vector<4xi64>
    %8 = arith.ori %arg2, %arg3 : vector<4xi64>
    %9 = arith.xori %arg2, %arg3 : vector<4xi64>
    %10 = arith.shli %arg2, %arg2 : vector<4xi64>
    %11 = arith.shrsi %arg2, %arg2 : vector<4xi64>
    %12 = arith.shrui %arg2, %arg2 : vector<4xi64>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @ops(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32, %arg4: f64) -> (f32, i32) {
    %0 = arith.subf %arg0, %arg1 : f32
    %1 = arith.subi %arg2, %arg3 : i32
    %2 = arith.cmpi slt, %arg2, %1 : i32
    %3 = arith.cmpi sle, %arg2, %1 : i32
    %4 = arith.cmpi sgt, %arg2, %1 : i32
    %5 = arith.cmpi ult, %arg2, %1 : i32
    %6 = arith.cmpi ule, %arg2, %1 : i32
    %7 = arith.cmpi ugt, %arg2, %1 : i32
    %8 = arith.cmpi eq, %arg2, %1 : i32
    %9 = arith.divsi %arg2, %arg3 : i32
    %10 = arith.divui %arg2, %arg3 : i32
    %11 = arith.remsi %arg2, %arg3 : i32
    %12 = arith.remui %arg2, %arg3 : i32
    %13 = arith.divf %arg0, %arg1 : f32
    %14 = arith.remf %arg0, %arg1 : f32
    %15 = arith.andi %arg2, %arg3 : i32
    %16 = arith.ori %arg2, %arg3 : i32
    %17 = arith.xori %arg2, %arg3 : i32
    %cst = arith.constant 7.900000e-01 : f64
    %18 = arith.shli %arg2, %arg3 : i32
    %19 = arith.shrsi %arg2, %arg3 : i32
    %20 = arith.shrui %arg2, %arg3 : i32
    %cst_0 = arith.constant 2.000000e+00 : tf32
    return %0, %10 : f32, i32
  }
}

// -----
module {
  func.func @index_cast(%arg0: index, %arg1: i1) {
    %0 = arith.index_cast %arg0 : index to i1
    %1 = arith.index_cast %arg1 : i1 to index
    return
  }
}

// -----
module {
  func.func @vector_index_cast(%arg0: vector<2xindex>, %arg1: vector<2xi1>) {
    %0 = arith.index_cast %arg0 : vector<2xindex> to vector<2xi1>
    %1 = arith.index_cast %arg1 : vector<2xi1> to vector<2xindex>
    return
  }
}

// -----
module {
  func.func @index_castui(%arg0: index, %arg1: i1) {
    %0 = arith.index_castui %arg0 : index to i1
    %1 = arith.index_castui %arg1 : i1 to index
    return
  }
}

// -----
module {
  func.func @vector_index_castui(%arg0: vector<2xindex>, %arg1: vector<2xi1>) {
    %0 = arith.index_castui %arg0 : vector<2xindex> to vector<2xi1>
    %1 = arith.index_castui %arg1 : vector<2xi1> to vector<2xindex>
    return
  }
}

// -----
module {
  func.func @index_castui_nneg(%arg0: i1) {
    %0 = arith.index_castui %arg0 nneg : i1 to index
    return
  }
}

// -----
module {
  func.func @index_castui_nneg_not_set(%arg0: i1) {
    %0 = arith.index_castui %arg0 : i1 to index
    return
  }
}

// -----
module {
  func.func @memref_index_cast(%arg0: memref<3xi32>) -> memref<3xindex> {
    %0 = arith.index_cast %arg0 : memref<3xi32> to memref<3xindex>
    return %0 : memref<3xindex>
  }
}

// -----
module {
  func.func @memref_index_castui(%arg0: memref<3xi32>) -> memref<3xindex> {
    %0 = arith.index_castui %arg0 : memref<3xi32> to memref<3xindex>
    return %0 : memref<3xindex>
  }
}

// -----
module {
  func.func @sitofp(%arg0: i32, %arg1: i64) {
    %0 = arith.sitofp %arg0 : i32 to f32
    %1 = arith.sitofp %arg0 : i32 to f64
    %2 = arith.sitofp %arg1 : i64 to f32
    %3 = arith.sitofp %arg1 : i64 to f64
    return
  }
}

// -----
module {
  func.func @sitofp_vector(%arg0: vector<2xi16>, %arg1: vector<2xi32>, %arg2: vector<2xi64>) {
    %0 = arith.sitofp %arg0 : vector<2xi16> to vector<2xf32>
    %1 = arith.sitofp %arg0 : vector<2xi16> to vector<2xf64>
    %2 = arith.sitofp %arg1 : vector<2xi32> to vector<2xf32>
    %3 = arith.sitofp %arg1 : vector<2xi32> to vector<2xf64>
    %4 = arith.sitofp %arg2 : vector<2xi64> to vector<2xf32>
    %5 = arith.sitofp %arg2 : vector<2xi64> to vector<2xf64>
    return
  }
}

// -----
module {
  func.func @uitofp(%arg0: i32, %arg1: i64) {
    %0 = arith.uitofp %arg0 : i32 to f32
    %1 = arith.uitofp %arg0 : i32 to f64
    %2 = arith.uitofp %arg1 : i64 to f32
    %3 = arith.uitofp %arg1 : i64 to f64
    return
  }
}

// -----
module {
  func.func @fpext(%arg0: f16, %arg1: f32) {
    %0 = arith.extf %arg0 : f16 to f32
    %1 = arith.extf %arg0 : f16 to f64
    %2 = arith.extf %arg1 : f32 to f64
    return
  }
}

// -----
module {
  func.func @fpext_vector(%arg0: vector<2xf16>, %arg1: vector<2xf32>) {
    %0 = arith.extf %arg0 : vector<2xf16> to vector<2xf32>
    %1 = arith.extf %arg0 : vector<2xf16> to vector<2xf64>
    %2 = arith.extf %arg1 : vector<2xf32> to vector<2xf64>
    return
  }
}

// -----
module {
  func.func @fptosi(%arg0: f32, %arg1: f64) {
    %0 = arith.fptosi %arg0 : f32 to i32
    %1 = arith.fptosi %arg0 : f32 to i64
    %2 = arith.fptosi %arg1 : f64 to i32
    %3 = arith.fptosi %arg1 : f64 to i64
    return
  }
}

// -----
module {
  func.func @fptosi_vector(%arg0: vector<2xf16>, %arg1: vector<2xf32>, %arg2: vector<2xf64>) {
    %0 = arith.fptosi %arg0 : vector<2xf16> to vector<2xi32>
    %1 = arith.fptosi %arg0 : vector<2xf16> to vector<2xi64>
    %2 = arith.fptosi %arg1 : vector<2xf32> to vector<2xi32>
    %3 = arith.fptosi %arg1 : vector<2xf32> to vector<2xi64>
    %4 = arith.fptosi %arg2 : vector<2xf64> to vector<2xi32>
    %5 = arith.fptosi %arg2 : vector<2xf64> to vector<2xi64>
    return
  }
}

// -----
module {
  func.func @fptoui(%arg0: f32, %arg1: f64) {
    %0 = arith.fptoui %arg0 : f32 to i32
    %1 = arith.fptoui %arg0 : f32 to i64
    %2 = arith.fptoui %arg1 : f64 to i32
    %3 = arith.fptoui %arg1 : f64 to i64
    return
  }
}

// -----
module {
  func.func @fptoui_vector(%arg0: vector<2xf16>, %arg1: vector<2xf32>, %arg2: vector<2xf64>) {
    %0 = arith.fptoui %arg0 : vector<2xf16> to vector<2xi32>
    %1 = arith.fptoui %arg0 : vector<2xf16> to vector<2xi64>
    %2 = arith.fptoui %arg1 : vector<2xf32> to vector<2xi32>
    %3 = arith.fptoui %arg1 : vector<2xf32> to vector<2xi64>
    %4 = arith.fptoui %arg2 : vector<2xf64> to vector<2xi32>
    %5 = arith.fptoui %arg2 : vector<2xf64> to vector<2xi64>
    return
  }
}

// -----
module {
  func.func @uitofp_vector(%arg0: vector<2xi16>, %arg1: vector<2xi32>, %arg2: vector<2xi64>) {
    %0 = arith.uitofp %arg0 : vector<2xi16> to vector<2xf32>
    %1 = arith.uitofp %arg0 : vector<2xi16> to vector<2xf64>
    %2 = arith.uitofp %arg1 : vector<2xi32> to vector<2xf32>
    %3 = arith.uitofp %arg1 : vector<2xi32> to vector<2xf64>
    %4 = arith.uitofp %arg2 : vector<2xi64> to vector<2xf32>
    %5 = arith.uitofp %arg2 : vector<2xi64> to vector<2xf64>
    return
  }
}

// -----
module {
  func.func @fptrunc(%arg0: f32, %arg1: f64) {
    %0 = arith.truncf %arg0 : f32 to f16
    %1 = arith.truncf %arg1 : f64 to f16
    %2 = arith.truncf %arg1 : f64 to f32
    return
  }
}

// -----
module {
  func.func @fptrunc_vector(%arg0: vector<2xf32>, %arg1: vector<2xf64>) {
    %0 = arith.truncf %arg0 : vector<2xf32> to vector<2xf16>
    %1 = arith.truncf %arg1 : vector<2xf64> to vector<2xf16>
    %2 = arith.truncf %arg1 : vector<2xf64> to vector<2xf32>
    return
  }
}

// -----
module {
  func.func @experimental_constrained_fptrunc(%arg0: f64) {
    %0 = arith.truncf %arg0 to_nearest_even : f64 to f32
    %1 = arith.truncf %arg0 downward : f64 to f32
    %2 = arith.truncf %arg0 upward : f64 to f32
    %3 = arith.truncf %arg0 toward_zero : f64 to f32
    %4 = arith.truncf %arg0 to_nearest_away : f64 to f32
    return
  }
}

// -----
module {
  func.func @experimental_constrained_addf(%arg0: f64, %arg1: f64) {
    %0 = arith.addf %arg0, %arg1 to_nearest_even : f64
    %1 = arith.addf %arg0, %arg1 downward : f64
    %2 = arith.addf %arg0, %arg1 upward : f64
    %3 = arith.addf %arg0, %arg1 toward_zero : f64
    %4 = arith.addf %arg0, %arg1 to_nearest_away : f64
    return
  }
}

// -----
module {
  func.func @experimental_constrained_subf(%arg0: f64, %arg1: f64) {
    %0 = arith.subf %arg0, %arg1 to_nearest_even : f64
    %1 = arith.subf %arg0, %arg1 downward : f64
    return
  }
}

// -----
module {
  func.func @experimental_constrained_mulf(%arg0: f64, %arg1: f64) {
    %0 = arith.mulf %arg0, %arg1 upward : f64
    %1 = arith.mulf %arg0, %arg1 toward_zero : f64
    return
  }
}

// -----
module {
  func.func @experimental_constrained_divf(%arg0: f64, %arg1: f64) {
    %0 = arith.divf %arg0, %arg1 to_nearest_even : f64
    %1 = arith.divf %arg0, %arg1 to_nearest_away : f64
    return
  }
}

// -----
module {
  func.func @constrained_addf_with_fastmath(%arg0: f64, %arg1: f64) {
    %0 = arith.addf %arg0, %arg1 to_nearest_even fastmath<fast> : f64
    return
  }
}

// -----
module {
  func.func @convertf_f16_to_bf16(%arg0: f16) -> bf16 {
    %0 = arith.convertf %arg0 : f16 to bf16
    return %0 : bf16
  }
}

// -----
module {
  func.func @convertf_bf16_to_f16(%arg0: bf16) -> f16 {
    %0 = arith.convertf %arg0 : bf16 to f16
    return %0 : f16
  }
}

// -----
module {
  func.func @convertf_vector(%arg0: vector<2xf16>) -> vector<2xbf16> {
    %0 = arith.convertf %arg0 : vector<2xf16> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
}

// -----
module {
  func.func @integer_extension_and_truncation(%arg0: i3) {
    %0 = arith.extsi %arg0 : i3 to i6
    %1 = arith.extui %arg0 : i3 to i6
    %2 = arith.trunci %arg0 : i3 to i2
    return
  }
}

// -----
module {
  func.func @integer_cast_0d_vector(%arg0: vector<i3>) {
    %0 = arith.extsi %arg0 : vector<i3> to vector<i6>
    %1 = arith.extui %arg0 : vector<i3> to vector<i6>
    %2 = arith.trunci %arg0 : vector<i3> to vector<i2>
    return
  }
}

// -----
module {
  func.func @fcmp(%arg0: f32, %arg1: f32) {
    %0 = arith.cmpf oeq, %arg0, %arg1 : f32
    %1 = arith.cmpf ogt, %arg0, %arg1 : f32
    %2 = arith.cmpf oge, %arg0, %arg1 : f32
    %3 = arith.cmpf olt, %arg0, %arg1 : f32
    %4 = arith.cmpf ole, %arg0, %arg1 : f32
    %5 = arith.cmpf one, %arg0, %arg1 : f32
    %6 = arith.cmpf ord, %arg0, %arg1 : f32
    %7 = arith.cmpf ueq, %arg0, %arg1 : f32
    %8 = arith.cmpf ugt, %arg0, %arg1 : f32
    %9 = arith.cmpf uge, %arg0, %arg1 : f32
    %10 = arith.cmpf ult, %arg0, %arg1 : f32
    %11 = arith.cmpf ule, %arg0, %arg1 : f32
    %12 = arith.cmpf une, %arg0, %arg1 : f32
    %13 = arith.cmpf uno, %arg0, %arg1 : f32
    %14 = arith.cmpf oeq, %arg0, %arg1 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @index_vector(%arg0: vector<4xindex>) {
    %cst = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
    %0 = arith.addi %arg0, %cst : vector<4xindex>
    return
  }
}

// -----
module {
  func.func @bitcast_1d(%arg0: vector<2xf32>) {
    %0 = arith.bitcast %arg0 : vector<2xf32> to vector<2xi32>
    return
  }
}

// -----
module {
  func.func @addui_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i1) {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : i32, i1
    return %sum, %overflow : i32, i1
  }
  func.func @addui_extended_vector1d(%arg0: vector<3xi16>, %arg1: vector<3xi16>) -> (vector<3xi16>, vector<3xi1>) {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : vector<3xi16>, vector<3xi1>
    return %sum, %overflow : vector<3xi16>, vector<3xi1>
  }
}

// -----
module {
  func.func @subui_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i1) {
    %diff, %borrow = arith.subui_extended %arg0, %arg1 : i32, i1
    return %diff, %borrow : i32, i1
  }
  func.func @subui_extended_vector1d(%arg0: vector<3xi16>, %arg1: vector<3xi16>) -> (vector<3xi16>, vector<3xi1>) {
    %diff, %borrow = arith.subui_extended %arg0, %arg1 : vector<3xi16>, vector<3xi1>
    return %diff, %borrow : vector<3xi16>, vector<3xi1>
  }
}

// -----
module {
  func.func @mulsi_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : i32
    return %low, %high : i32, i32
  }
  func.func @mulsi_extended_vector1d(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> (vector<3xi64>, vector<3xi64>) {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<3xi64>
    return %low, %high : vector<3xi64>, vector<3xi64>
  }
}

// -----
module {
  func.func @mului_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %low, %high = arith.mului_extended %arg0, %arg1 : i32
    return %low, %high : i32, i32
  }
  func.func @mului_extended_vector1d(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> (vector<3xi64>, vector<3xi64>) {
    %low, %high = arith.mului_extended %arg0, %arg1 : vector<3xi64>
    return %low, %high : vector<3xi64>, vector<3xi64>
  }
}

// -----
module {
  func.func @cmpf_2dvector(%arg0: vector<4x3xf32>, %arg1: vector<4x3xf32>) {
    %0 = arith.cmpf olt, %arg0, %arg1 : vector<4x3xf32>
    return
  }
}

// -----
module {
  func.func @cmpi_0dvector(%arg0: vector<i32>, %arg1: vector<i32>) {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<i32>
    return
  }
}

// -----
module {
  func.func @cmpi_2dvector(%arg0: vector<4x3xi32>, %arg1: vector<4x3xi32>) {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<4x3xi32>
    return
  }
}

// -----
module {
  func.func @select(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    %0 = arith.select %arg0, %arg1, %arg2 : i32
    return %0 : i32
  }
  func.func @select_complex(%arg0: i1, %arg1: complex<f32>, %arg2: complex<f32>) -> complex<f32> {
    %0 = arith.select %arg0, %arg1, %arg2 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @ceildivsi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.ceildivsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @ceildivui(%arg0: i32) -> i32 {
    %0 = arith.ceildivui %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @floordivsi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.floordivsi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @minmaxi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.minsi %arg0, %arg1 : i32
    %1 = arith.maxsi %arg0, %arg1 : i32
    %2 = arith.minui %arg0, %arg1 : i32
    %3 = arith.maxui %arg0, %arg1 : i32
    return %0 : i32
  }
  func.func @minmaxf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minimumf %arg0, %arg1 : f32
    %1 = arith.maximumf %arg0, %arg1 : f32
    %2 = arith.minnumf %arg0, %arg1 : f32
    %3 = arith.maxnumf %arg0, %arg1 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
    %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
    %1 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
    %2 = arith.negf %arg0 fastmath<fast> : f32
    %3 = arith.addf %arg0, %arg1 : f32
    %4 = arith.addf %arg0, %arg1 fastmath<nnan,ninf> : f32
    return
  }
}

// -----
module {
  func.func @ops_supporting_fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
    %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
    %1 = arith.divf %arg0, %arg1 fastmath<fast> : f32
    %2 = arith.maximumf %arg0, %arg1 fastmath<fast> : f32
    %3 = arith.minimumf %arg0, %arg1 fastmath<fast> : f32
    %4 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
    %5 = arith.negf %arg0 fastmath<fast> : f32
    %6 = arith.remf %arg0, %arg1 fastmath<fast> : f32
    %7 = arith.subf %arg0, %arg1 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @ops_supporting_overflow(%arg0: i64, %arg1: i64) {
    %0 = arith.addi %arg0, %arg1 overflow<nsw> : i64
    %1 = arith.subi %arg0, %arg1 overflow<nuw> : i64
    %2 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
    %3 = arith.shli %arg0, %arg1 overflow<nsw, nuw> : i64
    %4 = arith.trunci %arg0 overflow<nsw, nuw> : i64 to i32
    return
  }
}

// -----
module {
  func.func @ops_supporting_exact(%arg0: i32, %arg1: i32) {
    %0 = arith.shrsi %arg0, %arg1 exact : i32
    %1 = arith.shrui %arg0, %arg1 exact : i32
    %2 = arith.divsi %arg0, %arg1 exact : i32
    %3 = arith.divui %arg0, %arg1 exact : i32
    return
  }
}

// -----
module {
  func.func @ops_supporting_nneg(%arg0: i32) {
    %0 = arith.extui %arg0 nneg : i32 to i64
    %1 = arith.uitofp %arg0 nneg : i32 to f32
    return
  }
}

// -----
module {
  func.func @ops_nneg_not_set(%arg0: i32) {
    %0 = arith.extui %arg0 : i32 to i64
    %1 = arith.uitofp %arg0 : i32 to f32
    return
  }
}

// -----
module {
  func.func @memref_bitcast(%arg0: memref<?xi16>) -> memref<?xbf16> {
    %0 = arith.bitcast %arg0 : memref<?xi16> to memref<?xbf16>
    return %0 : memref<?xbf16>
  }
}

// -----
module {
  func.func @unsupported_fp_type(%arg0: f4E2M1FN, %arg1: vector<4xf4E2M1FN>, %arg2: vector<8x4xf4E2M1FN>, %arg3: f4E2M1FN, %arg4: i1) {
    %0 = arith.addf %arg0, %arg0 : f4E2M1FN
    %1 = arith.addf %arg1, %arg1 : vector<4xf4E2M1FN>
    %2 = arith.addf %arg2, %arg2 : vector<8x4xf4E2M1FN>
    %3 = arith.cmpf oeq, %arg0, %arg3 : f4E2M1FN
    %4 = arith.select %arg4, %arg0, %arg3 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @supported_fp_type(%arg0: f32, %arg1: vector<4xf32>, %arg2: vector<4x8xf32>, %arg3: f32) {
    %0 = arith.addf %arg0, %arg0 : f32
    %1 = arith.addf %arg1, %arg1 : vector<4xf32>
    %2 = arith.addf %arg2, %arg2 : vector<4x8xf32>
    %3 = arith.cmpf oeq, %arg0, %arg3 : f32
    return
  }
}

