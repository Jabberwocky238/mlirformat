module {
  func.func @std_for(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      scf.for %arg4 = %arg0 to %arg1 step %arg2 {
        %0 = arith.cmpi slt, %arg3, %arg4 : index
        %1 = arith.select %0, %arg3, %arg4 : index
        %2 = arith.cmpi sge, %arg3, %arg4 : index
        %3 = arith.select %2, %arg3, %arg4 : index
        scf.for %arg5 = %1 to %3 step %arg4 {
        }
      }
    }
    return
  }
  func.func @std_for_i32(%arg0: i32, %arg1: i32, %arg2: i32) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2  : i32 {
      scf.for unsigned %arg4 = %arg0 to %arg1 step %arg2  : i32 {
      }
    }
    return
  }
  func.func @scf_for_i64_iter(%arg0: i64, %arg1: i64) {
    %c1_i64 = arith.constant 1 : i64
    %c0_i64 = arith.constant 0 : i64
    %0 = scf.for %arg2 = %arg0 to %arg1 step %c1_i64 iter_args(%arg3 = %c0_i64) -> (i64)  : i64 {
      %1 = arith.addi %arg3, %arg2 : i64
      scf.yield %1 : i64
    }
    return
  }
  func.func @std_if(%arg0: i1, %arg1: f32) {
    scf.if %arg0 {
      %0 = arith.addf %arg1, %arg1 : f32
    }
    return
  }
  func.func @std_if_else(%arg0: i1, %arg1: f32) {
    scf.if %arg0 {
      %0 = arith.addf %arg1, %arg1 : f32
    } else {
      %0 = arith.addf %arg1, %arg1 : f32
    }
    return
  }
  func.func @std_parallel_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c1 = arith.constant 1 : index
    scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) {
      %0 = arith.cmpi slt, %arg5, %arg6 : index
      %1 = arith.select %0, %arg5, %arg6 : index
      %2 = arith.cmpi sge, %arg5, %arg6 : index
      %3 = arith.select %2, %arg5, %arg6 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0_i32 = arith.constant 0 : i32
      %4:2 = scf.parallel (%arg7) = (%1) to (%3) step (%arg6) init (%cst, %c0_i32) -> (f32, i32) {
        %cst_0 = arith.constant 1.000000e+00 : f32
        %c1_i32 = arith.constant 1 : i32
        scf.reduce(%cst_0, %c1_i32 : f32, i32) {
        ^bb0(%arg8: f32, %arg9: f32):
          %5 = arith.addf %arg8, %arg9 : f32
          scf.reduce.return %5 : f32
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %5 = arith.muli %arg8, %arg9 : i32
          scf.reduce.return %5 : i32
        }
      }
      scf.reduce 
    }
    return
  }
  func.func @parallel_explicit_yield(%arg0: index, %arg1: index, %arg2: index) {
    scf.parallel (%arg3) = (%arg0) to (%arg1) step (%arg2) {
      scf.reduce 
    }
    return
  }
  func.func @std_if_yield(%arg0: i1, %arg1: f32) {
    %0:2 = scf.if %arg0 -> (f32, f32) {
      %1 = arith.addf %arg1, %arg1 : f32
      %2 = arith.subf %arg1, %arg1 : f32
      scf.yield %1, %2 : f32, f32
    } else {
      %1 = arith.subf %arg1, %arg1 : f32
      %2 = arith.addf %arg1, %arg1 : f32
      scf.yield %1, %2 : f32, f32
    }
    return
  }
  func.func @std_for_yield(%arg0: index, %arg1: index, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst) -> (f32) {
      %1 = arith.addf %arg4, %arg4 : f32
      scf.yield %1 : f32
    }
    return
  }
  func.func @std_for_yield_multi(%arg0: index, %arg1: index, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:3 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst, %arg5 = %c1_i32, %arg6 = %cst_0) -> (f32, i32, f32) {
      %1 = arith.addf %arg4, %arg4 : f32
      %2 = arith.addi %arg5, %arg5 : i32
      %3 = arith.subf %arg6, %arg6 : f32
      scf.yield %1, %2, %3 : f32, i32, f32
    }
    return
  }
  func.func @conditional_reduce(%arg0: memref<1024xf32>, %arg1: index, %arg2: index, %arg3: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg4] : memref<1024xf32>
      %2 = arith.cmpf ugt, %1, %cst_0 : f32
      %3 = scf.if %2 -> (f32) {
        %4 = arith.addf %arg5, %1 : f32
        scf.yield %4 : f32
      } else {
        scf.yield %arg5 : f32
      }
      scf.yield %3 : f32
    }
    return %0 : f32
  }
  func.func @while() {
    %0 = "test.get_some_value"() : () -> i32
    %1 = "test.get_some_value"() : () -> f32
    %2:2 = scf.while (%arg0 = %0, %arg1 = %1) : (i32, f32) -> (i64, f64) {
      %3:2 = "test.some_operation"(%arg0, %arg1) : (i32, f32) -> (i64, f64)
      %4 = "test.some_condition"(%arg0, %arg1) : (i32, f32) -> i1
      scf.condition(%4) %3#0, %3#1 : i64, f64
    } do {
    ^bb0(%arg0: i64, %arg1: f64):
      %3:2 = "test.some_operation"(%arg0, %arg1) : (i64, f64) -> (i32, f32)
      scf.yield %3#0, %3#1 : i32, f32
    } attributes {foo = "bar"}
    return
  }
  func.func @infinite_while() {
    %true = arith.constant true
    scf.while : () -> () {
      scf.condition(%true)
    } do {
      scf.yield
    }
    return
  }
  func.func @execute_region() -> i64 {
    %0 = scf.execute_region -> i64 {
      %c1_i64 = arith.constant 1 : i64
      scf.yield %c1_i64 : i64
    }
    %1:2 = scf.execute_region -> (i64, i64) {
      %c1_i64 = arith.constant 1 : i64
      scf.yield %c1_i64, %c1_i64 : i64, i64
    }
    scf.execute_region {
      cf.br ^bb1
    ^bb1:  // pred: ^bb0
      scf.yield
    }
    return %0 : i64
  }
  func.func @normalized_forall(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>) {
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %0 = scf.forall (%arg2) in (%c100) shared_outs(%arg3 = %arg1) -> (tensor<100xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [1] [1] : tensor<100xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<100xf32>
      }
    }
    return
  }
  func.func @explicit_loop_bounds_forall(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %0 = scf.forall (%arg2) in (%c100) shared_outs(%arg3 = %arg1) -> (tensor<100xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [1] [1] : tensor<100xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<100xf32>
      }
    }
    return
  }
  func.func @normalized_forall_elide_terminator() {
    %c100 = arith.constant 100 : index
    scf.forall (%arg0) in (%c100) {
    } {mapping = [#gpu.thread<x>]}
    return
  }
  func.func @explicit_loop_bounds_forall_elide_terminator() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    scf.forall (%arg0) in (%c100) {
    } {mapping = [#gpu.thread<x>]}
    return
  }
  func.func @switch(%arg0: index) -> i32 {
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
    scf.index_switch %arg0 
    default {
    }
    return %0 : i32
  }
}

