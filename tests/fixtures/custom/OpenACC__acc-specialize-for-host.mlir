module {
  acc.private.recipe @privatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  }
  acc.firstprivate.recipe @firstprivatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  } copy {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %arg1[] : memref<i32>
    acc.terminator
  }
  acc.reduction.recipe @reduction_add_memref_i32 : memref<i32> reduction_operator <add> init {
  ^bb0(%arg0: memref<i32>):
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.yield %alloca : memref<i32>
  } combiner {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    %1 = memref.load %arg1[] : memref<i32>
    %2 = arith.addi %0, %1 : i32
    memref.store %2, %arg0[] : memref<i32>
    acc.yield %arg0 : memref<i32>
  }
  acc.routine @acc_routine_private func(@private) seq 
  func.func @private(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_private]>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.private varPtr(%arg0 : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_cache func(@cache) seq 
  func.func @cache(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_cache]>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.cache varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_atomic func(@orphan_atomic_update) seq 
  func.func @orphan_atomic_update(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic]>} {
    acc.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg1: i32):
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.addi %arg1, %c1_i32 : i32
      acc.yield %0 : i32
    }
    return
  }
  acc.routine @acc_routine_atomic_read func(@orphan_atomic_read) seq 
  func.func @orphan_atomic_read(%arg0: memref<i32>, %arg1: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_read]>} {
    acc.atomic.read %arg1 = %arg0 : memref<i32>, memref<i32>, i32
    return
  }
  acc.routine @acc_routine_atomic_write func(@orphan_atomic_write) seq 
  func.func @orphan_atomic_write(%arg0: memref<i32>, %arg1: i32) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_write]>} {
    acc.atomic.write %arg0 = %arg1 : memref<i32>, i32
    return
  }
  acc.routine @acc_routine_atomic_capture func(@orphan_atomic_capture) seq 
  func.func @orphan_atomic_capture(%arg0: memref<i32>, %arg1: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_capture]>} {
    %c1_i32 = arith.constant 1 : i32
    acc.atomic.capture {
      acc.atomic.read %arg1 = %arg0 : memref<i32>, memref<i32>, i32
      acc.atomic.update %arg0 : memref<i32> {
      ^bb0(%arg2: i32):
        %0 = arith.addi %arg2, %c1_i32 : i32
        acc.yield %0 : i32
      }
    }
    return
  }
  acc.routine @acc_routine_private_parallel func(@private_attached_to_parallel) seq 
  func.func @private_attached_to_parallel(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_private_parallel]>} {
    %0 = acc.private varPtr(%arg0 : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    acc.parallel private(%0 : memref<i32>) {
      %c1_i32 = arith.constant 1 : i32
      memref.store %c1_i32, %0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_atomic_parallel func(@atomic_inside_parallel) seq 
  func.func @atomic_inside_parallel(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_parallel]>} {
    acc.parallel {
      acc.atomic.update %arg0 : memref<i32> {
      ^bb0(%arg1: i32):
        %c1_i32 = arith.constant 1 : i32
        %0 = arith.addi %arg1, %c1_i32 : i32
        acc.yield %0 : i32
      }
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_loop_parallel func(@loop_inside_parallel) seq 
  func.func @loop_inside_parallel(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_loop_parallel]>} {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.parallel {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        %c5_i32 = arith.constant 5 : i32
        memref.store %c5_i32, %arg0[] : memref<i32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_private_loop func(@private_attached_to_loop) seq 
  func.func @private_attached_to_loop(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_private_loop]>} {
    %c0_i32 = arith.constant 0 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.private varPtr(%arg0 : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    acc.loop private(%0 : memref<i32>) control(%arg1 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
      %c1_i32_0 = arith.constant 1 : i32
      memref.store %c1_i32_0, %0[] : memref<i32>
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
    return
  }
  acc.routine @acc_routine_loop func(@orphan_loop) seq 
  func.func @orphan_loop(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_loop]>} {
    %c0_i32 = arith.constant 0 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    acc.loop control(%arg1 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
      memref.store %arg1, %arg0[] : memref<i32>
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
    return
  }
  acc.routine @acc_routine_nested_loop func(@nested_orphan_loop) seq 
  func.func @nested_orphan_loop(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_nested_loop]>} {
    %c0_i32 = arith.constant 0 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    acc.loop control(%arg1 : i32, %arg2 : i32) = (%c0_i32, %c0_i32 : i32, i32) to (%c10_i32, %c10_i32 : i32, i32)  step (%c1_i32, %c1_i32 : i32, i32) {
      %0 = arith.addi %arg1, %arg2 : i32
      memref.store %0, %arg0[] : memref<i32>
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true, true>, seq = [#acc.device_type<none>]}
    return
  }
  acc.routine @acc_routine_unstructured func(@orphan_unstructured_loop) seq 
  func.func @orphan_unstructured_loop(%arg0: memref<32xi32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_unstructured]>} {
    %c32_i32 = arith.constant 32 : i32
    %c2_i32 = arith.constant 2 : i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %alloca = memref.alloca() : memref<i32>
    %0 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    acc.loop private(%0 : memref<i32>) {
      %alloca_0 = memref.alloca() : memref<i32>
      memref.store %c32_i32, %alloca_0[] : memref<i32>
      memref.store %c1_i32, %0[] : memref<i32>
      cf.br ^bb1
    ^bb1:  // 2 preds: ^bb0, ^bb2
      %1 = memref.load %alloca_0[] : memref<i32>
      %2 = arith.cmpi sgt, %1, %c0_i32 : i32
      cf.cond_br %2, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      %3 = memref.load %0[] : memref<i32>
      %4 = arith.index_cast %3 : i32 to index
      %5 = memref.load %arg0[%4] : memref<32xi32>
      %6 = arith.divsi %5, %c2_i32 : i32
      memref.store %6, %arg0[%4] : memref<32xi32>
      %7 = arith.subi %1, %c1_i32 : i32
      memref.store %7, %alloca_0[] : memref<i32>
      %8 = arith.addi %3, %c1_i32 : i32
      memref.store %8, %0[] : memref<i32>
      cf.br ^bb1
    ^bb3:  // pred: ^bb1
      acc.yield
    } attributes {independent = [#acc.device_type<none>], unstructured}
    return
  }
  acc.routine @acc_routine_loop_reduction func(@orphan_loop_with_reduction) seq 
  func.func @orphan_loop_with_reduction(%arg0: memref<i32>, %arg1: memref<100xi32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_loop_reduction]>} {
    %c100_i32 = arith.constant 100 : i32
    %c1_i32 = arith.constant 1 : i32
    %alloca = memref.alloca() : memref<i32>
    %0 = acc.reduction varPtr(%arg0 : memref<i32>) recipe(@reduction_add_memref_i32) -> memref<i32>
    %1 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    acc.loop vector private(%1 : memref<i32>) reduction(%0 : memref<i32>) control(%arg2 : i32) = (%c1_i32 : i32) to (%c100_i32 : i32)  step (%c1_i32 : i32) {
      memref.store %arg2, %1[] : memref<i32>
      %2 = memref.load %1[] : memref<i32>
      %3 = arith.index_cast %2 : i32 to index
      %4 = memref.load %arg1[%3] : memref<100xi32>
      %5 = memref.load %arg0[] : memref<i32>
      %6 = arith.addi %5, %4 : i32
      memref.store %6, %arg0[] : memref<i32>
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    return
  }
  acc.routine @acc_routine_var_bounds func(@orphan_loop_variable_bounds) seq 
  func.func @orphan_loop_variable_bounds(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_var_bounds]>} {
    %c1_i32 = arith.constant 1 : i32
    %0 = memref.load %arg0[] : memref<i32>
    %1 = memref.load %arg1[] : memref<i32>
    acc.loop vector control(%arg3 : i32) = (%0 : i32) to (%1 : i32)  step (%c1_i32 : i32) {
      memref.store %arg3, %arg2[] : memref<i32>
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    return
  }
  acc.reduction.recipe @reduction_mul_memref_i32 : memref<i32> reduction_operator <mul> init {
  ^bb0(%arg0: memref<i32>):
    %c1_i32 = arith.constant 1 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c1_i32, %alloca[] : memref<i32>
    acc.yield %alloca : memref<i32>
  } combiner {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    %1 = memref.load %arg1[] : memref<i32>
    %2 = arith.muli %0, %1 : i32
    memref.store %2, %arg0[] : memref<i32>
    acc.yield %arg0 : memref<i32>
  }
  func.func @orphan_between_compute_regions(%arg0: memref<i32>, %arg1: memref<8xi32>, %arg2: memref<i32>) {
    %c2_i32 = arith.constant 2 : i32
    %c8_i32 = arith.constant 8 : i32
    %c1_i32 = arith.constant 1 : i32
    %alloca = memref.alloca() : memref<i32>
    acc.parallel combined(loop) {
      %3 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
      acc.loop combined(parallel) private(%3 : memref<i32>) control(%arg3 : i32) = (%c1_i32 : i32) to (%c8_i32 : i32)  step (%c1_i32 : i32) {
        memref.store %arg3, %3[] : memref<i32>
        %4 = arith.index_cast %arg3 : i32 to index
        memref.store %c1_i32, %arg1[%4] : memref<8xi32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
      acc.yield
    }
    %0 = acc.private varPtr(%arg2 : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    %1 = acc.reduction varPtr(%arg0 : memref<i32>) recipe(@reduction_mul_memref_i32) -> memref<i32>
    %2 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    acc.loop private(%0, %2 : memref<i32>, memref<i32>) reduction(%1 : memref<i32>) control(%arg3 : i32) = (%c1_i32 : i32) to (%c8_i32 : i32)  step (%c1_i32 : i32) {
      memref.store %arg3, %2[] : memref<i32>
      %3 = arith.index_cast %arg3 : i32 to index
      %4 = memref.load %arg1[%3] : memref<8xi32>
      memref.store %4, %0[] : memref<i32>
      %5 = memref.load %0[] : memref<i32>
      %6 = arith.muli %5, %c2_i32 : i32
      memref.store %6, %arg0[] : memref<i32>
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.parallel combined(loop) {
      %3 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
      acc.loop combined(parallel) private(%3 : memref<i32>) control(%arg3 : i32) = (%c1_i32 : i32) to (%c8_i32 : i32)  step (%c1_i32 : i32) {
        memref.store %arg3, %3[] : memref<i32>
        %4 = arith.index_cast %arg3 : i32 to index
        memref.store %arg3, %arg1[%4] : memref<8xi32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

