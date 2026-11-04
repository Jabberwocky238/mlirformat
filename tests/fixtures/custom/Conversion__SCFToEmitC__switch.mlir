module {
  func.func @switch_no_result(%arg0: index) {
    scf.index_switch %arg0 
    case 2 {
      %c10_i32 = arith.constant 10 : i32
      scf.yield
    }
    case 5 {
      %c20_i32 = arith.constant 20 : i32
      scf.yield
    }
    default {
      %c30_i32 = arith.constant 30 : i32
    }
    return
  }
  func.func @switch_one_result(%arg0: index) {
    %0 = scf.index_switch %arg0 -> i32 
    case 2 {
      %c10_i32 = arith.constant 10 : i32
      scf.yield %c10_i32 : i32
    }
    case 5 {
      %c20_i32 = arith.constant 20 : i32
      scf.yield %c20_i32 : i32
    }
    default {
      %c30_i32 = arith.constant 30 : i32
      scf.yield %c30_i32 : i32
    }
    return
  }
  func.func @switch_two_results(%arg0: index) -> (i32, f32) {
    %0:2 = scf.index_switch %arg0 -> i32, f32 
    case 2 {
      %c10_i32 = arith.constant 10 : i32
      %cst = arith.constant 1.200000e+00 : f32
      scf.yield %c10_i32, %cst : i32, f32
    }
    case 5 {
      %c20_i32 = arith.constant 20 : i32
      %cst = arith.constant 2.400000e+00 : f32
      scf.yield %c20_i32, %cst : i32, f32
    }
    default {
      %c30_i32 = arith.constant 30 : i32
      %cst = arith.constant 3.600000e+00 : f32
      scf.yield %c30_i32, %cst : i32, f32
    }
    return %0#0, %0#1 : i32, f32
  }
}

