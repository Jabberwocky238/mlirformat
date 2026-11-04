module {
  func.func @simple_std_for_loop(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c1 = arith.constant 1 : index
    }
    return
  }
  func.func @unsigned_loop(%arg0: index, %arg1: index, %arg2: index) {
    scf.for unsigned %arg3 = %arg0 to %arg1 step %arg2 {
      %c1 = arith.constant 1 : index
    }
    return
  }
  func.func @simple_std_2_for_loops(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c1 = arith.constant 1 : index
      scf.for %arg4 = %arg0 to %arg1 step %arg2 {
        %c1_0 = arith.constant 1 : index
      }
    }
    return
  }
  func.func @simple_std_if(%arg0: i1) {
    scf.if %arg0 {
      %c1 = arith.constant 1 : index
    }
    return
  }
  func.func @simple_std_if_else(%arg0: i1) {
    scf.if %arg0 {
      %c1 = arith.constant 1 : index
    } else {
      %c1 = arith.constant 1 : index
    }
    return
  }
  func.func @simple_std_2_ifs(%arg0: i1) {
    scf.if %arg0 {
      %c1 = arith.constant 1 : index
      scf.if %arg0 {
        %c1_0 = arith.constant 1 : index
      } else {
        %c1_0 = arith.constant 1 : index
      }
    }
    return
  }
  func.func @simple_std_for_loop_with_2_ifs(%arg0: index, %arg1: index, %arg2: index, %arg3: i1) {
    scf.for %arg4 = %arg0 to %arg1 step %arg2 {
      %c1 = arith.constant 1 : index
      scf.if %arg3 {
        %c1_0 = arith.constant 1 : index
        scf.if %arg3 {
          %c1_1 = arith.constant 1 : index
        } else {
          %c1_1 = arith.constant 1 : index
        }
      }
    }
    return
  }
  func.func @simple_if_yield(%arg0: i1) -> (i1, i1) {
    %0:2 = scf.if %arg0 -> (i1, i1) {
      %false = arith.constant false
      %true = arith.constant true
      scf.yield %false, %true : i1, i1
    } else {
      %false = arith.constant false
      %true = arith.constant true
      scf.yield %true, %false : i1, i1
    }
    return %0#0, %0#1 : i1, i1
  }
  func.func @nested_if_yield(%arg0: i1) -> index {
    %0 = scf.if %arg0 -> (i1) {
      %true = arith.constant true
      scf.yield %true : i1
    } else {
      %false = arith.constant false
      scf.yield %false : i1
    }
    %1 = scf.if %0 -> (index) {
      %2 = scf.if %arg0 -> (index) {
        %c40 = arith.constant 40 : index
        scf.yield %c40 : index
      } else {
        %c41 = arith.constant 41 : index
        scf.yield %c41 : index
      }
      scf.yield %2 : index
    } else {
      %c42 = arith.constant 42 : index
      scf.yield %c42 : index
    }
    return %1 : index
  }
  func.func @parallel_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c1 = arith.constant 1 : index
    scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) {
      %c1_0 = arith.constant 1 : index
      scf.reduce 
    }
    return
  }
  func.func @for_yield(%arg0: index, %arg1: index, %arg2: index) -> (f32, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst, %arg5 = %cst_0) -> (f32, f32) {
      %1 = arith.addf %arg4, %arg5 : f32
      scf.yield %1, %1 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
  func.func @nested_for_yield(%arg0: index, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst) -> (f32) {
      %1 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg4) -> (f32) {
        %2 = arith.addf %arg6, %arg6 : f32
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func private @generate() -> i64
  func.func @simple_parallel_reduce_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: f32) -> f32 {
    %0 = scf.parallel (%arg4) = (%arg0) to (%arg1) step (%arg2) init (%arg3) -> f32 {
      %cst = arith.constant 4.200000e+01 : f32
      scf.reduce(%cst : f32) {
      ^bb0(%arg5: f32, %arg6: f32):
        %1 = arith.mulf %arg5, %arg6 : f32
        scf.reduce.return %1 : f32
      }
    }
    return %0 : f32
  }
  func.func @parallel_reduce_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: f32) -> (f32, i64) {
    %c1 = arith.constant 1 : index
    %c42_i64 = arith.constant 42 : i64
    %0:2 = scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) init (%arg5, %c42_i64) -> (f32, i64) {
      %cst = arith.constant 4.200000e+01 : f32
      %1 = func.call @generate() : () -> i64
      scf.reduce(%cst, %1 : f32, i64) {
      ^bb0(%arg8: f32, %arg9: f32):
        %2 = arith.addf %arg8, %arg9 : f32
        scf.reduce.return %2 : f32
      }, {
      ^bb0(%arg8: i64, %arg9: i64):
        %2 = arith.ori %arg8, %arg9 : i64
        scf.reduce.return %2 : i64
      }
    }
    return %0#0, %0#1 : f32, i64
  }
  func.func @unknown_op_inside_loop(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      "unknown.op"() : () -> ()
    }
    return
  }
  func.func @minimal_while() {
    %0 = "test.make_condition"() : () -> i1
    scf.while : () -> () {
      scf.condition(%0)
    } do {
      "test.some_payload"() : () -> ()
      scf.yield
    }
    return
  }
  func.func @do_while(%arg0: f32) {
    %0 = scf.while (%arg1 = %arg0) : (f32) -> f32 {
      %1 = "test.make_condition"() : () -> i1
      scf.condition(%1) %arg1 : f32
    } do {
    ^bb0(%arg1: f32):
      scf.yield %arg1 : f32
    }
    return
  }
  func.func @while_values(%arg0: i32, %arg1: f32) {
    %0 = "test.make_condition"() : () -> i1
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %1:2 = scf.while (%arg2 = %arg0, %arg3 = %arg1) : (i32, f32) -> (i64, f64) {
      %2 = arith.extui %arg0 : i32 to i64
      %3 = arith.extf %arg3 : f32 to f64
      scf.condition(%0) %2, %3 : i64, f64
    } do {
    ^bb0(%arg2: i64, %arg3: f64):
      scf.yield %c0_i32, %cst : i32, f32
    }
    return
  }
  func.func @nested_while_ops(%arg0: f32) -> i64 {
    %0 = scf.while (%arg1 = %arg0) : (f32) -> i64 {
      %1 = "test.outer_before_pre"() : () -> i1
      %2 = scf.while (%arg2 = %arg1) : (f32) -> i64 {
        %3:2 = "test.inner_before"(%arg2) : (f32) -> (i1, i64)
        scf.condition(%3#0) %3#1 : i64
      } do {
      ^bb0(%arg2: i64):
        %3 = "test.inner_after"(%arg2) : (i64) -> f32
        scf.yield %3 : f32
      }
      "test.outer_before_post"() : () -> ()
      scf.condition(%1) %2 : i64
    } do {
    ^bb0(%arg1: i64):
      "test.outer_after_pre"(%arg1) : (i64) -> ()
      %1 = scf.while (%arg2 = %arg1) : (i64) -> f32 {
        %2:2 = "test.inner2_before"(%arg2) : (i64) -> (i1, f32)
        scf.condition(%2#0) %2#1 : f32
      } do {
      ^bb0(%arg2: f32):
        %2 = "test.inner2_after"(%arg2) : (f32) -> i64
        scf.yield %2 : i64
      }
      "test.outer_after_post"() : () -> ()
      scf.yield %1 : f32
    }
    return %0 : i64
  }
  func.func @ifs_in_parallel(%arg0: index, %arg1: index, %arg2: index, %arg3: i1, %arg4: i1) {
    scf.parallel (%arg5) = (%arg0) to (%arg1) step (%arg2) {
      scf.if %arg3 {
        %0 = scf.if %arg4 -> (index) {
          %1 = "test.if2"() : () -> index
          scf.yield %1 : index
        } else {
          %1 = "test.else2"() : () -> index
          scf.yield %1 : index
        }
      }
      scf.reduce 
    }
    return
  }
  func.func @func_execute_region_elim_multi_yield() {
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
  func.func @index_switch(%arg0: index, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = scf.index_switch %arg0 -> i32 
    case 0 {
      scf.yield %arg1 : i32
    }
    case 1 {
      scf.yield %arg2 : i32
    }
    default {
      scf.yield %arg3 : i32
    }
    return %0 : i32
  }
  func.func @forall(%arg0: index) {
    scf.forall (%arg1) in (%arg0) {
      "test.foo"(%arg1) : (index) -> ()
    }
    return
  }
}

// -----
#loop_unroll = #llvm.loop_unroll<full = true>
#loop_unroll1 = #llvm.loop_unroll<disable = true>
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
#loop_annotation1 = #llvm.loop_annotation<unroll = #loop_unroll1>
module {
  func.func @simple_std_for_loops_annotation(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      scf.for %arg4 = %c0 to %c4 step %c1 {
        %c1_0 = arith.constant 1 : index
      } {llvm.loop_annotation = #loop_annotation}
    } {llvm.loop_annotation = #loop_annotation1}
    return
  }
}

// -----
#loop_unroll = #llvm.loop_unroll<disable = true>
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
module {
  func.func @simple_while_loops_annotation(%arg0: i1) {
    scf.while : () -> () {
      scf.condition(%arg0)
    } do {
      scf.yield
    } attributes {llvm.loop_annotation = #loop_annotation}
    return
  }
}

// -----
#loop_unroll = #llvm.loop_unroll<disable = true>
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
module {
  func.func @do_while_loops_annotation() {
    %c0_i32 = arith.constant 0 : i32
    %0 = scf.while (%arg0 = %c0_i32) : (i32) -> i32 {
      %1 = "test.make_condition"() : () -> i1
      scf.condition(%1) %c0_i32 : i32
    } do {
    ^bb0(%arg0: i32):
      scf.yield %c0_i32 : i32
    } attributes {llvm.loop_annotation = #loop_annotation}
    return
  }
}

