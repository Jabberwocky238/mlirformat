module {
  func.func @addi_same_i32(%arg0: i32) -> i32 {
    %0 = arith.addi %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @addi_same_index(%arg0: index) -> index {
    %0 = arith.addi %arg0, %arg0 : index
    return %0 : index
  }
  func.func @identity_f64(%arg0: f64) -> f64 {
    return %arg0 : f64
  }
  func.func @addi_same_vector_i32(%arg0: vector<2xi32>) -> vector<2xi32> {
    %0 = arith.addi %arg0, %arg0 : vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @identity_scalar(%arg0: i64) -> i64 {
    return %arg0 : i64
  }
  func.func @identity_vector(%arg0: vector<4xi64>) -> vector<4xi64> {
    return %arg0 : vector<4xi64>
  }
  func.func @identity_vector2d(%arg0: vector<3x4xi64>) -> vector<3x4xi64> {
    return %arg0 : vector<3x4xi64>
  }
  func.func @call(%arg0: vector<4xi64>) -> vector<4xi64> {
    %0 = call @identity_vector(%arg0) : (vector<4xi64>) -> vector<4xi64>
    return %0 : vector<4xi64>
  }
  func.func @constant_scalar() -> i64 {
    %c0_i64 = arith.constant 0 : i64
    %c4294967296_i64 = arith.constant 4294967296 : i64
    %c-7_i64 = arith.constant -7 : i64
    return %c0_i64 : i64
  }
  func.func @constant_vector() -> vector<3xi64> {
    %cst = arith.constant dense<4294967296> : vector<3xi64>
    %cst_0 = arith.constant dense<[0, 1, -2]> : vector<3xi64>
    return %cst : vector<3xi64>
  }
  func.func @addi_scalar_a_b(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.addi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @addi_vector_a_b(%arg0: vector<4xi64>, %arg1: vector<4xi64>) -> vector<4xi64> {
    %0 = arith.addi %arg0, %arg1 : vector<4xi64>
    return %0 : vector<4xi64>
  }
  func.func @subi_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.subi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @subi_vector(%arg0: vector<4xi64>, %arg1: vector<4xi64>) -> vector<4xi64> {
    %0 = arith.subi %arg0, %arg1 : vector<4xi64>
    return %0 : vector<4xi64>
  }
  func.func @cmpi_eq_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi eq, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_eq_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi1> {
    %0 = arith.cmpi eq, %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi1>
  }
  func.func @cmpi_ne_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi ne, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_ne_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi1> {
    %0 = arith.cmpi ne, %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi1>
  }
  func.func @cmpi_sge_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi sge, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_sge_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi1> {
    %0 = arith.cmpi sge, %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi1>
  }
  func.func @cmpi_sgt_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi sgt, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_sle_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi sle, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_slt_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi slt, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_uge_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi uge, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_ugt_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi ugt, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_ule_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi ule, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @cmpi_ult_scalar(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi ult, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @extsi_scalar(%arg0: i16) -> i64 {
    %0 = arith.extsi %arg0 : i16 to i64
    return %0 : i64
  }
  func.func @extsi_vector(%arg0: vector<3xi16>) -> vector<3xi64> {
    %0 = arith.extsi %arg0 : vector<3xi16> to vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @extui_scalar1(%arg0: i16) -> i64 {
    %0 = arith.extui %arg0 : i16 to i64
    return %0 : i64
  }
  func.func @extui_scalar2(%arg0: i32) -> i64 {
    %0 = arith.extui %arg0 : i32 to i64
    return %0 : i64
  }
  func.func @extui_vector(%arg0: vector<3xi16>) -> vector<3xi64> {
    %0 = arith.extui %arg0 : vector<3xi16> to vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @index_cast_int_to_index_scalar(%arg0: i64) -> index {
    %0 = arith.index_cast %arg0 : i64 to index
    return %0 : index
  }
  func.func @index_cast_int_to_index_vector(%arg0: vector<3xi64>) -> vector<3xindex> {
    %0 = arith.index_cast %arg0 : vector<3xi64> to vector<3xindex>
    return %0 : vector<3xindex>
  }
  func.func @index_castui_int_to_index_scalar(%arg0: i64) -> index {
    %0 = arith.index_castui %arg0 : i64 to index
    return %0 : index
  }
  func.func @index_castui_int_to_index_vector(%arg0: vector<3xi64>) -> vector<3xindex> {
    %0 = arith.index_castui %arg0 : vector<3xi64> to vector<3xindex>
    return %0 : vector<3xindex>
  }
  func.func @index_cast_index_to_int_scalar(%arg0: index) -> i64 {
    %0 = arith.index_cast %arg0 : index to i64
    return %0 : i64
  }
  func.func @index_cast_index_to_int_vector(%arg0: vector<3xindex>) -> vector<3xi64> {
    %0 = arith.index_cast %arg0 : vector<3xindex> to vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @index_castui_index_to_int_scalar(%arg0: index) -> i64 {
    %0 = arith.index_castui %arg0 : index to i64
    return %0 : i64
  }
  func.func @index_castui_index_to_int_vector(%arg0: vector<3xindex>) -> vector<3xi64> {
    %0 = arith.index_castui %arg0 : vector<3xindex> to vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @trunci_scalar1(%arg0: i64) -> i32 {
    %0 = arith.trunci %arg0 : i64 to i32
    return %0 : i32
  }
  func.func @trunci_scalar2(%arg0: i64) -> i16 {
    %0 = arith.trunci %arg0 : i64 to i16
    return %0 : i16
  }
  func.func @trunci_vector(%arg0: vector<3xi64>) -> vector<3xi16> {
    %0 = arith.trunci %arg0 : vector<3xi64> to vector<3xi16>
    return %0 : vector<3xi16>
  }
  func.func @maxui_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.maxui %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @maxui_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.maxui %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @maxsi_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.maxsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @maxsi_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.maxsi %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @minui_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.minui %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @minui_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.minui %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @minsi_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.minsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @minsi_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.minsi %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @select_scalar(%arg0: i64, %arg1: i64, %arg2: i1) -> i64 {
    %0 = arith.select %arg2, %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @select_vector_whole(%arg0: vector<3xi64>, %arg1: vector<3xi64>, %arg2: i1) -> vector<3xi64> {
    %0 = arith.select %arg2, %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @select_vector_elementwise(%arg0: vector<3xi64>, %arg1: vector<3xi64>, %arg2: vector<3xi1>) -> vector<3xi64> {
    %0 = arith.select %arg2, %arg0, %arg1 : vector<3xi1>, vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @muli_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.muli %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @muli_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.muli %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @shli_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shli %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @shli_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.shli %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @shrui_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shrui %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @shrui_scalar_cst_2(%arg0: i64) -> i64 {
    %c2_i64 = arith.constant 2 : i64
    %0 = arith.shrui %arg0, %c2_i64 : i64
    return %0 : i64
  }
  func.func @shrui_scalar_cst_36(%arg0: i64) -> i64 {
    %c36_i64 = arith.constant 36 : i64
    %0 = arith.shrui %arg0, %c36_i64 : i64
    return %0 : i64
  }
  func.func @shrui_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.shrui %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @shrsi_scalar(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shrsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @shrsi_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.shrsi %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @andi_scalar_a_b(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.andi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @andi_vector_a_b(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.andi %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @ori_scalar_a_b(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.ori %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @ori_vector_a_b(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.ori %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @xori_scalar_a_b(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.xori %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @xori_vector_a_b(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
    %0 = arith.xori %arg0, %arg1 : vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @uitofp_i64_f64(%arg0: i64) -> f64 {
    %0 = arith.uitofp %arg0 : i64 to f64
    return %0 : f64
  }
  func.func @uitofp_i64_f64_vector(%arg0: vector<3xi64>) -> vector<3xf64> {
    %0 = arith.uitofp %arg0 : vector<3xi64> to vector<3xf64>
    return %0 : vector<3xf64>
  }
  func.func @uitofp_i64_f16(%arg0: i64) -> f16 {
    %0 = arith.uitofp %arg0 : i64 to f16
    return %0 : f16
  }
  func.func @sitofp_i64_f64(%arg0: i64) -> f64 {
    %0 = arith.sitofp %arg0 : i64 to f64
    return %0 : f64
  }
  func.func @sitofp_i64_f64_vector(%arg0: vector<3xi64>) -> vector<3xf64> {
    %0 = arith.sitofp %arg0 : vector<3xi64> to vector<3xf64>
    return %0 : vector<3xf64>
  }
  func.func @fptoui_i64_f64(%arg0: f64) -> i64 {
    %0 = arith.fptoui %arg0 : f64 to i64
    return %0 : i64
  }
  func.func @fptoui_i64_f64_vector(%arg0: vector<3xf64>) -> vector<3xi64> {
    %0 = arith.fptoui %arg0 : vector<3xf64> to vector<3xi64>
    return %0 : vector<3xi64>
  }
  func.func @fptosi_i64_f64(%arg0: f64) -> i64 {
    %0 = arith.fptosi %arg0 : f64 to i64
    return %0 : i64
  }
  func.func @fptosi_i64_f64_vector(%arg0: vector<3xf64>) -> vector<3xi64> {
    %0 = arith.fptosi %arg0 : vector<3xf64> to vector<3xi64>
    return %0 : vector<3xi64>
  }
}

