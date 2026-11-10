module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Shader], []>, #spirv.resource_limits<>>} {
  func.func @int32_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 : i32
    %1 = arith.subi %arg0, %arg1 : i32
    %2 = arith.muli %arg0, %arg1 : i32
    %3 = arith.divsi %arg0, %arg1 : i32
    %4 = arith.divui %arg0, %arg1 : i32
    %5 = arith.remui %arg0, %arg1 : i32
    return
  }
  func.func @int32_scalar_srem(%arg0: i32, %arg1: i32) {
    %0 = arith.remsi %arg0, %arg1 : i32
    return
  }
  func.func @index_scalar(%arg0: index, %arg1: index) {
    %0 = arith.addi %arg0, %arg1 : index
    %1 = arith.subi %arg0, %arg1 : index
    %2 = arith.muli %arg0, %arg1 : index
    %3 = arith.divsi %arg0, %arg1 : index
    %4 = arith.divui %arg0, %arg1 : index
    %5 = arith.remui %arg0, %arg1 : index
    return
  }
  func.func @index_scalar_srem(%arg0: index, %arg1: index) {
    %0 = arith.remsi %arg0, %arg1 : index
    return
  }
  func.func @int32_scalar_addui_extended(%arg0: i32, %arg1: i32) -> (i32, i1) {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : i32, i1
    return %sum, %overflow : i32, i1
  }
  func.func @int32_vector_addui_extended(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : vector<4xi32>, vector<4xi1>
    return %sum, %overflow : vector<4xi32>, vector<4xi1>
  }
  func.func @int32_scalar_subui_extended(%arg0: i32, %arg1: i32) -> (i32, i1) {
    %diff, %borrow = arith.subui_extended %arg0, %arg1 : i32, i1
    return %diff, %borrow : i32, i1
  }
  func.func @int32_vector_subui_extended(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
    %diff, %borrow = arith.subui_extended %arg0, %arg1 : vector<4xi32>, vector<4xi1>
    return %diff, %borrow : vector<4xi32>, vector<4xi1>
  }
  func.func @int32_scalar_mulsi_extended(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : i32
    return %low, %high : i32, i32
  }
  func.func @int32_vector_mulsi_extended(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<4xi32>
    return %low, %high : vector<4xi32>, vector<4xi32>
  }
  func.func @int32_scalar_mului_extended(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %low, %high = arith.mului_extended %arg0, %arg1 : i32
    return %low, %high : i32, i32
  }
  func.func @int32_vector_mului_extended(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) {
    %low, %high = arith.mului_extended %arg0, %arg1 : vector<4xi32>
    return %low, %high : vector<4xi32>, vector<4xi32>
  }
  func.func @float32_unary_scalar(%arg0: f32) {
    %0 = arith.negf %arg0 : f32
    return
  }
  func.func @float32_binary_scalar(%arg0: f32, %arg1: f32) {
    %0 = arith.addf %arg0, %arg1 : f32
    %1 = arith.subf %arg0, %arg1 : f32
    %2 = arith.mulf %arg0, %arg1 : f32
    %3 = arith.divf %arg0, %arg1 : f32
    %4 = arith.remf %arg0, %arg1 : f32
    return
  }
  func.func @int_vector234(%arg0: vector<2xi8>, %arg1: vector<4xi64>) {
    %0 = arith.divsi %arg0, %arg0 : vector<2xi8>
    %1 = arith.divui %arg1, %arg1 : vector<4xi64>
    return
  }
  func.func @index_vector(%arg0: vector<4xindex>) {
    %0 = arith.remui %arg0, %arg0 : vector<4xindex>
    return
  }
  func.func @vector_srem(%arg0: vector<3xi16>, %arg1: vector<3xi16>) {
    %0 = arith.remsi %arg0, %arg1 : vector<3xi16>
    return
  }
  func.func @float_vector234(%arg0: vector<2xf16>, %arg1: vector<3xf64>) {
    %0 = arith.addf %arg0, %arg0 : vector<2xf16>
    %1 = arith.mulf %arg1, %arg1 : vector<3xf64>
    return
  }
  func.func @one_elem_vector(%arg0: vector<1xi32>) {
    %0 = arith.addi %arg0, %arg0 : vector<1xi32>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @bitwise_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.andi %arg0, %arg1 : i32
    %1 = arith.ori %arg0, %arg1 : i32
    %2 = arith.xori %arg0, %arg1 : i32
    return
  }
  func.func @bitwise_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) {
    %0 = arith.andi %arg0, %arg1 : vector<4xi32>
    %1 = arith.ori %arg0, %arg1 : vector<4xi32>
    %2 = arith.xori %arg0, %arg1 : vector<4xi32>
    return
  }
  func.func @logical_scalar(%arg0: i1, %arg1: i1) {
    %0 = arith.andi %arg0, %arg1 : i1
    %1 = arith.ori %arg0, %arg1 : i1
    %2 = arith.xori %arg0, %arg1 : i1
    return
  }
  func.func @logical_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) {
    %0 = arith.andi %arg0, %arg1 : vector<4xi1>
    %1 = arith.ori %arg0, %arg1 : vector<4xi1>
    %2 = arith.xori %arg0, %arg1 : vector<4xi1>
    return
  }
  func.func @bool_arith_scalar(%arg0: i1, %arg1: i1) {
    %0 = arith.addi %arg0, %arg1 : i1
    %1 = arith.subi %arg0, %arg1 : i1
    %2 = arith.muli %arg0, %arg1 : i1
    return
  }
  func.func @bool_arith_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) {
    %0 = arith.addi %arg0, %arg1 : vector<4xi1>
    %1 = arith.subi %arg0, %arg1 : vector<4xi1>
    %2 = arith.muli %arg0, %arg1 : vector<4xi1>
    return
  }
  func.func @shift_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.shli %arg0, %arg1 : i32
    %1 = arith.shrsi %arg0, %arg1 : i32
    %2 = arith.shrui %arg0, %arg1 : i32
    return
  }
  func.func @shift_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) {
    %0 = arith.shli %arg0, %arg1 : vector<4xi32>
    %1 = arith.shrsi %arg0, %arg1 : vector<4xi32>
    %2 = arith.shrui %arg0, %arg1 : vector<4xi32>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @bool_shift_div_rem_scalar(%arg0: i1, %arg1: i1) {
    %0 = arith.shli %arg0, %arg1 : i1
    %1 = arith.shrui %arg0, %arg1 : i1
    %2 = arith.shrsi %arg0, %arg1 : i1
    %3 = arith.divui %arg0, %arg1 : i1
    %4 = arith.divsi %arg0, %arg1 : i1
    %5 = arith.remui %arg0, %arg1 : i1
    %6 = arith.remsi %arg0, %arg1 : i1
    return
  }
  func.func @bool_minmax_scalar(%arg0: i1, %arg1: i1) {
    %0 = arith.maxui %arg0, %arg1 : i1
    %1 = arith.maxsi %arg0, %arg1 : i1
    %2 = arith.minui %arg0, %arg1 : i1
    %3 = arith.minsi %arg0, %arg1 : i1
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @cmpf(%arg0: f32, %arg1: f32) {
    %0 = arith.cmpf oeq, %arg0, %arg1 : f32
    %1 = arith.cmpf ogt, %arg0, %arg1 : f32
    %2 = arith.cmpf oge, %arg0, %arg1 : f32
    %3 = arith.cmpf olt, %arg0, %arg1 : f32
    %4 = arith.cmpf ole, %arg0, %arg1 : f32
    %5 = arith.cmpf one, %arg0, %arg1 : f32
    %6 = arith.cmpf ueq, %arg0, %arg1 : f32
    %7 = arith.cmpf ugt, %arg0, %arg1 : f32
    %8 = arith.cmpf uge, %arg0, %arg1 : f32
    %9 = arith.cmpf ult, %arg0, %arg1 : f32
    %10 = arith.cmpf ule, %arg0, %arg1 : f32
    %11 = arith.cmpf une, %arg0, %arg1 : f32
    return
  }
  func.func @vec1cmpf(%arg0: vector<1xf32>, %arg1: vector<1xf32>) {
    %0 = arith.cmpf ogt, %arg0, %arg1 : vector<1xf32>
    %1 = arith.cmpf ult, %arg0, %arg1 : vector<1xf32>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>} {
  func.func @cmpf(%arg0: f32, %arg1: f32) {
    %0 = arith.cmpf ord, %arg0, %arg1 : f32
    %1 = arith.cmpf uno, %arg0, %arg1 : f32
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @cmpf(%arg0: f32, %arg1: f32) {
    %0 = arith.cmpf ord, %arg0, %arg1 : f32
    %1 = arith.cmpf uno, %arg0, %arg1 : f32
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @cmpi(%arg0: i32, %arg1: i32) {
    %0 = arith.cmpi eq, %arg0, %arg1 : i32
    %1 = arith.cmpi ne, %arg0, %arg1 : i32
    %2 = arith.cmpi slt, %arg0, %arg1 : i32
    %3 = arith.cmpi sle, %arg0, %arg1 : i32
    %4 = arith.cmpi sgt, %arg0, %arg1 : i32
    %5 = arith.cmpi sge, %arg0, %arg1 : i32
    %6 = arith.cmpi ult, %arg0, %arg1 : i32
    %7 = arith.cmpi ule, %arg0, %arg1 : i32
    %8 = arith.cmpi ugt, %arg0, %arg1 : i32
    %9 = arith.cmpi uge, %arg0, %arg1 : i32
    return
  }
  func.func @indexcmpi(%arg0: index, %arg1: index) {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %1 = arith.cmpi ne, %arg0, %arg1 : index
    %2 = arith.cmpi slt, %arg0, %arg1 : index
    %3 = arith.cmpi sle, %arg0, %arg1 : index
    %4 = arith.cmpi sgt, %arg0, %arg1 : index
    %5 = arith.cmpi sge, %arg0, %arg1 : index
    %6 = arith.cmpi ult, %arg0, %arg1 : index
    %7 = arith.cmpi ule, %arg0, %arg1 : index
    %8 = arith.cmpi ugt, %arg0, %arg1 : index
    %9 = arith.cmpi uge, %arg0, %arg1 : index
    return
  }
  func.func @vec1cmpi(%arg0: vector<1xi32>, %arg1: vector<1xi32>) {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<1xi32>
    %1 = arith.cmpi sgt, %arg0, %arg1 : vector<1xi32>
    return
  }
  func.func @boolcmpi_equality(%arg0: i1, %arg1: i1) {
    %0 = arith.cmpi eq, %arg0, %arg1 : i1
    %1 = arith.cmpi ne, %arg0, %arg1 : i1
    return
  }
  func.func @boolcmpi_unsigned(%arg0: i1, %arg1: i1) {
    %0 = arith.cmpi uge, %arg0, %arg1 : i1
    %1 = arith.cmpi ult, %arg0, %arg1 : i1
    return
  }
  func.func @vec1boolcmpi_equality(%arg0: vector<1xi1>, %arg1: vector<1xi1>) {
    %0 = arith.cmpi eq, %arg0, %arg1 : vector<1xi1>
    %1 = arith.cmpi ne, %arg0, %arg1 : vector<1xi1>
    return
  }
  func.func @vec1boolcmpi_unsigned(%arg0: vector<1xi1>, %arg1: vector<1xi1>) {
    %0 = arith.cmpi uge, %arg0, %arg1 : vector<1xi1>
    %1 = arith.cmpi ult, %arg0, %arg1 : vector<1xi1>
    return
  }
  func.func @vecboolcmpi_equality(%arg0: vector<4xi1>, %arg1: vector<4xi1>) {
    %0 = arith.cmpi eq, %arg0, %arg1 : vector<4xi1>
    %1 = arith.cmpi ne, %arg0, %arg1 : vector<4xi1>
    return
  }
  func.func @vecboolcmpi_unsigned(%arg0: vector<3xi1>, %arg1: vector<3xi1>) {
    %0 = arith.cmpi uge, %arg0, %arg1 : vector<3xi1>
    %1 = arith.cmpi ult, %arg0, %arg1 : vector<3xi1>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @constant() {
    %true = arith.constant true
    %c42_i32 = arith.constant 42 : i32
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant dense<[2, 3]> : vector<2xi32>
    %c1 = arith.constant 1 : index
    %cst_1 = arith.constant dense<1> : tensor<2x3xi32>
    %cst_2 = arith.constant dense<1.000000e+00> : tensor<2x3xf32>
    %cst_3 = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>
    %cst_4 = arith.constant dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>
    %cst_5 = arith.constant dense<[[1, 2], [3, 4], [5, 6]]> : tensor<3x2xi32>
    %cst_6 = arith.constant dense<[1, 2, 3, 4, 5, 6]> : tensor<6xi32>
    return
  }
  func.func @constant_8bit_float() {
    %cst = arith.constant 1.000000e+00 : f8E4M3
    %0 = arith.bitcast %cst : f8E4M3 to i8
    %cst_0 = arith.constant dense<1.000000e+00> : vector<4xf8E4M3>
    %1 = arith.bitcast %cst_0 : vector<4xf8E4M3> to vector<4xi8>
    %cst_1 = arith.constant dense<1.000000e+00> : tensor<4xf8E5M2>
    %2 = arith.bitcast %cst_1 : tensor<4xf8E5M2> to tensor<4xi8>
    return
  }
  func.func @constant_16bit() {
    %c4_i16 = arith.constant 4 : i16
    %cst = arith.constant 5.000000e+00 : f16
    %cst_0 = arith.constant dense<[2, 3]> : vector<2xi16>
    %cst_1 = arith.constant dense<4.000000e+00> : tensor<5xf16>
    return
  }
  func.func @constant_64bit() {
    %c4_i64 = arith.constant 4 : i64
    %cst = arith.constant 5.000000e+00 : f64
    %cst_0 = arith.constant dense<[2, 3]> : vector<2xi64>
    %cst_1 = arith.constant dense<4.000000e+00> : tensor<5xf64>
    return
  }
  func.func @constant_size1() {
    %cst = arith.constant dense<true> : tensor<1xi1>
    %cst_0 = arith.constant dense<4> : vector<1xi64>
    %cst_1 = arith.constant dense<5.000000e+00> : tensor<1xf64>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @constant_16bit() {
    %c4_i16 = arith.constant 4 : i16
    %cst = arith.constant 5.000000e+00 : f16
    %cst_0 = arith.constant dense<[2, 3]> : vector<2xi16>
    %cst_1 = arith.constant dense<4.000000e+00> : tensor<5xf16>
    %cst_2 = arith.constant dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : tensor<2x2xf16>
    return
  }
  func.func @constant_size1() {
    %cst = arith.constant dense<4> : vector<1xi16>
    %cst_0 = arith.constant dense<5.000000e+00> : tensor<1xf16>
    return
  }
  func.func @corner_cases() {
    %c-1_i16 = arith.constant -1 : i16
    %c-2_i16 = arith.constant -2 : i16
    %c-1 = arith.constant -1 : index
    %c-2 = arith.constant -2 : index
    %false = arith.constant false
    %true = arith.constant true
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @index_cast1(%arg0: i16) {
    %0 = arith.index_cast %arg0 : i16 to index
    return
  }
  func.func @index_cast2(%arg0: index) {
    %0 = arith.index_cast %arg0 : index to i16
    return
  }
  func.func @index_cast3(%arg0: i32) {
    %0 = arith.index_cast %arg0 : i32 to index
    return
  }
  func.func @index_cast4(%arg0: index) {
    %0 = arith.index_cast %arg0 : index to i32
    return
  }
  func.func @index_castui1(%arg0: i16) {
    %0 = arith.index_castui %arg0 : i16 to index
    return
  }
  func.func @index_castui2(%arg0: index) {
    %0 = arith.index_castui %arg0 : index to i16
    return
  }
  func.func @index_castui3(%arg0: i32) {
    %0 = arith.index_castui %arg0 : i32 to index
    return
  }
  func.func @index_castui4(%arg0: index) {
    %0 = arith.index_cast %arg0 : index to i32
    return
  }
  func.func @index_castindexi1_1(%arg0: index) {
    %0 = arith.index_cast %arg0 : index to i1
    return
  }
  func.func @index_castindexi1_2(%arg0: vector<1xindex>) -> vector<1xi1> {
    %0 = arith.index_cast %arg0 : vector<1xindex> to vector<1xi1>
    return %0 : vector<1xi1>
  }
  func.func @index_castindexi1_3(%arg0: vector<3xindex>) {
    %0 = arith.index_cast %arg0 : vector<3xindex> to vector<3xi1>
    return
  }
  func.func @index_casti1index_1(%arg0: i1) {
    %0 = arith.index_cast %arg0 : i1 to index
    return
  }
  func.func @index_casti1index_2(%arg0: vector<1xi1>) -> vector<1xindex> {
    %0 = arith.index_cast %arg0 : vector<1xi1> to vector<1xindex>
    return %0 : vector<1xindex>
  }
  func.func @index_casti1index_3(%arg0: vector<3xi1>) {
    %0 = arith.index_cast %arg0 : vector<3xi1> to vector<3xindex>
    return
  }
  func.func @bit_cast(%arg0: vector<2xf32>, %arg1: i64) {
    %0 = arith.bitcast %arg0 : vector<2xf32> to vector<2xi32>
    %1 = arith.bitcast %arg1 : i64 to f64
    return
  }
  func.func @fpext1(%arg0: f16) -> f64 {
    %0 = arith.extf %arg0 : f16 to f64
    return %0 : f64
  }
  func.func @fpext2(%arg0: f32) -> f64 {
    %0 = arith.extf %arg0 : f32 to f64
    return %0 : f64
  }
  func.func @fptrunc1(%arg0: f64) -> f16 {
    %0 = arith.truncf %arg0 : f64 to f16
    return %0 : f16
  }
  func.func @fptrunc2(%arg0: f32) -> f16 {
    %0 = arith.truncf %arg0 : f32 to f16
    return %0 : f16
  }
  func.func @experimental_constrained_fptrunc(%arg0: f64) {
    %0 = arith.truncf %arg0 to_nearest_even : f64 to f32
    %1 = arith.truncf %arg0 downward : f64 to f32
    %2 = arith.truncf %arg0 upward : f64 to f32
    %3 = arith.truncf %arg0 toward_zero : f64 to f32
    return
  }
  func.func @sitofp1(%arg0: i32) -> f32 {
    %0 = arith.sitofp %arg0 : i32 to f32
    return %0 : f32
  }
  func.func @sitofp2(%arg0: i64) -> f64 {
    %0 = arith.sitofp %arg0 : i64 to f64
    return %0 : f64
  }
  func.func @uitofp_i16_f32(%arg0: i16) -> f32 {
    %0 = arith.uitofp %arg0 : i16 to f32
    return %0 : f32
  }
  func.func @uitofp_i32_f32(%arg0: i32) -> f32 {
    %0 = arith.uitofp %arg0 : i32 to f32
    return %0 : f32
  }
  func.func @uitofp_i1_f32(%arg0: i1) -> f32 {
    %0 = arith.uitofp %arg0 : i1 to f32
    return %0 : f32
  }
  func.func @uitofp_i1_f64(%arg0: i1) -> f64 {
    %0 = arith.uitofp %arg0 : i1 to f64
    return %0 : f64
  }
  func.func @uitofp_vec_i1_f32(%arg0: vector<4xi1>) -> vector<4xf32> {
    %0 = arith.uitofp %arg0 : vector<4xi1> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  spirv.func @uitofp_vec_i1_f64(%arg0: vector<4xi1>) -> vector<4xf64> "None" {
    %cst_vec_4xf64 = spirv.Constant dense<0.000000e+00> : vector<4xf64>
    %cst_vec_4xf64_0 = spirv.Constant dense<1.000000e+00> : vector<4xf64>
    %0 = spirv.Select %arg0, %cst_vec_4xf64_0, %cst_vec_4xf64 : vector<4xi1>, vector<4xf64>
    spirv.ReturnValue %0 : vector<4xf64>
  }
  func.func @sexti1(%arg0: i16) -> i64 {
    %0 = arith.extsi %arg0 : i16 to i64
    return %0 : i64
  }
  func.func @sexti2(%arg0: i32) -> i64 {
    %0 = arith.extsi %arg0 : i32 to i64
    return %0 : i64
  }
  func.func @sext_bool_scalar(%arg0: i1) -> i32 {
    %0 = arith.extsi %arg0 : i1 to i32
    return %0 : i32
  }
  func.func @sext_bool_vector(%arg0: vector<3xi1>) -> vector<3xi32> {
    %0 = arith.extsi %arg0 : vector<3xi1> to vector<3xi32>
    return %0 : vector<3xi32>
  }
  func.func @zexti1(%arg0: i16) -> i64 {
    %0 = arith.extui %arg0 : i16 to i64
    return %0 : i64
  }
  func.func @zexti2(%arg0: i32) -> i64 {
    %0 = arith.extui %arg0 : i32 to i64
    return %0 : i64
  }
  func.func @zexti3(%arg0: i1) -> i32 {
    %0 = arith.extui %arg0 : i1 to i32
    return %0 : i32
  }
  func.func @zexti4(%arg0: vector<4xi1>) -> vector<4xi32> {
    %0 = arith.extui %arg0 : vector<4xi1> to vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @zexti5(%arg0: vector<4xi1>) -> vector<4xi64> {
    %0 = arith.extui %arg0 : vector<4xi1> to vector<4xi64>
    return %0 : vector<4xi64>
  }
  func.func @trunci1(%arg0: i64) -> i16 {
    %0 = arith.trunci %arg0 : i64 to i16
    return %0 : i16
  }
  func.func @trunci2(%arg0: i32) -> i16 {
    %0 = arith.trunci %arg0 : i32 to i16
    return %0 : i16
  }
  func.func @trunc_to_i1(%arg0: i32) -> i1 {
    %0 = arith.trunci %arg0 : i32 to i1
    return %0 : i1
  }
  func.func @trunc_to_veci1(%arg0: vector<4xi32>) -> vector<4xi1> {
    %0 = arith.trunci %arg0 : vector<4xi32> to vector<4xi1>
    return %0 : vector<4xi1>
  }
  func.func @fptoui1(%arg0: f32) -> i32 {
    %0 = arith.fptoui %arg0 : f32 to i32
    return %0 : i32
  }
  func.func @fptoui2(%arg0: f16) -> i16 {
    %0 = arith.fptoui %arg0 : f16 to i16
    return %0 : i16
  }
  func.func @fptosi1(%arg0: f32) -> i32 {
    %0 = arith.fptosi %arg0 : f32 to i32
    return %0 : i32
  }
  func.func @fptosi2(%arg0: f16) -> i16 {
    %0 = arith.fptosi %arg0 : f16 to i16
    return %0 : i16
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float64], []>, #spirv.resource_limits<>>} {
  func.func @fpext1(%arg0: f16) -> f64 {
    %0 = arith.extf %arg0 : f16 to f64
    return %0 : f64
  }
  func.func @fpext2(%arg0: f32) -> f64 {
    %0 = arith.extf %arg0 : f32 to f64
    return %0 : f64
  }
  func.func @trunci4_scalar(%arg0: i32) -> i4 {
    %0 = arith.trunci %arg0 : i32 to i4
    return %0 : i4
  }
  func.func @trunci4_vector(%arg0: vector<2xi32>) -> vector<2xi4> {
    %0 = arith.trunci %arg0 : vector<2xi32> to vector<2xi4>
    return %0 : vector<2xi4>
  }
  func.func @zexti4_scalar(%arg0: i4) -> i32 {
    %0 = arith.extui %arg0 : i4 to i32
    return %0 : i32
  }
  func.func @zexti4_vector(%arg0: vector<3xi4>) -> vector<3xi32> {
    %0 = arith.extui %arg0 : vector<3xi4> to vector<3xi32>
    return %0 : vector<3xi32>
  }
  func.func @sexti4_scalar(%arg0: i4) -> i32 {
    %0 = arith.extsi %arg0 : i4 to i32
    return %0 : i32
  }
  func.func @sexti4_vector(%arg0: vector<4xi4>) -> vector<4xi32> {
    %0 = arith.extsi %arg0 : vector<4xi4> to vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float16], []>, #spirv.resource_limits<>>} {
  func.func @fptrunc1(%arg0: f32) -> f16 {
    %0 = arith.truncf %arg0 : f32 to f16
    return %0 : f16
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int16, Kernel], []>, #spirv.resource_limits<>>} {
  func.func @int32_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 : i32
    %1 = arith.subi %arg0, %arg1 : i32
    %2 = arith.muli %arg0, %arg1 : i32
    %3 = arith.divsi %arg0, %arg1 : i32
    %4 = arith.divui %arg0, %arg1 : i32
    %5 = arith.remui %arg0, %arg1 : i32
    %6 = arith.maxsi %arg0, %arg1 : i32
    %7 = arith.maxui %arg0, %arg1 : i32
    %8 = arith.minsi %arg0, %arg1 : i32
    %9 = arith.minui %arg0, %arg1 : i32
    return
  }
  func.func @float32_binary_scalar(%arg0: f32, %arg1: f32) {
    %0 = arith.addf %arg0, %arg1 : f32
    %1 = arith.subf %arg0, %arg1 : f32
    %2 = arith.mulf %arg0, %arg1 : f32
    %3 = arith.divf %arg0, %arg1 : f32
    %4 = arith.remf %arg0, %arg1 : f32
    return
  }
  func.func @float32_minimumf_scalar(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minimumf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @float32_minnumf_scalar(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minnumf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @float32_maximumf_scalar(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = arith.maximumf %arg0, %arg1 : vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @float32_maxnumf_scalar(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = arith.maxnumf %arg0, %arg1 : vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scalar_srem(%arg0: i32, %arg1: i32) {
    %0 = arith.remsi %arg0, %arg1 : i32
    return
  }
  func.func @vector_srem(%arg0: vector<3xi16>, %arg1: vector<3xi16>) {
    %0 = arith.remsi %arg0, %arg1 : vector<3xi16>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int8, Int16, Int64, Float16, Float64], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @select(%arg0: i32, %arg1: i32) {
    %0 = arith.cmpi sle, %arg0, %arg1 : i32
    %1 = arith.select %0, %arg0, %arg1 : i32
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Shader], []>, #spirv.resource_limits<>>} {
  func.func @int32_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 : i32
    %1 = arith.subi %arg0, %arg1 : i32
    %2 = arith.muli %arg0, %arg1 : i32
    %3 = arith.divsi %arg0, %arg1 : i32
    %4 = arith.divui %arg0, %arg1 : i32
    %5 = arith.remui %arg0, %arg1 : i32
    %6 = arith.maxsi %arg0, %arg1 : i32
    %7 = arith.maxui %arg0, %arg1 : i32
    %8 = arith.minsi %arg0, %arg1 : i32
    %9 = arith.minui %arg0, %arg1 : i32
    return
  }
  func.func @scalar_srem(%arg0: i32, %arg1: i32) {
    %0 = arith.remsi %arg0, %arg1 : i32
    return
  }
  func.func @float32_unary_scalar(%arg0: f32) {
    %0 = arith.negf %arg0 : f32
    return
  }
  func.func @float32_binary_scalar(%arg0: f32, %arg1: f32) {
    %0 = arith.addf %arg0, %arg1 : f32
    %1 = arith.subf %arg0, %arg1 : f32
    %2 = arith.mulf %arg0, %arg1 : f32
    %3 = arith.divf %arg0, %arg1 : f32
    %4 = arith.remf %arg0, %arg1 : f32
    return
  }
  func.func @float32_minimumf_scalar(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minimumf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @float32_minnumf_scalar(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minnumf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @float32_maximumf_scalar(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = arith.maximumf %arg0, %arg1 : vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @float32_maxnumf_scalar(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = arith.maxnumf %arg0, %arg1 : vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @int_vector234(%arg0: vector<2xi8>, %arg1: vector<4xi64>) {
    %0 = arith.divsi %arg0, %arg0 : vector<2xi8>
    %1 = arith.divui %arg1, %arg1 : vector<4xi64>
    return
  }
  func.func @vector_srem(%arg0: vector<3xi16>, %arg1: vector<3xi16>) {
    %0 = arith.remsi %arg0, %arg1 : vector<3xi16>
    return
  }
  func.func @float_vector234(%arg0: vector<2xf16>, %arg1: vector<3xf64>) {
    %0 = arith.addf %arg0, %arg0 : vector<2xf16>
    %1 = arith.mulf %arg1, %arg1 : vector<3xf64>
    return
  }
  func.func @one_elem_vector(%arg0: vector<1xi32>) {
    %0 = arith.addi %arg0, %arg0 : vector<1xi32>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @int_vector23(%arg0: vector<2xi8>, %arg1: vector<3xi16>) {
    %0 = arith.divsi %arg0, %arg0 : vector<2xi8>
    %1 = arith.divsi %arg1, %arg1 : vector<3xi16>
    return
  }
  func.func @float_scalar(%arg0: f16) {
    %0 = arith.addf %arg0, %arg0 : f16
    return
  }
  func.func @uitofp_i8_emulated_f32(%arg0: i8) -> f32 {
    %0 = arith.uitofp %arg0 : i8 to f32
    return %0 : f32
  }
  func.func @uitofp_i16_emulated_f32(%arg0: i16) -> f32 {
    %0 = arith.uitofp %arg0 : i16 to f32
    return %0 : f32
  }
  func.func @uitofp_vec_i8_emulated_f32(%arg0: vector<4xi8>) -> vector<4xf32> {
    %0 = arith.uitofp %arg0 : vector<4xi8> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @sitofp_i8_emulated_f32(%arg0: i8) -> f32 {
    %0 = arith.sitofp %arg0 : i8 to f32
    return %0 : f32
  }
  func.func @sitofp_i16_emulated_f32(%arg0: i16) -> f32 {
    %0 = arith.sitofp %arg0 : i16 to f32
    return %0 : f32
  }
  func.func @sitofp_vec_i8_emulated_f32(%arg0: vector<4xi8>) -> vector<4xf32> {
    %0 = arith.sitofp %arg0 : vector<4xi8> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Kernel], [SPV_KHR_no_integer_wrap_decoration]>, #spirv.resource_limits<>>} {
  func.func @ops_flags(%arg0: i64, %arg1: i64) {
    %0 = arith.addi %arg0, %arg1 overflow<nsw> : i64
    %1 = arith.subi %arg0, %arg1 overflow<nuw> : i64
    %2 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
    %3 = arith.shli %arg0, %arg1 overflow<nsw, nuw> : i64
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @ops_flags(%arg0: i64, %arg1: i64) {
    %0 = arith.addi %arg0, %arg1 overflow<nsw> : i64
    %1 = arith.subi %arg0, %arg1 overflow<nuw> : i64
    %2 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
    %3 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
    return
  }
}

