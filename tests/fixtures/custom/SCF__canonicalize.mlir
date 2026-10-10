module {
  func.func @single_iteration_some(%arg0: memref<?x?x?xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %c7 = arith.constant 7 : index
    %c10 = arith.constant 10 : index
    scf.parallel (%arg1, %arg2, %arg3) = (%c0, %c3, %c7) to (%c1, %c6, %c10) step (%c1, %c2, %c3) {
      %c42_i32 = arith.constant 42 : i32
      memref.store %c42_i32, %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xi32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @single_iteration_all(%arg0: memref<?x?x?xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %c7 = arith.constant 7 : index
    %c10 = arith.constant 10 : index
    scf.parallel (%arg1, %arg2, %arg3) = (%c0, %c3, %c7) to (%c1, %c6, %c10) step (%c1, %c3, %c3) {
      %c42_i32 = arith.constant 42 : i32
      memref.store %c42_i32, %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xi32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @single_iteration_reduce(%arg0: index, %arg1: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %0:2 = scf.parallel (%arg2, %arg3) = (%c1, %c3) to (%c2, %c6) step (%c1, %c3) init (%arg0, %arg1) -> (index, index) {
      scf.reduce(%arg2, %arg3 : index, index) {
      ^bb0(%arg4: index, %arg5: index):
        %1 = arith.addi %arg4, %arg5 : index
        scf.reduce.return %1 : index
      }, {
      ^bb0(%arg4: index, %arg5: index):
        %1 = arith.muli %arg4, %arg5 : index
        scf.reduce.return %1 : index
      }
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @nested_parallel(%arg0: memref<?x?x?xf64>) -> memref<?x?x?xf64> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf64>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf64>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf64>
    %alloc = memref.alloc(%dim, %dim_0, %dim_1) : memref<?x?x?xf64>
    scf.parallel (%arg1) = (%c0) to (%dim) step (%c1) {
      scf.parallel (%arg2) = (%c0) to (%dim_0) step (%c1) {
        scf.parallel (%arg3) = (%c0) to (%dim_1) step (%c1) {
          %0 = memref.load %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xf64>
          memref.store %0, %alloc[%arg1, %arg2, %arg3] : memref<?x?x?xf64>
          scf.reduce 
        }
        scf.reduce 
      }
      scf.reduce 
    }
    return %alloc : memref<?x?x?xf64>
  }
}

// -----
module {
  func.func private @side_effect()
  func.func @one_unused(%arg0: i1) -> index {
    %0:2 = scf.if %arg0 -> (index, index) {
      func.call @side_effect() : () -> ()
      %1 = "test.value0"() : () -> index
      %2 = "test.value1"() : () -> index
      scf.yield %1, %2 : index, index
    } else {
      %1 = "test.value2"() : () -> index
      %2 = "test.value3"() : () -> index
      scf.yield %1, %2 : index, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func private @side_effect()
  func.func @nested_unused(%arg0: i1, %arg1: i1) -> index {
    %0:2 = scf.if %arg0 -> (index, index) {
      %1:2 = scf.if %arg1 -> (index, index) {
        func.call @side_effect() : () -> ()
        %2 = "test.value0"() : () -> index
        %3 = "test.value1"() : () -> index
        scf.yield %2, %3 : index, index
      } else {
        %2 = "test.value2"() : () -> index
        %3 = "test.value3"() : () -> index
        scf.yield %2, %3 : index, index
      }
      scf.yield %1#0, %1#1 : index, index
    } else {
      %1 = "test.value0_2"() : () -> index
      %2 = "test.value1_2"() : () -> index
      scf.yield %1, %2 : index, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func private @side_effect()
  func.func @all_unused(%arg0: i1) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = scf.if %arg0 -> (index, index) {
      func.call @side_effect() : () -> ()
      scf.yield %c0, %c1 : index, index
    } else {
      func.call @side_effect() : () -> ()
      scf.yield %c0, %c1 : index, index
    }
    return
  }
}

// -----
module {
  func.func @empty_if1(%arg0: i1) {
    scf.if %arg0 {
    }
    return
  }
}

// -----
module {
  func.func @empty_if2(%arg0: i1) {
    scf.if %arg0 {
    } else {
    }
    return
  }
}

// -----
module {
  func.func @empty_else(%arg0: i1, %arg1: memref<i1>) {
    scf.if %arg0 {
      memref.store %arg0, %arg1[] : memref<i1>
    } else {
    }
    return
  }
}

// -----
module {
  func.func @to_select1(%arg0: i1) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.if %arg0 -> (index) {
      scf.yield %c0 : index
    } else {
      scf.yield %c1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @to_select_same_val(%arg0: i1) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = scf.if %arg0 -> (index, index) {
      scf.yield %c0, %c1 : index, index
    } else {
      scf.yield %c1, %c1 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @to_select_with_body(%arg0: i1) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.if %arg0 -> (index) {
      "test.op"() : () -> ()
      scf.yield %c0 : index
    } else {
      scf.yield %c1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @to_select2(%arg0: i1) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0:2 = scf.if %arg0 -> (index, index) {
      scf.yield %c0, %c1 : index, index
    } else {
      scf.yield %c2, %c3 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func private @make_i32() -> i32
  func.func @for_yields_2(%arg0: index, %arg1: index, %arg2: index) -> i32 {
    %0 = call @make_i32() : () -> i32
    %1 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %0) -> (i32) {
      scf.yield %arg4 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func private @make_i32() -> i32
  func.func @for_yields_3(%arg0: index, %arg1: index, %arg2: index) -> (i32, i32, i32) {
    %0 = call @make_i32() : () -> i32
    %1 = call @make_i32() : () -> i32
    %2:3 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %0, %arg5 = %0, %arg6 = %1) -> (i32, i32, i32) {
      %3 = func.call @make_i32() : () -> i32
      scf.yield %arg4, %3, %arg6 : i32, i32, i32
    } {some_attr}
    return %2#0, %2#1, %2#2 : i32, i32, i32
  }
}

// -----
module {
  func.func @for_yields_4() -> i32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = scf.for %arg0 = %c0 to %c2 step %c1 iter_args(%arg1 = %c3_i32) -> (i32) {
      scf.yield %c4_i32 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @constant_iter_arg(%arg0: index, %arg1: index, %arg2: index) {
    %c0_i32 = arith.constant 0 : i32
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %c0_i32) -> (i32) {
      "test.use"(%arg4) : (i32) -> ()
      scf.yield %c0_i32 : i32
    }
    return
  }
}

// -----
module {
  func.func @replace_true_if() {
    %true = arith.constant true
    scf.if %true {
      "test.op"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @remove_false_if() {
    %false = arith.constant false
    scf.if %false {
      "test.op"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @replace_true_if_with_values() {
    %true = arith.constant true
    %0 = scf.if %true -> (i32) {
      %1 = "test.op"() : () -> i32
      scf.yield %1 : i32
    } else {
      %1 = "test.other_op"() : () -> i32
      scf.yield %1 : i32
    }
    "test.consume"(%0) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @replace_false_if_with_values() {
    %false = arith.constant false
    %0 = scf.if %false -> (i32) {
      %1 = "test.op"() : () -> i32
      scf.yield %1 : i32
    } else {
      %1 = "test.other_op"() : () -> i32
      scf.yield %1 : i32
    }
    "test.consume"(%0) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @merge_nested_if(%arg0: i1, %arg1: i1) {
    scf.if %arg0 {
      scf.if %arg1 {
        "test.op"() : () -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @merge_yielding_nested_if(%arg0: i1, %arg1: i1) -> (i32, f32, i32, i8) {
    %0 = "test.op"() : () -> i32
    %1 = "test.op1"() : () -> f32
    %2 = "test.op2"() : () -> i32
    %3 = "test.op3"() : () -> i8
    %4:4 = scf.if %arg0 -> (i32, f32, i32, i8) {
      %5:2 = scf.if %arg1 -> (i32, f32) {
        %6 = "test.inop"() : () -> i32
        %7 = "test.inop1"() : () -> f32
        scf.yield %6, %7 : i32, f32
      } else {
        scf.yield %2, %1 : i32, f32
      }
      scf.yield %0, %5#1, %5#0, %3 : i32, f32, i32, i8
    } else {
      scf.yield %0, %1, %2, %3 : i32, f32, i32, i8
    }
    return %4#0, %4#1, %4#2, %4#3 : i32, f32, i32, i8
  }
}

// -----
module {
  func.func @merge_yielding_nested_if_nv1(%arg0: i1, %arg1: i1) {
    %0 = "test.op"() : () -> i32
    %1 = "test.op1"() : () -> f32
    scf.if %arg0 {
      %2:2 = scf.if %arg1 -> (i32, f32) {
        %3 = "test.inop"() : () -> i32
        %4 = "test.inop1"() : () -> f32
        scf.yield %3, %4 : i32, f32
      } else {
        scf.yield %0, %1 : i32, f32
      }
    }
    return
  }
}

// -----
module {
  func.func @merge_yielding_nested_if_nv2(%arg0: i1, %arg1: i1) -> i32 {
    %0 = "test.op"() : () -> i32
    %1 = "test.op1"() : () -> i32
    %2 = scf.if %arg0 -> (i32) {
      scf.if %arg1 {
        "test.run"() : () -> ()
      }
      scf.yield %0 : i32
    } else {
      scf.yield %1 : i32
    }
    return %2 : i32
  }
}

// -----
module {
  func.func @merge_fail_yielding_nested_if(%arg0: i1, %arg1: i1) -> (i32, f32, i32, i8) {
    %0 = "test.op"() : () -> i32
    %1 = "test.op1"() : () -> f32
    %2 = "test.op2"() : () -> i32
    %3 = "test.op3"() : () -> i8
    %4:4 = scf.if %arg0 -> (i32, f32, i32, i8) {
      %5:2 = scf.if %arg1 -> (i32, f32) {
        %6 = "test.inop"() : () -> i32
        %7 = "test.inop1"() : () -> f32
        scf.yield %6, %7 : i32, f32
      } else {
        scf.yield %0, %1 : i32, f32
      }
      scf.yield %0, %5#1, %5#0, %3 : i32, f32, i32, i8
    } else {
      scf.yield %0, %1, %2, %3 : i32, f32, i32, i8
    }
    return %4#0, %4#1, %4#2, %4#3 : i32, f32, i32, i8
  }
}

// -----
module {
  func.func @if_condition_swap(%arg0: i1) -> index {
    %true = arith.constant true
    %0 = arith.xori %arg0, %true : i1
    %1 = scf.if %0 -> (index) {
      %2 = "test.origTrue"() : () -> index
      scf.yield %2 : index
    } else {
      %2 = "test.origFalse"() : () -> index
      scf.yield %2 : index
    }
    return %1 : index
  }
}

// -----
module {
  func.func @remove_zero_iteration_loop() {
    %c42 = arith.constant 42 : index
    %c1 = arith.constant 1 : index
    %0 = "test.init"() : () -> i32
    %1 = scf.for %arg0 = %c42 to %c1 step %c1 iter_args(%arg1 = %0) -> (i32) {
      %2 = "test.op"(%arg0, %arg1) : (index, i32) -> i32
      scf.yield %2 : i32
    }
    "test.consume"(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @remove_zero_iteration_loop_vals(%arg0: index) {
    %c2 = arith.constant 2 : index
    %0 = "test.init"() : () -> i32
    %1 = scf.for %arg1 = %arg0 to %arg0 step %c2 iter_args(%arg2 = %0) -> (i32) {
      %2 = "test.op"(%arg1, %arg2) : (index, i32) -> i32
      scf.yield %2 : i32
    }
    "test.consume"(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @replace_single_iteration_loop_1() {
    %c42 = arith.constant 42 : index
    %c43 = arith.constant 43 : index
    %c1 = arith.constant 1 : index
    %0 = "test.init"() : () -> i32
    %1 = scf.for %arg0 = %c42 to %c43 step %c1 iter_args(%arg1 = %0) -> (i32) {
      %2 = "test.op"(%arg0, %arg1) : (index, i32) -> i32
      scf.yield %2 : i32
    }
    "test.consume"(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @replace_single_iteration_loop_2() {
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %c11 = arith.constant 11 : index
    %0 = "test.init"() : () -> i32
    %1 = scf.for %arg0 = %c5 to %c11 step %c6 iter_args(%arg1 = %0) -> (i32) {
      %2 = "test.op"(%arg0, %arg1) : (index, i32) -> i32
      scf.yield %2 : i32
    }
    "test.consume"(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @replace_single_iteration_loop_non_unit_step() {
    %c42 = arith.constant 42 : index
    %c47 = arith.constant 47 : index
    %c5 = arith.constant 5 : index
    %0 = "test.init"() : () -> i32
    %1 = scf.for %arg0 = %c42 to %c47 step %c5 iter_args(%arg1 = %0) -> (i32) {
      %2 = "test.op"(%arg0, %arg1) : (index, i32) -> i32
      scf.yield %2 : i32
    }
    "test.consume"(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @replace_single_iteration_const_diff(%arg0: index) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = arith.addi %arg0, %c1 overflow<nsw> : index
    scf.for %arg1 = %arg0 to %0 step %c1 {
      %1 = arith.muli %c2, %arg1 : index
      "test.consume"(%1) : (index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @replace_single_iteration_loop_unsigned_cmp() {
    %c0_i32 = arith.constant 0 : i32
    %c-100_i32 = arith.constant -100 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %0 = "test.init"() : () -> i32
    %1 = scf.for unsigned %arg0 = %c0_i32 to %c-100_i32 step %c2147483647_i32 iter_args(%arg1 = %0) -> (i32)  : i32 {
      %2 = "test.op"(%arg0, %arg1) : (i32, i32) -> i32
      scf.yield %2 : i32
    }
    "test.consume"(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @remove_empty_parallel_loop(%arg0: index, %arg1: index, %arg2: index) {
    %0 = "test.init"() : () -> f32
    %1 = scf.parallel (%arg3, %arg4, %arg5) = (%arg0, %arg1, %arg0) to (%arg1, %arg1, %arg1) step (%arg2, %arg2, %arg2) init (%0) -> f32 {
      %2 = "test.produce"() : () -> f32
      scf.reduce(%2 : f32) {
      ^bb0(%arg6: f32, %arg7: f32):
        %3 = "test.transform"(%arg6, %arg7) : (f32, f32) -> f32
        scf.reduce.return %3 : f32
      }
    }
    "test.consume"(%1) : (f32) -> ()
    return
  }
}

// -----
module {
  func.func @fold_away_iter_with_no_use_and_yielded_input(%arg0: i32, %arg1: index, %arg2: index, %arg3: index) -> (i32, i32) {
    %c32_i32 = arith.constant 32 : i32
    %0:2 = scf.for %arg4 = %arg2 to %arg1 step %arg3 iter_args(%arg5 = %arg0, %arg6 = %c32_i32) -> (i32, i32) {
      %1 = arith.addi %arg5, %c32_i32 : i32
      scf.yield %1, %c32_i32 : i32, i32
    }
    return %0#0, %0#1 : i32, i32
  }
}

// -----
module {
  func.func @fold_away_iter_and_result_with_no_use(%arg0: i32, %arg1: index, %arg2: index, %arg3: index) -> i32 {
    %c32_i32 = arith.constant 32 : i32
    %0:2 = scf.for %arg4 = %arg2 to %arg1 step %arg3 iter_args(%arg5 = %arg0, %arg6 = %c32_i32) -> (i32, i32) {
      %1 = arith.addi %arg5, %c32_i32 : i32
      scf.yield %1, %1 : i32, i32
    }
    return %0#0 : i32
  }
}

// -----
module {
  func.func @replace_duplicate_iter_args(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index, index) {
    %0:4 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3, %arg7 = %arg4, %arg8 = %arg4, %arg9 = %arg3) -> (index, index, index, index) {
      %1 = arith.addi %arg6, %arg7 : index
      %2 = arith.addi %arg8, %arg9 : index
      scf.yield %1, %2, %2, %1 : index, index, index, index
    }
    return %0#0, %0#1, %0#2, %0#3 : index, index, index, index
  }
}

// -----
module {
  func.func private @do(tensor<?x?xf32>) -> tensor<?x?xf32>
  func.func @matmul_on_tensors(%arg0: tensor<32x1024xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1024 = arith.constant 1024 : index
    %cast = tensor.cast %arg0 : tensor<32x1024xf32> to tensor<?x?xf32>
    %0 = scf.for %arg1 = %c0 to %c1024 step %c32 iter_args(%arg2 = %cast) -> (tensor<?x?xf32>) {
      %1 = func.call @do(%arg2) : (tensor<?x?xf32>) -> tensor<?x?xf32>
      scf.yield %1 : tensor<?x?xf32>
    } {some_attr}
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @cond_prop(%arg0: i1) -> index {
    %0 = scf.if %arg0 -> (index) {
      %1 = scf.if %arg0 -> (index) {
        %2 = "test.get_some_value1"() : () -> index
        scf.yield %2 : index
      } else {
        %2 = "test.get_some_value2"() : () -> index
        scf.yield %2 : index
      }
      scf.yield %1 : index
    } else {
      %1 = scf.if %arg0 -> (index) {
        %2 = "test.get_some_value3"() : () -> index
        scf.yield %2 : index
      } else {
        %2 = "test.get_some_value4"() : () -> index
        scf.yield %2 : index
      }
      scf.yield %1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @replace_if_with_cond1(%arg0: i1) -> (i32, i1) {
    %true = arith.constant true
    %false = arith.constant false
    %0:2 = scf.if %arg0 -> (i32, i1) {
      %1 = "test.get_some_value"() : () -> i32
      scf.yield %1, %true : i32, i1
    } else {
      %1 = "test.get_some_value"() : () -> i32
      scf.yield %1, %false : i32, i1
    }
    return %0#0, %0#1 : i32, i1
  }
}

// -----
module {
  func.func @replace_if_with_cond2(%arg0: i1) -> (i32, i1) {
    %true = arith.constant true
    %false = arith.constant false
    %0:2 = scf.if %arg0 -> (i32, i1) {
      %1 = "test.get_some_value"() : () -> i32
      scf.yield %1, %false : i32, i1
    } else {
      %1 = "test.get_some_value"() : () -> i32
      scf.yield %1, %true : i32, i1
    }
    return %0#0, %0#1 : i32, i1
  }
}

// -----
module {
  func.func @replace_if_with_cond3(%arg0: i1, %arg1: i64) -> (i32, i64) {
    %0:2 = scf.if %arg0 -> (i32, i64) {
      %1 = "test.get_some_value"() : () -> i32
      scf.yield %1, %arg1 : i32, i64
    } else {
      %1 = "test.get_some_value"() : () -> i32
      scf.yield %1, %arg1 : i32, i64
    }
    return %0#0, %0#1 : i32, i64
  }
}

// -----
module {
  func.func @while_move_if_down() -> i32 {
    %0 = "test.get_some_value0"() : () -> i32
    %1 = scf.while : () -> i32 {
      %2 = "test.get_some_value1"() : () -> i32
      %3 = "test.get_some_value2"() : () -> i32
      %4 = "test.get_some_value3"() : () -> i32
      %5 = "test.condition"() : () -> i1
      %6 = scf.if %5 -> (i32) {
        "test.use0"(%0) : (i32) -> ()
        "test.use1"(%2) : (i32) -> ()
        test.alloca_scope_region {
          "test.use2"(%3) : (i32) -> ()
        }
        %7 = "test.get_some_value4"() : () -> i32
        scf.yield %7 : i32
      } else {
        scf.yield %4 : i32
      }
      scf.condition(%5) %6 : i32
    } do {
    ^bb0(%arg0: i32):
      "test.use3"(%arg0) : (i32) -> ()
      scf.yield
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @while_cond_true() -> i1 {
    %0 = scf.while : () -> i1 {
      %1 = "test.condition"() : () -> i1
      scf.condition(%1) %1 : i1
    } do {
    ^bb0(%arg0: i1):
      "test.use"(%arg0) : (i1) -> ()
      scf.yield
    }
    return %0 : i1
  }
}

// -----
module {
  func.func @invariant_loop_args_in_same_order(%arg0: tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
    %cst = arith.constant dense<0> : tensor<i32>
    %cst_0 = arith.constant dense<1> : tensor<i32>
    %cst_1 = arith.constant dense<42> : tensor<i32>
    %0:5 = scf.while (%arg1 = %cst, %arg2 = %arg0, %arg3 = %cst_0, %arg4 = %cst_0, %arg5 = %cst) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
      %1 = arith.cmpi slt, %arg1, %cst_1 : tensor<i32>
      %extracted = tensor.extract %1[] : tensor<i1>
      scf.condition(%extracted) %arg1, %arg2, %arg3, %arg4, %arg5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
    } do {
    ^bb0(%arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<i32>, %arg5: tensor<i32>):
      %1 = arith.addi %arg1, %arg2 : tensor<i32>
      %2 = arith.addi %arg3, %arg4 : tensor<i32>
      scf.yield %1, %arg2, %2, %2, %arg5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
    }
    return %0#0, %0#1, %0#2, %0#3, %0#4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  }
  func.func @while_loop_invariant_argument_different_order(%arg0: tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
    %cst = arith.constant dense<0> : tensor<i32>
    %cst_0 = arith.constant dense<1> : tensor<i32>
    %cst_1 = arith.constant dense<42> : tensor<i32>
    %0:6 = scf.while (%arg1 = %cst, %arg2 = %cst_0, %arg3 = %cst_0, %arg4 = %cst_0, %arg5 = %cst) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
      %1 = arith.cmpi slt, %arg1, %arg0 : tensor<i32>
      %extracted = tensor.extract %1[] : tensor<i1>
      scf.condition(%extracted) %arg2, %arg1, %arg3, %arg1, %arg4, %arg5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
    } do {
    ^bb0(%arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<i32>, %arg5: tensor<i32>, %arg6: tensor<i32>):
      %1 = arith.addi %arg1, %cst_0 : tensor<i32>
      %2 = arith.addi %arg3, %arg4 : tensor<i32>
      scf.yield %arg4, %arg2, %2, %2, %arg5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
    }
    return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  }
}

// -----
module {
  func.func @while_unused_result() -> i32 {
    %0:2 = scf.while : () -> (i32, i64) {
      %1 = "test.condition"() : () -> i1
      %2 = "test.get_some_value"() : () -> i32
      %3 = "test.get_some_value"() : () -> i64
      scf.condition(%1) %2, %3 : i32, i64
    } do {
    ^bb0(%arg0: i32, %arg1: i64):
      "test.use"(%arg0) : (i32) -> ()
      scf.yield
    }
    return %0#0 : i32
  }
}

// -----
module {
  func.func @while_cmp_lhs(%arg0: i32) {
    %0 = scf.while : () -> i32 {
      %1 = "test.val"() : () -> i32
      %2 = arith.cmpi ne, %1, %arg0 : i32
      scf.condition(%2) %1 : i32
    } do {
    ^bb0(%arg1: i32):
      %1 = arith.cmpi ne, %arg1, %arg0 : i32
      %2 = arith.cmpi eq, %arg1, %arg0 : i32
      "test.use"(%1, %2, %arg1) : (i1, i1, i32) -> ()
      scf.yield
    }
    return
  }
}

// -----
module {
  func.func @while_cmp_rhs(%arg0: i32) {
    %0 = scf.while : () -> i32 {
      %1 = "test.val"() : () -> i32
      %2 = arith.cmpi ne, %arg0, %1 : i32
      scf.condition(%2) %1 : i32
    } do {
    ^bb0(%arg1: i32):
      %1 = arith.cmpi ne, %arg0, %arg1 : i32
      %2 = arith.cmpi eq, %arg0, %arg1 : i32
      "test.use"(%1, %2, %arg1) : (i1, i1, i32) -> ()
      scf.yield
    }
    return
  }
}

// -----
module {
  func.func @while_duplicated_res() -> (i32, i32) {
    %0:2 = scf.while : () -> (i32, i32) {
      %1 = "test.val"() : () -> i32
      %2 = "test.condition"() : () -> i1
      scf.condition(%2) %1, %1 : i32, i32
    } do {
    ^bb0(%arg0: i32, %arg1: i32):
      "test.use"(%arg0, %arg1) : (i32, i32) -> ()
      scf.yield
    }
    return %0#0, %0#1 : i32, i32
  }
}

// -----
module {
  func.func @while_unused_arg1(%arg0: i32, %arg1: f64) -> i32 {
    %0 = scf.while (%arg2 = %arg0, %arg3 = %arg1) : (i32, f64) -> i32 {
      %1 = "test.condition"(%arg2) : (i32) -> i1
      scf.condition(%1) %arg2 : i32
    } do {
    ^bb0(%arg2: i32):
      %1 = "test.use"(%arg2) : (i32) -> i32
      scf.yield %1, %arg1 : i32, f64
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @while_unused_arg2(%arg0: i32) -> i32 {
    %0 = scf.while (%arg1 = %arg0) : (i32) -> i32 {
      %1 = "test.val"() : () -> i32
      %2 = "test.condition"() : () -> i1
      scf.condition(%2) %1 : i32
    } do {
    ^bb0(%arg1: i32):
      "test.use"(%arg1) : (i32) -> ()
      %1 = "test.val1"() : () -> i32
      scf.yield %1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @test_align_args() -> (i64, f32, i32) {
    %0 = "test.test"() : () -> f32
    %1 = "test.test"() : () -> i32
    %2 = "test.test"() : () -> i64
    %3:3 = scf.while (%arg0 = %0, %arg1 = %1, %arg2 = %2) : (f32, i32, i64) -> (i64, f32, i32) {
      %4 = "test.test"() : () -> i1
      scf.condition(%4) %arg2, %arg0, %arg1 : i64, f32, i32
    } do {
    ^bb0(%arg0: i64, %arg1: f32, %arg2: i32):
      %4 = "test.test"(%arg0) : (i64) -> f32
      %5 = "test.test"(%arg1) : (f32) -> i32
      %6 = "test.test"(%arg2) : (i32) -> i64
      scf.yield %4, %5, %6 : f32, i32, i64
    }
    return %3#0, %3#1, %3#2 : i64, f32, i32
  }
}

// -----
module {
  func.func @combineIfs(%arg0: i1, %arg1: i64) -> (i32, i32) {
    %0 = scf.if %arg0 -> (i32) {
      %2 = "test.firstCodeTrue"() : () -> i32
      scf.yield %2 : i32
    } else {
      %2 = "test.firstCodeFalse"() : () -> i32
      scf.yield %2 : i32
    }
    %1 = scf.if %arg0 -> (i32) {
      %2 = "test.secondCodeTrue"() : () -> i32
      scf.yield %2 : i32
    } else {
      %2 = "test.secondCodeFalse"() : () -> i32
      scf.yield %2 : i32
    }
    return %0, %1 : i32, i32
  }
}

// -----
module {
  func.func @combineIfs2(%arg0: i1, %arg1: i64) -> i32 {
    scf.if %arg0 {
      "test.firstCodeTrue"() : () -> ()
    }
    %0 = scf.if %arg0 -> (i32) {
      %1 = "test.secondCodeTrue"() : () -> i32
      scf.yield %1 : i32
    } else {
      %1 = "test.secondCodeFalse"() : () -> i32
      scf.yield %1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @combineIfs3(%arg0: i1, %arg1: i64) -> i32 {
    %0 = scf.if %arg0 -> (i32) {
      %1 = "test.firstCodeTrue"() : () -> i32
      scf.yield %1 : i32
    } else {
      %1 = "test.firstCodeFalse"() : () -> i32
      scf.yield %1 : i32
    }
    scf.if %arg0 {
      "test.secondCodeTrue"() : () -> ()
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @combineIfs4(%arg0: i1, %arg1: i64) {
    scf.if %arg0 {
      "test.firstCodeTrue"() : () -> ()
    }
    scf.if %arg0 {
      "test.secondCodeTrue"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @combineIfsUsed(%arg0: i1, %arg1: i64) -> (i32, i32) {
    %0 = scf.if %arg0 -> (i32) {
      %2 = "test.firstCodeTrue"() : () -> i32
      scf.yield %2 : i32
    } else {
      %2 = "test.firstCodeFalse"() : () -> i32
      scf.yield %2 : i32
    }
    %1 = scf.if %arg0 -> (i32) {
      %2 = "test.secondCodeTrue"(%0) : (i32) -> i32
      scf.yield %2 : i32
    } else {
      %2 = "test.secondCodeFalse"(%0) : (i32) -> i32
      scf.yield %2 : i32
    }
    return %0, %1 : i32, i32
  }
}

// -----
module {
  func.func @combineIfsNot(%arg0: i1, %arg1: i64) {
    %true = arith.constant true
    %0 = arith.xori %arg0, %true : i1
    scf.if %arg0 {
      "test.firstCodeTrue"() : () -> ()
    }
    scf.if %0 {
      "test.secondCodeTrue"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @combineIfsNot2(%arg0: i1, %arg1: i64) {
    %true = arith.constant true
    %0 = arith.xori %arg0, %true : i1
    scf.if %0 {
      "test.firstCodeTrue"() : () -> ()
    }
    scf.if %arg0 {
      "test.secondCodeTrue"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @propagate_into_execute_region() {
    %false = arith.constant false
    affine.for %arg0 = 0 to 100 {
      "test.foo"() : () -> ()
      %0 = scf.execute_region -> i64 {
        cf.cond_br %false, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        %c1_i64 = arith.constant 1 : i64
        cf.br ^bb3(%c1_i64 : i64)
      ^bb2:  // pred: ^bb0
        %c2_i64 = arith.constant 2 : i64
        cf.br ^bb3(%c2_i64 : i64)
      ^bb3(%1: i64):  // 2 preds: ^bb1, ^bb2
        scf.yield %1 : i64
      }
      "test.bar"(%0) : (i64) -> ()
    }
    return
  }
}

// -----
module {
  func.func @execute_region_inline() {
    affine.for %arg0 = 0 to 100 {
      "test.foo"() : () -> ()
      %0 = scf.execute_region -> i64 {
        %1 = "test.val"() : () -> i64
        scf.yield %1 : i64
      }
      "test.bar"(%0) : (i64) -> ()
    }
    return
  }
}

// -----
module {
  func.func @execute_region_no_inline() {
    affine.for %arg0 = 0 to 100 {
      "test.foo"() : () -> ()
      %0 = scf.execute_region -> i64 no_inline {
        %1 = "test.val"() : () -> i64
        scf.yield %1 : i64
      }
      "test.bar"(%0) : (i64) -> ()
    }
    return
  }
}

// -----
module {
  func.func @execute_region_under_func_no_inline() {
    "test.foo"() : () -> ()
    %0 = scf.execute_region -> i64 no_inline {
      %1 = "test.val"() : () -> i64
      scf.yield %1 : i64
    }
    "test.bar"(%0) : (i64) -> ()
    return
  }
}

// -----
module {
  func.func @func_execute_region_inline() {
    "test.foo"() : () -> ()
    %0 = scf.execute_region -> i64 {
      %1 = "test.cmp"() : () -> i1
      cf.cond_br %1, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %2 = "test.val1"() : () -> i64
      cf.br ^bb3(%2 : i64)
    ^bb2:  // pred: ^bb0
      %3 = "test.val2"() : () -> i64
      cf.br ^bb3(%3 : i64)
    ^bb3(%4: i64):  // 2 preds: ^bb1, ^bb2
      scf.yield %4 : i64
    }
    "test.bar"(%0) : (i64) -> ()
    return
  }
}

// -----
module {
  func.func @func_execute_region_inline_multi_yield() {
    "test.foo"() : () -> ()
    %0 = scf.execute_region -> i64 {
      %1 = "test.cmp"() : () -> i1
      cf.cond_br %1, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %2 = "test.val1"() : () -> i64
      scf.yield %2 : i64
    ^bb2:  // pred: ^bb0
      %3 = "test.val2"() : () -> i64
      scf.yield %3 : i64
    }
    "test.bar"(%0) : (i64) -> ()
    return
  }
}

// -----
module {
  func.func private @foo()
  func.func private @execute_region_yeilding_external_value() -> memref<1x60xui8> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>
    %0 = scf.execute_region -> memref<1x60xui8> no_inline {
      func.call @foo() : () -> ()
      scf.yield %alloc : memref<1x60xui8>
    }
    return %0 : memref<1x60xui8>
  }
}

// -----
module {
  func.func private @foo()
  func.func private @execute_region_yeilding_external_and_local_values() -> (memref<1x60xui8>, memref<1x120xui8>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>
    %0:2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {
      %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>
      func.call @foo() : () -> ()
      scf.yield %alloc, %alloc_0 : memref<1x60xui8>, memref<1x120xui8>
    }
    return %0#0, %0#1 : memref<1x60xui8>, memref<1x120xui8>
  }
}

// -----
module {
  func.func private @foo()
  func.func private @execute_region_multiple_yields_same_operands() -> (memref<1x60xui8>, memref<1x120xui8>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>
    %0:2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {
      %1 = "test.cmp"() : () -> i1
      cf.cond_br %1, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      func.call @foo() : () -> ()
      scf.yield %alloc, %alloc_0 : memref<1x60xui8>, memref<1x120xui8>
    ^bb2:  // pred: ^bb0
      func.call @foo() : () -> ()
      scf.yield %alloc, %alloc_0 : memref<1x60xui8>, memref<1x120xui8>
    }
    return %0#0, %0#1 : memref<1x60xui8>, memref<1x120xui8>
  }
}

// -----
module {
  func.func private @foo()
  func.func private @execute_region_multiple_yields_different_operands() -> (memref<1x60xui8>, memref<1x120xui8>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>
    %0:2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {
      %1 = "test.cmp"() : () -> i1
      cf.cond_br %1, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      func.call @foo() : () -> ()
      scf.yield %alloc, %alloc_0 : memref<1x60xui8>, memref<1x120xui8>
    ^bb2:  // pred: ^bb0
      func.call @foo() : () -> ()
      scf.yield %alloc, %alloc_1 : memref<1x60xui8>, memref<1x120xui8>
    }
    return %0#0, %0#1 : memref<1x60xui8>, memref<1x120xui8>
  }
}

// -----
module {
  func.func private @foo()
  func.func private @execute_region_multiple_yields_different_operands() -> memref<1x60xui8> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>
    %0 = scf.execute_region -> memref<1x60xui8> no_inline {
      %1 = "test.cmp"() : () -> i1
      cf.cond_br %1, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      func.call @foo() : () -> ()
      scf.yield %alloc : memref<1x60xui8>
    ^bb2:  // pred: ^bb0
      func.call @foo() : () -> ()
      scf.yield %alloc_0 : memref<1x60xui8>
    }
    return %0 : memref<1x60xui8>
  }
}

// -----
module {
  func.func @canonicalize_parallel_insert_slice_indices(%arg0: tensor<1x5xf32>, %arg1: tensor<?x?xf32>, %arg2: index) -> index {
    %c1 = arith.constant 1 : index
    %0 = scf.forall (%arg3) in (%arg2) shared_outs(%arg4 = %arg1) -> (tensor<?x?xf32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %arg0 into %arg4[%arg3, 0] [1, 5] [1, 1] : tensor<1x5xf32> into tensor<?x?xf32>
      }
    }
    %dim = tensor.dim %0, %c1 : tensor<?x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @forall_fold_control_operands(%arg0: tensor<?x10xf32>, %arg1: tensor<?x10xf32>) -> tensor<?x10xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x10xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x10xf32>
    %0 = scf.forall (%arg2, %arg3) in (%dim, %dim_0) shared_outs(%arg4 = %arg1) -> (tensor<?x10xf32>) {
      %extracted_slice = tensor.extract_slice %arg1[%arg2, %arg3] [1, 1] [1, 1] : tensor<?x10xf32> to tensor<1x1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg4[%arg2, %arg3] [1, 1] [1, 1] : tensor<1x1xf32> into tensor<?x10xf32>
      }
    }
    return %0 : tensor<?x10xf32>
  }
}

// -----
module {
  func.func @inline_forall_loop(%arg0: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<8x8xf32>
    %1 = scf.forall (%arg1, %arg2) = (%c0, %c0) to (%c1, %c1) step (%c8, %c8) shared_outs(%arg3 = %0) -> (tensor<8x8xf32>) {
      %extracted_slice = tensor.extract_slice %arg3[%arg1, %arg2] [2, 3] [1, 1] : tensor<8x8xf32> to tensor<2x3xf32>
      %2 = linalg.fill ins(%cst : f32) outs(%extracted_slice : tensor<2x3xf32>) -> tensor<2x3xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg3[%arg1, %arg2] [2, 3] [1, 1] : tensor<2x3xf32> into tensor<8x8xf32>
      }
    }
    return %1 : tensor<8x8xf32>
  }
}

// -----
module {
  func.func @do_not_inline_distributed_forall_loop(%arg0: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<8x8xf32>
    %1 = scf.forall (%arg1, %arg2) = (0, 4) to (1, 5) step (8, 8) shared_outs(%arg3 = %0) -> (tensor<8x8xf32>) {
      %extracted_slice = tensor.extract_slice %arg3[%arg1, %arg2] [2, 3] [1, 1] : tensor<8x8xf32> to tensor<2x3xf32>
      %2 = linalg.fill ins(%cst : f32) outs(%extracted_slice : tensor<2x3xf32>) -> tensor<2x3xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg3[%arg1, %arg2] [2, 3] [1, 1] : tensor<2x3xf32> into tensor<8x8xf32>
      }
    } {mapping = [#gpu.thread<y>, #gpu.thread<x>]}
    return %1 : tensor<8x8xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @inline_empty_loop_with_empty_mapping(%arg0: tensor<16xf32>) -> tensor<16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<16xf32>
    %1 = scf.forall () in () shared_outs(%arg1 = %0) -> (tensor<16xf32>) {
      %extracted_slice = tensor.extract_slice %arg1[0] [16] [1] : tensor<16xf32> to tensor<16xf32>
      %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%extracted_slice : tensor<16xf32>) outs(%0 : tensor<16xf32>) {
      ^bb0(%in: f32, %out: f32):
        %3 = arith.addf %in, %in : f32
        linalg.yield %3 : f32
      } -> tensor<16xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg1[0] [16] [1] : tensor<16xf32> into tensor<16xf32>
      }
    } {mapping = []}
    return %1 : tensor<16xf32>
  }
}

// -----
module {
  func.func @collapse_one_dim_parallel(%arg0: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<8x8xf32>
    %1 = scf.forall (%arg1, %arg2) = (0, %c0) to (1, %c16) step (8, %c8) shared_outs(%arg3 = %0) -> (tensor<8x8xf32>) {
      %2 = linalg.fill ins(%cst : f32) outs(%arg3 : tensor<8x8xf32>) -> tensor<8x8xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg3[%arg1, %arg2] [8, 8] [1, 1] : tensor<8x8xf32> into tensor<8x8xf32>
      }
    }
    return %1 : tensor<8x8xf32>
  }
}

// -----
module {
  func.func @remove_empty_forall(%arg0: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<8x8xf32>
    %1 = scf.forall (%arg1, %arg2) = (%c0, %c16) to (%c1, %c16) step (%c8, %c8) shared_outs(%arg3 = %0) -> (tensor<8x8xf32>) {
      %2 = linalg.fill ins(%cst : f32) outs(%arg3 : tensor<8x8xf32>) -> tensor<8x8xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg3[%arg1, %arg2] [8, 8] [1, 1] : tensor<8x8xf32> into tensor<8x8xf32>
      }
    }
    return %1 : tensor<8x8xf32>
  }
}

// -----
module {
  func.func @fold_tensor_cast_into_forall(%arg0: tensor<2xi32>, %arg1: tensor<2xi32>) -> tensor<2xi32> {
    %cst = arith.constant dense<100500> : tensor<1xi32>
    %cast = tensor.cast %arg1 : tensor<2xi32> to tensor<?xi32>
    %0 = scf.forall (%arg2) in (2) shared_outs(%arg3 = %cast) -> (tensor<?xi32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %cst into %arg3[%arg2] [1] [1] : tensor<1xi32> into tensor<?xi32>
      }
    }
    %cast_0 = tensor.cast %0 : tensor<?xi32> to tensor<2xi32>
    return %cast_0 : tensor<2xi32>
  }
}

// -----
module {
  func.func @do_not_fold_tensor_cast_from_dynamic_to_static_type_into_forall(%arg0: tensor<?xi32>, %arg1: tensor<?xi32>) -> tensor<?xi32> {
    %cst = arith.constant dense<100500> : tensor<1xi32>
    %cast = tensor.cast %arg1 : tensor<?xi32> to tensor<2xi32>
    %0 = scf.forall (%arg2) in (2) shared_outs(%arg3 = %cast) -> (tensor<2xi32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %cst into %arg3[%arg2] [1] [1] : tensor<1xi32> into tensor<2xi32>
      }
    }
    %cast_0 = tensor.cast %0 : tensor<2xi32> to tensor<?xi32>
    return %cast_0 : tensor<?xi32>
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fold_iter_args_not_being_modified_within_scfforall(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 4.200000e+01 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2:2 = scf.forall (%arg3) in (%1) shared_outs(%arg4 = %arg1, %arg5 = %arg2) -> (tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.apply #map1(%arg3)[%arg0]
      %4 = affine.min #map2(%arg3)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg4[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg5[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice : tensor<?xf32>) outs(%extracted_slice_0 : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg5[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2#0, %2#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fold_iter_args_with_no_use_of_result_scfforall(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2:3 = scf.forall (%arg4) in (%1) shared_outs(%arg5 = %arg1, %arg6 = %arg2, %arg7 = %arg3) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.apply #map1(%arg4)[%arg0]
      %4 = affine.min #map2(%arg4)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg5[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg7[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_2 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice : tensor<?xf32>) outs(%extracted_slice_1 : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %extracted_slice into %arg5[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %extracted_slice_0 into %arg7[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %5 into %arg7[%4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2#1 : tensor<?xf32>
  }
}

// -----
module {
  func.func @index_switch_fold() -> (f32, f32) {
    %c1 = arith.constant 1 : index
    %0 = scf.index_switch %c1 -> f32 
    case 1 {
      %cst = arith.constant 1.000000e+00 : f32
      scf.yield %cst : f32
    }
    default {
      %cst = arith.constant 4.200000e+01 : f32
      scf.yield %cst : f32
    }
    %c2 = arith.constant 2 : index
    %1 = scf.index_switch %c2 -> f32 
    case 0 {
      %cst = arith.constant 0.000000e+00 : f32
      scf.yield %cst : f32
    }
    default {
      %cst = arith.constant 4.200000e+01 : f32
      scf.yield %cst : f32
    }
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @index_switch_fold_no_res() {
    %c1 = arith.constant 1 : index
    scf.index_switch %c1 
    case 0 {
      scf.yield
    }
    default {
      "test.op"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @scf_for_all_step_size_0() {
    %c0 = arith.constant 0 : index
    scf.forall (%arg0, %arg1) = (0, 4) to (1, 5) step (%c0, 8) {
      vector.print %c0 : index
    }
    return
  }
}

// -----
module {
  func.func @dead_index_switch_result(%arg0: index, %arg1: memref<i32>) -> index {
    %0:2 = scf.index_switch %arg0 -> i32, index 
    case 1 {
      %c10_i32 = arith.constant 10 : i32
      memref.store %c10_i32, %arg1[] : memref<i32>
      scf.yield %c10_i32, %arg0 : i32, index
    }
    default {
      %c11_i32 = arith.constant 11 : i32
      memref.store %c11_i32, %arg1[] : memref<i32>
      scf.yield %c11_i32, %arg0 : i32, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func private @side_effect()
  func.func @iter_args_cycles(%arg0: index, %arg1: index, %arg2: index, %arg3: i32, %arg4: i64, %arg5: f32) -> (i32, i64, i32, i64, i64, f32) {
    %0:6 = scf.for %arg6 = %arg0 to %arg1 step %arg2 iter_args(%arg7 = %arg3, %arg8 = %arg4, %arg9 = %arg3, %arg10 = %arg4, %arg11 = %arg4, %arg12 = %arg5) -> (i32, i64, i32, i64, i64, f32) {
      func.call @side_effect() : () -> ()
      scf.yield %arg9, %arg11, %arg7, %arg8, %arg10, %arg12 : i32, i64, i32, i64, i64, f32
    }
    return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : i32, i64, i32, i64, i64, f32
  }
}

// -----
module {
  func.func private @side_effect(i32)
  func.func @iter_args_cycles_non_cycle_start(%arg0: index, %arg1: index, %arg2: index, %arg3: i32, %arg4: i32) -> (i32, i32, i32) {
    %0:3 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3, %arg7 = %arg4, %arg8 = %arg4) -> (i32, i32, i32) {
      func.call @side_effect(%arg6) : (i32) -> ()
      scf.yield %arg7, %arg8, %arg7 : i32, i32, i32
    }
    return %0#0, %0#1, %0#2 : i32, i32, i32
  }
}

