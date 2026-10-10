module {
  func.func @test_addi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.addi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_addi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.addi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_addi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.addi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_addi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.addi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_addui_extended(%arg0: i64, %arg1: i64) -> i64 {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : i64, i1
    return %sum : i64
  }
  func.func @test_addui_extended_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : tensor<8x8xi64>, tensor<8x8xi1>
    return %sum : tensor<8x8xi64>
  }
  func.func @test_addui_extended_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : vector<8xi64>, vector<8xi1>
    return %sum : vector<8xi64>
  }
  func.func @test_addui_extended_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : vector<[8]xi64>, vector<[8]xi1>
    return %sum : vector<[8]xi64>
  }
  func.func @test_subi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.subi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_subi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.subi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_subi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.subi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_subi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.subi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_muli(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.muli %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_muli_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.muli %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_muli_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.muli %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_muli_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.muli %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_mulsi_extended(%arg0: i32, %arg1: i32) -> i32 {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : i32
    return %high : i32
  }
  func.func @test_mulsi_extended_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : tensor<8x8xi64>
    return %high : tensor<8x8xi64>
  }
  func.func @test_mulsi_extended_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<8xi64>
    return %low : vector<8xi64>
  }
  func.func @test_mulsi_extended_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<[8]xi64>
    return %high : vector<[8]xi64>
  }
  func.func @test_mului_extended(%arg0: i32, %arg1: i32) -> i32 {
    %low, %high = arith.mului_extended %arg0, %arg1 : i32
    return %high : i32
  }
  func.func @test_mului_extended_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %low, %high = arith.mului_extended %arg0, %arg1 : tensor<8x8xi64>
    return %high : tensor<8x8xi64>
  }
  func.func @test_mului_extended_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %low, %high = arith.mului_extended %arg0, %arg1 : vector<8xi64>
    return %low : vector<8xi64>
  }
  func.func @test_mului_extended_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %low, %high = arith.mului_extended %arg0, %arg1 : vector<[8]xi64>
    return %high : vector<[8]xi64>
  }
  func.func @test_divui(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.divui %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_divui_exact(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.divui %arg0, %arg1 exact : i64
    return %0 : i64
  }
  func.func @test_divui_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.divui %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_divui_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.divui %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_divui_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.divui %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_divsi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.divsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_divsi_exact(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.divsi %arg0, %arg1 exact : i64
    return %0 : i64
  }
  func.func @test_divsi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.divsi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_divsi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.divsi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_divsi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.divsi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_remui(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.remui %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_remui_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.remui %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_remui_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.remui %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_remui_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.remui %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_remsi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.remsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_remsi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.remsi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_remsi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.remsi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_remsi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.remsi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_andi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.andi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_andi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.andi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_andi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.andi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_andi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.andi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_ori(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.ori %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_ori_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.ori %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_ori_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.ori %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_ori_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.ori %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_xori(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.xori %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_xori_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.xori %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_xori_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.xori %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_xori_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.xori %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_ceildivsi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.ceildivsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_ceildivsi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.ceildivsi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_ceildivsi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.ceildivsi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_ceildivsi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.ceildivsi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_floordivsi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.floordivsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_floordivsi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.floordivsi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_floordivsi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.floordivsi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_floordivsi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.floordivsi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_shli(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shli %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_shli_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.shli %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_shli_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.shli %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_shli_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.shli %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_shrui(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shrui %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_shrui_exact(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shrui %arg0, %arg1 exact : i64
    return %0 : i64
  }
  func.func @test_shrui_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.shrui %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_shrui_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.shrui %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_shrui_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.shrui %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_shrsi(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shrsi %arg0, %arg1 : i64
    return %0 : i64
  }
  func.func @test_shrsi_exact(%arg0: i64, %arg1: i64) -> i64 {
    %0 = arith.shrsi %arg0, %arg1 exact : i64
    return %0 : i64
  }
  func.func @test_shrsi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi64> {
    %0 = arith.shrsi %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_shrsi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.shrsi %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_shrsi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi64> {
    %0 = arith.shrsi %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_negf(%arg0: f64) -> f64 {
    %0 = arith.negf %arg0 : f64
    return %0 : f64
  }
  func.func @test_negf_tensor(%arg0: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %0 = arith.negf %arg0 : tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_negf_vector(%arg0: vector<8xf64>) -> vector<8xf64> {
    %0 = arith.negf %arg0 : vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_negf_scalable_vector(%arg0: vector<[8]xf64>) -> vector<[8]xf64> {
    %0 = arith.negf %arg0 : vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_addf(%arg0: f64, %arg1: f64) -> f64 {
    %0 = arith.addf %arg0, %arg1 : f64
    return %0 : f64
  }
  func.func @test_addf_tensor(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %0 = arith.addf %arg0, %arg1 : tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_addf_vector(%arg0: vector<8xf64>, %arg1: vector<8xf64>) -> vector<8xf64> {
    %0 = arith.addf %arg0, %arg1 : vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_addf_scalable_vector(%arg0: vector<[8]xf64>, %arg1: vector<[8]xf64>) -> vector<[8]xf64> {
    %0 = arith.addf %arg0, %arg1 : vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_subf(%arg0: f64, %arg1: f64) -> f64 {
    %0 = arith.subf %arg0, %arg1 : f64
    return %0 : f64
  }
  func.func @test_subf_tensor(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %0 = arith.subf %arg0, %arg1 : tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_subf_vector(%arg0: vector<8xf64>, %arg1: vector<8xf64>) -> vector<8xf64> {
    %0 = arith.subf %arg0, %arg1 : vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_subf_scalable_vector(%arg0: vector<[8]xf64>, %arg1: vector<[8]xf64>) -> vector<[8]xf64> {
    %0 = arith.subf %arg0, %arg1 : vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_mulf(%arg0: f64, %arg1: f64) -> f64 {
    %0 = arith.mulf %arg0, %arg1 : f64
    return %0 : f64
  }
  func.func @test_mulf_tensor(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %0 = arith.mulf %arg0, %arg1 : tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_mulf_vector(%arg0: vector<8xf64>, %arg1: vector<8xf64>) -> vector<8xf64> {
    %0 = arith.mulf %arg0, %arg1 : vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_mulf_scalable_vector(%arg0: vector<[8]xf64>, %arg1: vector<[8]xf64>) -> vector<[8]xf64> {
    %0 = arith.mulf %arg0, %arg1 : vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_divf(%arg0: f64, %arg1: f64) -> f64 {
    %0 = arith.divf %arg0, %arg1 : f64
    return %0 : f64
  }
  func.func @test_divf_tensor(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %0 = arith.divf %arg0, %arg1 : tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_divf_vector(%arg0: vector<8xf64>, %arg1: vector<8xf64>) -> vector<8xf64> {
    %0 = arith.divf %arg0, %arg1 : vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_divf_scalable_vector(%arg0: vector<[8]xf64>, %arg1: vector<[8]xf64>) -> vector<[8]xf64> {
    %0 = arith.divf %arg0, %arg1 : vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_remf(%arg0: f64, %arg1: f64) -> f64 {
    %0 = arith.remf %arg0, %arg1 : f64
    return %0 : f64
  }
  func.func @test_remf_tensor(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %0 = arith.remf %arg0, %arg1 : tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_remf_vector(%arg0: vector<8xf64>, %arg1: vector<8xf64>) -> vector<8xf64> {
    %0 = arith.remf %arg0, %arg1 : vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_remf_scalable_vector(%arg0: vector<[8]xf64>, %arg1: vector<[8]xf64>) -> vector<[8]xf64> {
    %0 = arith.remf %arg0, %arg1 : vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_extui(%arg0: i32) -> i64 {
    %0 = arith.extui %arg0 : i32 to i64
    return %0 : i64
  }
  func.func @test_extui_tensor(%arg0: tensor<8x8xi32>) -> tensor<8x8xi64> {
    %0 = arith.extui %arg0 : tensor<8x8xi32> to tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_extui_vector(%arg0: vector<8xi32>) -> vector<8xi64> {
    %0 = arith.extui %arg0 : vector<8xi32> to vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_extui_scalable_vector(%arg0: vector<[8]xi32>) -> vector<[8]xi64> {
    %0 = arith.extui %arg0 : vector<[8]xi32> to vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_extsi(%arg0: i32) -> i64 {
    %0 = arith.extsi %arg0 : i32 to i64
    return %0 : i64
  }
  func.func @test_extsi_tensor(%arg0: tensor<8x8xi32>) -> tensor<8x8xi64> {
    %0 = arith.extsi %arg0 : tensor<8x8xi32> to tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_extsi_vector(%arg0: vector<8xi32>) -> vector<8xi64> {
    %0 = arith.extsi %arg0 : vector<8xi32> to vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_extsi_scalable_vector(%arg0: vector<[8]xi32>) -> vector<[8]xi64> {
    %0 = arith.extsi %arg0 : vector<[8]xi32> to vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_extf(%arg0: f32) -> f64 {
    %0 = arith.extf %arg0 : f32 to f64
    return %0 : f64
  }
  func.func @test_extf_tensor(%arg0: tensor<8x8xf32>) -> tensor<8x8xf64> {
    %0 = arith.extf %arg0 : tensor<8x8xf32> to tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_extf_tensor_encoding(%arg0: tensor<8x8xf32, "foo">) -> tensor<8x8xf64, "foo"> {
    %0 = arith.extf %arg0 : tensor<8x8xf32, "foo"> to tensor<8x8xf64, "foo">
    return %0 : tensor<8x8xf64, "foo">
  }
  func.func @test_extf_vector(%arg0: vector<8xf32>) -> vector<8xf64> {
    %0 = arith.extf %arg0 : vector<8xf32> to vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_extf_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf64> {
    %0 = arith.extf %arg0 : vector<[8]xf32> to vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_trunci(%arg0: i32) -> i16 {
    %0 = arith.trunci %arg0 : i32 to i16
    return %0 : i16
  }
  func.func @test_trunci_tensor(%arg0: tensor<8x8xi32>) -> tensor<8x8xi16> {
    %0 = arith.trunci %arg0 : tensor<8x8xi32> to tensor<8x8xi16>
    return %0 : tensor<8x8xi16>
  }
  func.func @test_trunci_vector(%arg0: vector<8xi32>) -> vector<8xi16> {
    %0 = arith.trunci %arg0 : vector<8xi32> to vector<8xi16>
    return %0 : vector<8xi16>
  }
  func.func @test_trunci_scalable_vector(%arg0: vector<[8]xi32>) -> vector<[8]xi16> {
    %0 = arith.trunci %arg0 : vector<[8]xi32> to vector<[8]xi16>
    return %0 : vector<[8]xi16>
  }
  func.func @test_truncf(%arg0: f32) -> bf16 {
    %0 = arith.truncf %arg0 : f32 to bf16
    return %0 : bf16
  }
  func.func @test_truncf_tensor(%arg0: tensor<8x8xf32>) -> tensor<8x8xbf16> {
    %0 = arith.truncf %arg0 : tensor<8x8xf32> to tensor<8x8xbf16>
    return %0 : tensor<8x8xbf16>
  }
  func.func @test_truncf_vector(%arg0: vector<8xf32>) -> vector<8xbf16> {
    %0 = arith.truncf %arg0 : vector<8xf32> to vector<8xbf16>
    return %0 : vector<8xbf16>
  }
  func.func @test_truncf_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xbf16> {
    %0 = arith.truncf %arg0 : vector<[8]xf32> to vector<[8]xbf16>
    return %0 : vector<[8]xbf16>
  }
  func.func @test_truncf_rounding_mode(%arg0: f64) -> (f32, f32, f32, f32, f32) {
    %0 = arith.truncf %arg0 to_nearest_even : f64 to f32
    %1 = arith.truncf %arg0 downward : f64 to f32
    %2 = arith.truncf %arg0 upward : f64 to f32
    %3 = arith.truncf %arg0 toward_zero : f64 to f32
    %4 = arith.truncf %arg0 to_nearest_away : f64 to f32
    return %0, %1, %2, %3, %4 : f32, f32, f32, f32, f32
  }
  func.func @test_uitofp(%arg0: i32) -> f32 {
    %0 = arith.uitofp %arg0 : i32 to f32
    return %0 : f32
  }
  func.func @test_uitofp_tensor(%arg0: tensor<8x8xi32>) -> tensor<8x8xf32> {
    %0 = arith.uitofp %arg0 : tensor<8x8xi32> to tensor<8x8xf32>
    return %0 : tensor<8x8xf32>
  }
  func.func @test_uitofp_vector(%arg0: vector<8xi32>) -> vector<8xf32> {
    %0 = arith.uitofp %arg0 : vector<8xi32> to vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @test_uitofp_scalable_vector(%arg0: vector<[8]xi32>) -> vector<[8]xf32> {
    %0 = arith.uitofp %arg0 : vector<[8]xi32> to vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @test_sitofp(%arg0: i16) -> f64 {
    %0 = arith.sitofp %arg0 : i16 to f64
    return %0 : f64
  }
  func.func @test_sitofp_tensor(%arg0: tensor<8x8xi16>) -> tensor<8x8xf64> {
    %0 = arith.sitofp %arg0 : tensor<8x8xi16> to tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_sitofp_vector(%arg0: vector<8xi16>) -> vector<8xf64> {
    %0 = arith.sitofp %arg0 : vector<8xi16> to vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_sitofp_scalable_vector(%arg0: vector<[8]xi16>) -> vector<[8]xf64> {
    %0 = arith.sitofp %arg0 : vector<[8]xi16> to vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_fptoui(%arg0: bf16) -> i8 {
    %0 = arith.fptoui %arg0 : bf16 to i8
    return %0 : i8
  }
  func.func @test_fptoui_tensor(%arg0: tensor<8x8xbf16>) -> tensor<8x8xi8> {
    %0 = arith.fptoui %arg0 : tensor<8x8xbf16> to tensor<8x8xi8>
    return %0 : tensor<8x8xi8>
  }
  func.func @test_fptoui_vector(%arg0: vector<8xbf16>) -> vector<8xi8> {
    %0 = arith.fptoui %arg0 : vector<8xbf16> to vector<8xi8>
    return %0 : vector<8xi8>
  }
  func.func @test_fptoui_scalable_vector(%arg0: vector<[8]xbf16>) -> vector<[8]xi8> {
    %0 = arith.fptoui %arg0 : vector<[8]xbf16> to vector<[8]xi8>
    return %0 : vector<[8]xi8>
  }
  func.func @test_fptosi(%arg0: f64) -> i64 {
    %0 = arith.fptosi %arg0 : f64 to i64
    return %0 : i64
  }
  func.func @test_fptosi_tensor(%arg0: tensor<8x8xf64>) -> tensor<8x8xi64> {
    %0 = arith.fptosi %arg0 : tensor<8x8xf64> to tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_fptosi_vector(%arg0: vector<8xf64>) -> vector<8xi64> {
    %0 = arith.fptosi %arg0 : vector<8xf64> to vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_fptosi_scalable_vector(%arg0: vector<[8]xf64>) -> vector<[8]xi64> {
    %0 = arith.fptosi %arg0 : vector<[8]xf64> to vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_index_cast0(%arg0: i32) -> index {
    %0 = arith.index_cast %arg0 : i32 to index
    return %0 : index
  }
  func.func @test_index_cast_tensor0(%arg0: tensor<8x8xi32>) -> tensor<8x8xindex> {
    %0 = arith.index_cast %arg0 : tensor<8x8xi32> to tensor<8x8xindex>
    return %0 : tensor<8x8xindex>
  }
  func.func @test_index_cast_vector0(%arg0: vector<8xi32>) -> vector<8xindex> {
    %0 = arith.index_cast %arg0 : vector<8xi32> to vector<8xindex>
    return %0 : vector<8xindex>
  }
  func.func @test_index_cast_scalable_vector0(%arg0: vector<[8]xi32>) -> vector<[8]xindex> {
    %0 = arith.index_cast %arg0 : vector<[8]xi32> to vector<[8]xindex>
    return %0 : vector<[8]xindex>
  }
  func.func @test_index_cast1(%arg0: index) -> i64 {
    %0 = arith.index_cast %arg0 : index to i64
    return %0 : i64
  }
  func.func @test_index_cast_tensor1(%arg0: tensor<8x8xindex>) -> tensor<8x8xi64> {
    %0 = arith.index_cast %arg0 : tensor<8x8xindex> to tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_index_cast_vector1(%arg0: vector<8xindex>) -> vector<8xi64> {
    %0 = arith.index_cast %arg0 : vector<8xindex> to vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_index_cast_scalable_vector1(%arg0: vector<[8]xindex>) -> vector<[8]xi64> {
    %0 = arith.index_cast %arg0 : vector<[8]xindex> to vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_index_castui0(%arg0: i32) -> index {
    %0 = arith.index_castui %arg0 : i32 to index
    return %0 : index
  }
  func.func @test_index_castui_tensor0(%arg0: tensor<8x8xi32>) -> tensor<8x8xindex> {
    %0 = arith.index_castui %arg0 : tensor<8x8xi32> to tensor<8x8xindex>
    return %0 : tensor<8x8xindex>
  }
  func.func @test_index_castui_vector0(%arg0: vector<8xi32>) -> vector<8xindex> {
    %0 = arith.index_castui %arg0 : vector<8xi32> to vector<8xindex>
    return %0 : vector<8xindex>
  }
  func.func @test_index_castui_scalable_vector0(%arg0: vector<[8]xi32>) -> vector<[8]xindex> {
    %0 = arith.index_castui %arg0 : vector<[8]xi32> to vector<[8]xindex>
    return %0 : vector<[8]xindex>
  }
  func.func @test_indexui_cast1(%arg0: index) -> i64 {
    %0 = arith.index_castui %arg0 : index to i64
    return %0 : i64
  }
  func.func @test_index_castui_tensor1(%arg0: tensor<8x8xindex>) -> tensor<8x8xi64> {
    %0 = arith.index_castui %arg0 : tensor<8x8xindex> to tensor<8x8xi64>
    return %0 : tensor<8x8xi64>
  }
  func.func @test_index_castui_vector1(%arg0: vector<8xindex>) -> vector<8xi64> {
    %0 = arith.index_castui %arg0 : vector<8xindex> to vector<8xi64>
    return %0 : vector<8xi64>
  }
  func.func @test_index_castui_scalable_vector1(%arg0: vector<[8]xindex>) -> vector<[8]xi64> {
    %0 = arith.index_castui %arg0 : vector<[8]xindex> to vector<[8]xi64>
    return %0 : vector<[8]xi64>
  }
  func.func @test_bitcast0(%arg0: i64) -> f64 {
    %0 = arith.bitcast %arg0 : i64 to f64
    return %0 : f64
  }
  func.func @test_bitcast_tensor0(%arg0: tensor<8x8xi64>) -> tensor<8x8xf64> {
    %0 = arith.bitcast %arg0 : tensor<8x8xi64> to tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @test_bitcast_vector0(%arg0: vector<8xi64>) -> vector<8xf64> {
    %0 = arith.bitcast %arg0 : vector<8xi64> to vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @test_bitcast_scalable_vector0(%arg0: vector<[8]xi64>) -> vector<[8]xf64> {
    %0 = arith.bitcast %arg0 : vector<[8]xi64> to vector<[8]xf64>
    return %0 : vector<[8]xf64>
  }
  func.func @test_bitcast1(%arg0: f32) -> i32 {
    %0 = arith.bitcast %arg0 : f32 to i32
    return %0 : i32
  }
  func.func @test_bitcast_tensor1(%arg0: tensor<8x8xf32>) -> tensor<8x8xi32> {
    %0 = arith.bitcast %arg0 : tensor<8x8xf32> to tensor<8x8xi32>
    return %0 : tensor<8x8xi32>
  }
  func.func @test_bitcast_vector1(%arg0: vector<8xf32>) -> vector<8xi32> {
    %0 = arith.bitcast %arg0 : vector<8xf32> to vector<8xi32>
    return %0 : vector<8xi32>
  }
  func.func @test_bitcast_scalable_vector1(%arg0: vector<[8]xf32>) -> vector<[8]xi32> {
    %0 = arith.bitcast %arg0 : vector<[8]xf32> to vector<[8]xi32>
    return %0 : vector<[8]xi32>
  }
  func.func @test_cmpi(%arg0: i64, %arg1: i64) -> i1 {
    %0 = arith.cmpi ne, %arg0, %arg1 : i64
    return %0 : i1
  }
  func.func @test_cmpi_tensor(%arg0: tensor<8x8xi64>, %arg1: tensor<8x8xi64>) -> tensor<8x8xi1> {
    %0 = arith.cmpi slt, %arg0, %arg1 : tensor<8x8xi64>
    return %0 : tensor<8x8xi1>
  }
  func.func @test_cmpi_tensor_encoding(%arg0: tensor<8x8xi64, "foo">, %arg1: tensor<8x8xi64, "foo">) -> tensor<8x8xi1, "foo"> {
    %0 = arith.cmpi slt, %arg0, %arg1 : tensor<8x8xi64, "foo">
    return %0 : tensor<8x8xi1, "foo">
  }
  func.func @test_cmpi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi1> {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<8xi64>
    return %0 : vector<8xi1>
  }
  func.func @test_cmpi_scalable_vector(%arg0: vector<[8]xi64>, %arg1: vector<[8]xi64>) -> vector<[8]xi1> {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<[8]xi64>
    return %0 : vector<[8]xi1>
  }
  func.func @test_cmpi_vector_0d(%arg0: vector<i64>, %arg1: vector<i64>) -> vector<i1> {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<i64>
    return %0 : vector<i1>
  }
  func.func @test_cmpf(%arg0: f64, %arg1: f64) -> i1 {
    %0 = arith.cmpf oeq, %arg0, %arg1 : f64
    return %0 : i1
  }
  func.func @test_cmpf_tensor(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>) -> tensor<8x8xi1> {
    %0 = arith.cmpf olt, %arg0, %arg1 : tensor<8x8xf64>
    return %0 : tensor<8x8xi1>
  }
  func.func @test_cmpf_vector(%arg0: vector<8xf64>, %arg1: vector<8xf64>) -> vector<8xi1> {
    %0 = arith.cmpf ult, %arg0, %arg1 : vector<8xf64>
    return %0 : vector<8xi1>
  }
  func.func @test_cmpf_scalable_vector(%arg0: vector<[8]xf64>, %arg1: vector<[8]xf64>) -> vector<[8]xi1> {
    %0 = arith.cmpf ult, %arg0, %arg1 : vector<[8]xf64>
    return %0 : vector<[8]xi1>
  }
  func.func @test_index_cast(%arg0: index) -> i64 {
    %0 = arith.index_cast %arg0 : index to i64
    return %0 : i64
  }
  func.func @test_index_cast_tensor(%arg0: tensor<index>) -> tensor<i64> {
    %0 = arith.index_cast %arg0 : tensor<index> to tensor<i64>
    return %0 : tensor<i64>
  }
  func.func @test_index_cast_tensor_reverse(%arg0: tensor<i64>) -> tensor<index> {
    %0 = arith.index_cast %arg0 : tensor<i64> to tensor<index>
    return %0 : tensor<index>
  }
  func.func @bitcast(%arg0: f32) -> i32 {
    %0 = arith.bitcast %arg0 : f32 to i32
    return %0 : i32
  }
  func.func @test_constant() {
    %c42_i32 = arith.constant 42 : i32
    %c42_i32_0 = arith.constant 42 : i32
    %c43 = arith.constant {crazy = "func.foo"} 43 : index
    %cst = arith.constant 4.300000e+01 : bf16
    %cst_1 = arith.constant dense<0> : vector<4xi32>
    %cst_2 = arith.constant dense<0> : tensor<42xi32>
    %cst_3 = arith.constant dense<0> : vector<42xi32>
    %true = arith.constant true
    %false = arith.constant false
    %c-1_i128 = arith.constant -1 : i128
    %c85070591730234615865843651857942052864_i128 = arith.constant 85070591730234615865843651857942052864 : i128
    return
  }
  func.func @maximum(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>, %arg4: f32, %arg5: f32, %arg6: i32, %arg7: i32) {
    %0 = arith.maximumf %arg0, %arg1 : vector<4xf32>
    %1 = arith.maximumf %arg2, %arg3 : vector<[4]xf32>
    %2 = arith.maximumf %arg4, %arg5 : f32
    %3 = arith.maxnumf %arg0, %arg1 : vector<4xf32>
    %4 = arith.maxnumf %arg2, %arg3 : vector<[4]xf32>
    %5 = arith.maxnumf %arg4, %arg5 : f32
    %6 = arith.maxsi %arg6, %arg7 : i32
    %7 = arith.maxui %arg6, %arg7 : i32
    return
  }
  func.func @minimum(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>, %arg4: f32, %arg5: f32, %arg6: i32, %arg7: i32) {
    %0 = arith.minimumf %arg0, %arg1 : vector<4xf32>
    %1 = arith.minimumf %arg2, %arg3 : vector<[4]xf32>
    %2 = arith.minimumf %arg4, %arg5 : f32
    %3 = arith.minnumf %arg0, %arg1 : vector<4xf32>
    %4 = arith.minnumf %arg2, %arg3 : vector<[4]xf32>
    %5 = arith.minnumf %arg4, %arg5 : f32
    %6 = arith.minsi %arg6, %arg7 : i32
    %7 = arith.minui %arg6, %arg7 : i32
    return
  }
  func.func @fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
    %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
    %1 = arith.subf %arg0, %arg1 fastmath<fast> : f32
    %2 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
    %3 = arith.divf %arg0, %arg1 fastmath<fast> : f32
    %4 = arith.remf %arg0, %arg1 fastmath<fast> : f32
    %5 = arith.negf %arg0 fastmath<fast> : f32
    %6 = arith.addf %arg0, %arg1 : f32
    %7 = arith.addf %arg0, %arg1 fastmath<nnan,ninf> : f32
    %8 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
    %9 = arith.cmpf oeq, %arg0, %arg1 fastmath<fast> : f32
    return
  }
  func.func @select_tensor(%arg0: tensor<8xi1>, %arg1: tensor<8xi32>, %arg2: tensor<8xi32>) -> tensor<8xi32> {
    %0 = arith.select %arg0, %arg1, %arg2 : tensor<8xi1>, tensor<8xi32>
    return %0 : tensor<8xi32>
  }
  func.func @select_tensor_encoding(%arg0: tensor<8xi1, "foo">, %arg1: tensor<8xi32, "foo">, %arg2: tensor<8xi32, "foo">) -> tensor<8xi32, "foo"> {
    %0 = arith.select %arg0, %arg1, %arg2 : tensor<8xi1, "foo">, tensor<8xi32, "foo">
    return %0 : tensor<8xi32, "foo">
  }
  func.func @intflags_func(%arg0: i64, %arg1: i64) {
    %0 = arith.addi %arg0, %arg1 overflow<nsw> : i64
    %1 = arith.subi %arg0, %arg1 overflow<nuw> : i64
    %2 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
    %3 = arith.shli %arg0, %arg1 overflow<nsw, nuw> : i64
    %4 = arith.trunci %arg0 overflow<nsw, nuw> : i64 to i32
    return
  }
}

