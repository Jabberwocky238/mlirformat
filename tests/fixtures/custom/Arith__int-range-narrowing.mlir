module {
  func.func @test_addi_neg() -> index {
    %0 = test.with_bounds {smax = 1 : index, smin = 0 : index, umax = 1 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 0 : index, smin = -1 : index, umax = -1 : index, umin = 0 : index} : index
    %2 = arith.addi %0, %1 : index
    return %2 : index
  }
  func.func @test_addi() -> index {
    %0 = test.with_bounds {smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index} : index
    %1 = test.with_bounds {smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index} : index
    %2 = arith.addi %0, %1 : index
    return %2 : index
  }
  func.func @test_addi_vec() -> vector<4xindex> {
    %0 = test.with_bounds {smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index} : vector<4xindex>
    %1 = test.with_bounds {smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index} : vector<4xindex>
    %2 = arith.addi %0, %1 : vector<4xindex>
    return %2 : vector<4xindex>
  }
  func.func @test_addi_i64() -> i64 {
    %0 = test.with_bounds {smax = 5 : i64, smin = 4 : i64, umax = 5 : i64, umin = 4 : i64} : i64
    %1 = test.with_bounds {smax = 7 : i64, smin = 6 : i64, umax = 7 : i64, umin = 6 : i64} : i64
    %2 = arith.addi %0, %1 : i64
    return %2 : i64
  }
  func.func @test_cmpi() -> i1 {
    %0 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : index
    %2 = arith.cmpi slt, %0, %1 : index
    return %2 : i1
  }
  func.func @test_cmpi_si_pred_out_of_signed_bounds() -> i1 {
    %0 = test.with_bounds {smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index} : index
    %2 = arith.cmpi slt, %1, %0 : index
    %3 = test.with_bounds {smax = 2147483648 : index, smin = 0 : index, umax = 2147483648 : index, umin = 0 : index} : index
    %4 = test.with_bounds {smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index} : index
    %5 = arith.cmpi sgt, %3, %4 : index
    %6 = arith.cmpi sle, %0, %4 : index
    %7 = arith.cmpi sge, %3, %4 : index
    %8 = arith.andi %2, %5 : i1
    %9 = arith.andi %6, %7 : i1
    %10 = arith.andi %8, %9 : i1
    return %10 : i1
  }
  func.func @test_cmpi_ui_pred_out_of_signed_bounds() -> i1 {
    %0 = test.with_bounds {smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index} : index
    %2 = arith.cmpi ult, %0, %1 : index
    return %2 : i1
  }
  func.func @test_cmpi_vec() -> vector<4xi1> {
    %0 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : vector<4xindex>
    %1 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : vector<4xindex>
    %2 = arith.cmpi slt, %0, %1 : vector<4xindex>
    return %2 : vector<4xi1>
  }
  func.func @test_add_cmpi() -> i1 {
    %0 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : index
    %2 = test.with_bounds {smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index} : index
    %3 = arith.addi %0, %1 : index
    %4 = arith.cmpi slt, %2, %3 : index
    return %4 : i1
  }
  func.func @test_add_cmpi_i64() -> i1 {
    %0 = test.with_bounds {smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64} : i64
    %1 = test.with_bounds {smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64} : i64
    %2 = test.with_bounds {smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64} : i64
    %3 = arith.addi %0, %1 : i64
    %4 = arith.cmpi slt, %2, %3 : i64
    return %4 : i1
  }
  func.func @addi_extui_i8(%arg0: i8, %arg1: i8) -> i32 {
    %0 = arith.extui %arg0 : i8 to i32
    %1 = arith.extui %arg1 : i8 to i32
    %2 = arith.addi %0, %1 : i32
    return %2 : i32
  }
  func.func @addi_mixed_ext_i8(%arg0: i8, %arg1: i8) -> i32 {
    %0 = arith.extsi %arg0 : i8 to i32
    %1 = arith.extui %arg1 : i8 to i32
    %2 = arith.addi %0, %1 : i32
    return %2 : i32
  }
  func.func @addi_extsi_i16(%arg0: i8, %arg1: i8) -> i16 {
    %0 = arith.extsi %arg0 : i8 to i16
    %1 = arith.extsi %arg1 : i8 to i16
    %2 = arith.addi %0, %1 : i16
    return %2 : i16
  }
  func.func @subi_extui_i8(%arg0: i8, %arg1: i8) -> i32 {
    %0 = arith.extui %arg0 : i8 to i32
    %1 = arith.extui %arg1 : i8 to i32
    %2 = arith.subi %0, %1 : i32
    return %2 : i32
  }
  func.func @subi_mixed_ext_i8(%arg0: i8, %arg1: i8) -> i32 {
    %0 = arith.extsi %arg0 : i8 to i32
    %1 = arith.extui %arg1 : i8 to i32
    %2 = arith.subi %0, %1 : i32
    return %2 : i32
  }
  func.func @signed_ops_out_of_narrowed_signed_range() -> (i64, i64, i64, i64, i64, i64, i64) {
    %0 = test.with_bounds {smax = 4292870144 : i64, smin = 0 : i64, umax = 4292870144 : i64, umin = 0 : i64} : i64
    %1 = test.with_bounds {smax = 8 : i64, smin = 1 : i64, umax = 8 : i64, umin = 1 : i64} : i64
    %2 = test.with_bounds {smax = 0 : i64, smin = 0 : i64, umax = 0 : i64, umin = 0 : i64} : i64
    %3 = arith.divsi %0, %1 : i64
    %4 = arith.ceildivsi %0, %1 : i64
    %5 = arith.floordivsi %0, %1 : i64
    %6 = arith.remsi %0, %1 : i64
    %7 = arith.maxsi %0, %2 : i64
    %8 = arith.minsi %0, %2 : i64
    %9 = arith.shrsi %0, %1 : i64
    return %3, %4, %5, %6, %7, %8, %9 : i64, i64, i64, i64, i64, i64, i64
  }
  func.func @unsigned_ops_out_of_narrowed_signed_range() -> (i64, i64, i64, i64, i64, i64) {
    %0 = test.with_bounds {smax = 4292870144 : i64, smin = 0 : i64, umax = 4292870144 : i64, umin = 0 : i64} : i64
    %1 = test.with_bounds {smax = 8 : i64, smin = 1 : i64, umax = 8 : i64, umin = 1 : i64} : i64
    %2 = test.with_bounds {smax = 0 : i64, smin = 0 : i64, umax = 0 : i64, umin = 0 : i64} : i64
    %3 = arith.divui %0, %1 : i64
    %4 = arith.ceildivui %0, %1 : i64
    %5 = arith.remui %0, %1 : i64
    %6 = arith.maxui %0, %2 : i64
    %7 = arith.minui %0, %2 : i64
    %8 = arith.shrui %0, %1 : i64
    return %3, %4, %5, %6, %7, %8 : i64, i64, i64, i64, i64, i64
  }
  func.func @muli_extui_i8(%arg0: i8, %arg1: i8) -> i32 {
    %0 = arith.extui %arg0 : i8 to i32
    %1 = arith.extui %arg1 : i8 to i32
    %2 = arith.muli %0, %1 : i32
    return %2 : i32
  }
  func.func @muli_extsi_i32(%arg0: i16, %arg1: i16) -> i32 {
    %0 = arith.extsi %arg0 : i16 to i32
    %1 = arith.extsi %arg1 : i16 to i32
    %2 = arith.muli %0, %1 : i32
    return %2 : i32
  }
  func.func @muli_mixed_ext_i8(%arg0: i8, %arg1: i8) -> i32 {
    %0 = arith.extsi %arg0 : i8 to i32
    %1 = arith.extui %arg1 : i8 to i32
    %2 = arith.muli %0, %1 : i32
    return %2 : i32
  }
  func.func @i32_overflows_to_index(%arg0: i32) -> index {
    %c0_i32 = arith.constant 0 : i32
    %c4 = arith.constant 4 : index
    %0 = arith.maxsi %arg0, %c0_i32 : i32
    %1 = arith.index_castui %0 : i32 to index
    %2 = arith.muli %1, %c4 : index
    return %2 : index
  }
  func.func @i32_overflows_to_i64(%arg0: i32) -> i64 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i64 = arith.constant 4 : i64
    %0 = arith.maxsi %arg0, %c0_i32 : i32
    %1 = arith.extui %0 : i32 to i64
    %2 = arith.muli %1, %c4_i64 : i64
    return %2 : i64
  }
  func.func @clamp_to_loop_bound_and_id() {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %0 = test.with_bounds {smax = 63 : index, smin = 0 : index, umax = 63 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 112 : index, smin = 16 : index, umax = 112 : index, umin = 16 : index} : index
    scf.for %arg0 = %c16 to %1 step %c64 {
      %2 = arith.subi %1, %arg0 : index
      %3 = arith.minsi %2, %c64 : index
      %4 = arith.subi %3, %0 : index
      %5 = arith.cmpi slt, %4, %c0 : index
      scf.if %5 {
        vector.print str "sideeffect"
      }
    }
    return
  }
  func.func private @use(index)
  func.func private @use_i64(i64)
  func.func @loop_with_iter_arg() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant dense<0.000000e+00> : vector<4xf32>
    %0 = test.with_bounds {smax = 1 : index, smin = 0 : index, umax = 1 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 0 : index, smin = -1 : index, umax = -1 : index, umin = 0 : index} : index
    %2 = scf.for %arg0 = %c0 to %c16 step %c1 iter_args(%arg1 = %cst) -> (vector<4xf32>) {
      %3 = arith.addi %0, %1 : index
      func.call @use(%3) : (index) -> ()
      scf.yield %arg1 : vector<4xf32>
    }
    return
  }
  func.func @narrow_loop_bounds() {
    %c0_i64 = arith.constant 0 : i64
    %c10_i64 = arith.constant 10 : i64
    %c1_i64 = arith.constant 1 : i64
    %0 = test.with_bounds {smax = 0 : i64, smin = 0 : i64, umax = 0 : i64, umin = 0 : i64} : i64
    %1 = test.with_bounds {smax = 10 : i64, smin = 10 : i64, umax = 10 : i64, umin = 10 : i64} : i64
    %2 = test.with_bounds {smax = 1 : i64, smin = 1 : i64, umax = 1 : i64, umin = 1 : i64} : i64
    scf.for %arg0 = %0 to %1 step %2  : i64 {
      %3 = arith.addi %arg0, %c1_i64 : i64
      func.call @use_i64(%3) : (i64) -> ()
    }
    return
  }
  func.func private @use_index(index)
  func.func @affine_for_dynamic_bound(%arg0: index) {
    affine.for %arg1 = 0 to %arg0 {
      func.call @use_index(%arg1) : (index) -> ()
    }
    return
  }
  func.func @zero_element_tensor_constant() -> tensor<2x0xi32> {
    %cst = arith.constant dense<> : tensor<2x0xi32>
    return %cst : tensor<2x0xi32>
  }
}

