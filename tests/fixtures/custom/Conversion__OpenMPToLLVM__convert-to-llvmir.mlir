module {
  func.func private @foo(index, index)
  func.func @critical_block_arg() {
    omp.critical {
    ^bb0(%arg0: index, %arg1: index):
      func.call @foo(%arg0, %arg1) : (index, index) -> ()
      omp.terminator
    }
    return
  }
}

// -----
module {
  omp.critical.declare @mutex hint(contended, speculative)
  func.func @critical_declare() {
    omp.critical(@mutex) {
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @master_block_arg() {
    omp.master {
    ^bb0(%arg0: index, %arg1: index):
      "test.payload"(%arg0, %arg1) : (index, index) -> ()
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @branch_loop() {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    omp.parallel {
      cf.br ^bb1(%c0, %c0_0 : index, index)
    ^bb1(%0: index, %1: index):  // 2 preds: ^bb0, ^bb2
      %2 = arith.cmpi slt, %0, %1 : index
      cf.cond_br %2, ^bb2(%c0_0, %c0_0 : index, index), ^bb3
    ^bb2(%3: index, %4: index):  // pred: ^bb1
      cf.br ^bb1(%3, %4 : index, index)
    ^bb3:  // pred: ^bb1
      omp.flush
      omp.barrier
      omp.taskwait
      omp.taskyield
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @wsloop(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    omp.parallel {
      omp.wsloop {
        omp.loop_nest (%arg6, %arg7) : index = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
          "test.payload"(%arg6, %arg7) : (index, index) -> ()
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @atomic_write(%arg0: !llvm.ptr) {
    %c1_i32 = arith.constant 1 : i32
    omp.atomic.write %arg0 = %c1_i32 memory_order(relaxed) : !llvm.ptr, i32
    return
  }
}

// -----
module {
  func.func @atomic_read(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.atomic.read %arg1 = %arg0 hint(contended) memory_order(acquire) : !llvm.ptr, !llvm.ptr, i32
    return
  }
}

// -----
module {
  func.func @atomic_update() {
    %0 = llvm.mlir.addressof @_QFsEc : !llvm.ptr
    omp.atomic.update %0 : !llvm.ptr {
    ^bb0(%arg0: i32):
      %c1_i32 = arith.constant 1 : i32
      %1 = arith.addi %arg0, %c1_i32 : i32
      omp.yield(%1 : i32)
    }
    return
  }
  llvm.mlir.global internal @_QFsEc() {addr_space = 0 : i32} : i32 {
    %c10_i32 = arith.constant 10 : i32
    llvm.return %c10_i32 : i32
  }
}

// -----
module {
  func.func @threadprivate(%arg0: !llvm.ptr) {
    %0 = omp.threadprivate %arg0 : !llvm.ptr -> !llvm.ptr
    return
  }
}

// -----
module {
  func.func @loop_nest_block_arg(%arg0: i32, %arg1: i32, %arg2: index) {
    omp.simd {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) inclusive step (%arg0) {
        cf.br ^bb1(%arg2 : index)
      ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
        %1 = arith.cmpi slt, %0, %arg2 : index
        cf.cond_br %1, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %2 = arith.addi %0, %arg2 : index
        cf.br ^bb1(%2 : index)
      ^bb3:  // pred: ^bb1
        omp.yield
      }
    }
    return
  }
}

// -----
module {
  func.func @task_depend(%arg0: !llvm.ptr) {
    omp.task depend(taskdependin -> %arg0 : !llvm.ptr) {
      omp.terminator
    }
    return
  }
}

// -----
module {
  llvm.func @_QPomp_target_data(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
    %2 = omp.map.info var_ptr(%arg2 : !llvm.ptr, i32) map_clauses(always, storage) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_enter_data map_entries(%0, %1, %2 : !llvm.ptr, !llvm.ptr, !llvm.ptr)
    %3 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %4 = omp.map.info var_ptr(%arg1 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %5 = omp.map.info var_ptr(%arg2 : !llvm.ptr, i32) map_clauses(storage) capture(ByRef) -> !llvm.ptr {name = ""}
    %6 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(always, delete) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_exit_data map_entries(%3, %4, %5, %6 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr)
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPomp_target_data_region(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<1024 x i32>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%0 : !llvm.ptr) {
      %1 = llvm.mlir.constant(10 : i32) : i32
      llvm.store %1, %arg1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPomp_target(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(64 : i32) : i32
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<1024 x i32>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %2 = omp.map.info var_ptr(%arg1 : !llvm.ptr, i32) map_clauses(implicit, storage) capture(ByCopy) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) thread_limit(%0 : i32) map_entries(%1 -> %arg2, %2 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      %3 = llvm.mlir.constant(10 : i32) : i32
      llvm.store %3, %arg3 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPsb() {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(10 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    omp.sections {
      omp.section {
        llvm.br ^bb1(%1 : i64)
      ^bb1(%3: i64):  // 2 preds: ^bb0, ^bb2
        %4 = llvm.icmp "sgt" %3, %0 : i64
        llvm.cond_br %4, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %5 = llvm.sub %3, %2 : i64
        llvm.br ^bb1(%5 : i64)
      ^bb3:  // pred: ^bb1
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @eqv_reduction : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.zext %0 : i1 to i32
    omp.yield(%1 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.mlir.constant(0 : i64) : i32
    %1 = llvm.icmp "ne" %arg0, %0 : i32
    %2 = llvm.icmp "ne" %arg1, %0 : i32
    %3 = llvm.icmp "eq" %1, %2 : i1
    %4 = llvm.zext %3 : i1 to i32
    omp.yield(%4 : i32)
  }
  llvm.func @_QPsimple_reduction(%arg0: !llvm.ptr {fir.bindc_name = "y"}) {
    %0 = llvm.mlir.constant(100 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(true) : i1
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "x", uniq_name = "_QFsimple_reductionEx"} : (i64) -> !llvm.ptr
    %5 = llvm.zext %2 : i1 to i32
    llvm.store %5, %4 : i32, !llvm.ptr
    omp.parallel {
      %6 = llvm.alloca %3 x i32 {adapt.valuebyref, in_type = i32, operandSegmentSizes = array<i32: 0, 0>, pinned} : (i64) -> !llvm.ptr
      omp.wsloop reduction(@eqv_reduction %4 -> %arg1 : !llvm.ptr) {
        omp.loop_nest (%arg2) : i32 = (%1) to (%0) inclusive step (%1) {
          llvm.store %arg2, %6 : i32, !llvm.ptr
          %7 = llvm.load %6 : !llvm.ptr -> i32
          %8 = llvm.sext %7 : i32 to i64
          %9 = llvm.sub %8, %3 : i64
          %10 = llvm.getelementptr %arg0[0, %9] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<100 x i32>
          %11 = llvm.load %10 : !llvm.ptr -> i32
          %12 = llvm.load %arg1 : !llvm.ptr -> i32
          %13 = llvm.icmp "eq" %11, %12 : i32
          %14 = llvm.zext %13 : i1 to i32
          llvm.store %14, %arg1 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(5 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 : (i64) -> !llvm.ptr
    omp.taskgroup {
      %5 = llvm.trunc %2 : i64 to i32
      llvm.br ^bb1(%5, %1 : i32, i64)
    ^bb1(%6: i32, %7: i64):  // 2 preds: ^bb0, ^bb2
      %8 = llvm.icmp "sgt" %7, %0 : i64
      llvm.cond_br %8, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      llvm.store %6, %4 : i32, !llvm.ptr
      omp.task {
        llvm.call @_QFPdo_work(%4) : (!llvm.ptr) -> ()
        omp.terminator
      }
      %9 = llvm.load %4 : !llvm.ptr -> i32
      %10 = llvm.add %9, %5 : i32
      %11 = llvm.sub %7, %2 : i64
      llvm.br ^bb1(%10, %11 : i32, i64)
    ^bb3:  // pred: ^bb1
      llvm.store %6, %4 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.func @_QFPdo_work(%arg0: !llvm.ptr {fir.bindc_name = "i"}) {
    llvm.return
  }
}

// -----
module {
  llvm.func @sub_() {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFsubEi"} : (i64) -> !llvm.ptr
    omp.ordered.region {
      %4 = llvm.trunc %1 : i64 to i32
      llvm.br ^bb1(%4, %1 : i32, i64)
    ^bb1(%5: i32, %6: i64):  // 2 preds: ^bb0, ^bb2
      %7 = llvm.icmp "sgt" %6, %0 : i64
      llvm.cond_br %7, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      llvm.store %5, %3 : i32, !llvm.ptr
      %8 = llvm.load %3 : !llvm.ptr -> i32
      %9 = arith.addi %8, %4 : i32
      %10 = arith.subi %6, %1 : i64
      llvm.br ^bb1(%9, %10 : i32, i64)
    ^bb3:  // pred: ^bb1
      llvm.store %5, %3 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPtarget_map_with_bounds(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%0 : i64) stride(%3 : i64) start_idx(%3 : i64)
    %5 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%4) -> !llvm.ptr {name = ""}
    %6 = llvm.mlir.constant(4 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = omp.map.bounds lower_bound(%7 : i64) upper_bound(%6 : i64) stride(%9 : i64) start_idx(%9 : i64)
    %11 = omp.map.info var_ptr(%arg2 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%10) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%5 -> %arg3, %11 -> %arg4 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.private {type = private} @x.privatizer : memref<?xf32> init {
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    omp.yield(%arg0 : memref<?xf32>)
  }
}

// -----
module {
  omp.private {type = firstprivate} @y.privatizer : index copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  }
}

// -----
module {
  func.func @omp_cancel_cancellation_point() {
    omp.parallel {
      omp.cancel cancellation_construct_type(parallel)
      omp.cancellation_point cancellation_construct_type(parallel)
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @omp_distribute(%arg0: index) {
    omp.distribute dist_schedule_static dist_schedule_chunk_size(%arg0 : index) {
      omp.loop_nest (%arg1) : index = (%arg0) to (%arg0) step (%arg0) {
        omp.yield
      }
    }
    return
  }
}

// -----
module {
  func.func @omp_teams(%arg0: memref<i32>) {
    omp.teams allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) {
      omp.terminator
    }
    return
  }
}

// -----
module {
  func.func @omp_ordered(%arg0: index) {
    omp.wsloop ordered(1) {
      omp.loop_nest (%arg1) : index = (%arg0) to (%arg0) step (%arg0) {
        omp.ordered depend_vec(%arg0 : index) {doacross_num_loops = 1 : i64}
        omp.yield
      }
    }
    return
  }
}

// -----
module {
  func.func @omp_taskloop(%arg0: index, %arg1: memref<i32>) {
    omp.parallel {
      omp.taskloop.context allocate(%arg1 : memref<i32> -> %arg1 : memref<i32>) {
        omp.taskloop.wrapper {
          omp.loop_nest (%arg2) : index = (%arg0) to (%arg0) step (%arg0) {
            "test.payload"(%arg2) : (index) -> ()
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    return
  }
}

// -----
module {
  omp.declare_mapper @my_mapper : !llvm.struct<"_QFdeclare_mapperTmy_type", (i32)> {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"_QFdeclare_mapperTmy_type", (i32)>
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "var%data"}
    %3 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<"_QFdeclare_mapperTmy_type", (i32)>) map_clauses(tofrom) capture(ByRef) members(%2 : [0] : !llvm.ptr) -> !llvm.ptr {name = "var", partial_map = true}
    omp.declare_mapper.info map_entries(%3, %2 : !llvm.ptr, !llvm.ptr)
  }
  func.func @omp_dist_schedule(%arg0: i32) {
    %c1_i32 = arith.constant 1 : i32
    %c1024_i32 = arith.constant 1024 : i32
    %c16_i32 = arith.constant 16 : i32
    %c8_i32 = arith.constant 8 : i32
    omp.teams num_teams( to %c8_i32 : i32) thread_limit(%c16_i32 : i32) {
      omp.distribute dist_schedule_static dist_schedule_chunk_size(%c1024_i32 : i32) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%arg0) inclusive step (%c1_i32) {
          omp.terminator
        }
      }
      omp.terminator
    }
    return
  }
}

