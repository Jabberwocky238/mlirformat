module {
  func.func @constant() -> index {
    %0 = test.with_bounds {smax = 3 : index, smin = 3 : index, umax = 3 : index, umin = 3 : index} : index
    return %0 : index
  }
  func.func @increment() -> index {
    %0 = test.with_bounds {smax = 9223372036854775807 : index, smin = 0 : index, umax = 3 : index, umin = 3 : index} : index
    %1 = test.increment %0 : index
    return %1 : index
  }
  func.func @maybe_increment(%arg0: i1) -> index {
    %0 = test.with_bounds {smax = 3 : index, smin = 3 : index, umax = 3 : index, umin = 3 : index} : index
    %1 = scf.if %arg0 -> (index) {
      scf.yield %0 : index
    } else {
      %3 = test.increment %0 : index
      scf.yield %3 : index
    }
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @maybe_increment_br(%arg0: i1) -> index {
    %0 = test.with_bounds {smax = 3 : index, smin = 3 : index, umax = 3 : index, umin = 3 : index} : index
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = test.increment %0 : index
    cf.br ^bb3(%1 : index)
  ^bb2:  // pred: ^bb0
    cf.br ^bb3(%0 : index)
  ^bb3(%2: index):  // 2 preds: ^bb1, ^bb2
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @for_bounds() -> index {
    %0 = test.with_bounds {smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 1 : index, smin = 1 : index, umax = 1 : index, umin = 1 : index} : index
    %2 = test.with_bounds {smax = 2 : index, smin = 2 : index, umax = 2 : index, umin = 2 : index} : index
    %3 = scf.for %arg0 = %0 to %2 step %1 iter_args(%arg1 = %0) -> (index) {
      scf.yield %arg0 : index
    }
    %4 = test.reflect_bounds %3 : index
    return %4 : index
  }
  func.func @no_analysis_of_loop_variants() -> index {
    %0 = test.with_bounds {smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index} : index
    %1 = test.with_bounds {smax = 1 : index, smin = 1 : index, umax = 1 : index, umin = 1 : index} : index
    %2 = test.with_bounds {smax = 2 : index, smin = 2 : index, umax = 2 : index, umin = 2 : index} : index
    %3 = scf.for %arg0 = %0 to %2 step %1 iter_args(%arg1 = %0) -> (index) {
      %5 = test.increment %arg1 : index
      scf.yield %5 : index
    }
    %4 = test.reflect_bounds %3 : index
    return %4 : index
  }
  func.func @region_args() {
    test.with_bounds_region {smax = 4 : index, smin = 3 : index, umax = 4 : index, umin = 3 : index} %arg0: index {
      %0 = test.reflect_bounds %arg0 : index
    }
    return
  }
  func.func @func_args_unbound(%arg0: index) -> index {
    %0 = test.reflect_bounds %arg0 : index
    return %0 : index
  }
  func.func @propagate_across_while_loop_false() -> index {
    %0 = test.with_bounds {smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index} : index
    %1 = scf.while : () -> index {
      %false = arith.constant false
      scf.condition(%false) %0 : index
    } do {
    ^bb0(%arg0: index):
      scf.yield
    }
    %2 = test.increment %1 : index
    return %2 : index
  }
  func.func @propagate_across_while_loop(%arg0: i1) -> index {
    %0 = test.with_bounds {smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index} : index
    %1 = scf.while : () -> index {
      scf.condition(%arg0) %0 : index
    } do {
    ^bb0(%arg1: index):
      scf.yield
    }
    %2 = test.increment %1 : index
    return %2 : index
  }
  func.func @dont_propagate_across_infinite_loop() -> index {
    %0 = test.with_bounds {smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index} : index
    %1 = scf.while : () -> index {
      %true = arith.constant true
      scf.condition(%true) %0 : index
    } do {
    ^bb0(%arg0: index):
      scf.yield
    }
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @propagate_from_block_to_iterarg(%arg0: index, %arg1: i1) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.if %arg1 -> (index) {
      %1 = scf.if %arg1 -> (index) {
        scf.yield %arg0 : index
      } else {
        scf.yield %arg0 : index
      }
      scf.yield %1 : index
    } else {
      scf.yield %c1 : index
    }
    scf.for %arg2 = %c0 to %arg0 step %c1 {
      scf.if %arg1 {
        %1 = arith.subi %0, %c1 : index
        %2 = arith.muli %0, %1 : index
        %3 = arith.addi %2, %c1 : index
        scf.for %arg3 = %c0 to %3 step %c1 {
          %4 = arith.cmpi uge, %arg3, %c1 : index
          scf.if %4 {
            "test.foo"() : () -> ()
          }
        }
      }
    }
    return
  }
  func.func @multiple_loop_ivs(%arg0: memref<?x64xi32>) {
    %0 = test.with_bounds {smax = 32 : index, smin = 1 : index, umax = 32 : index, umin = 1 : index} : index
    %c0_i32 = arith.constant 0 : i32
    scf.forall (%arg1, %arg2) in (%0, 64) {
      %1 = test.reflect_bounds %arg1 : index
      %2 = test.reflect_bounds %arg2 : index
      memref.store %c0_i32, %arg0[%1, %2] : memref<?x64xi32>
    }
    return
  }
}

