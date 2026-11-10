module {
}

// -----
module {
}

// -----
module {
  llvm.func @task_affinity_iterator_1d(%arg0: !llvm.ptr {llvm.nocapture}) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(4 : i64) : i64
    %2 = llvm.mlir.constant(6 : i64) : i64
    %3 = llvm.mlir.constant(4 : i64) : i64
    omp.parallel {
      omp.single {
        %4 = omp.iterator(%arg1: i64, %arg2: i64) = (%0 to %1 step %0, %0 to %2 step %0) {
          %5 = omp.affinity_entry %arg0, %3 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          omp.yield(%5 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
        } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        omp.task affinity(%4 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @task_affinity_iterator_3d(%arg0: !llvm.ptr {llvm.nocapture}) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.mlir.constant(4 : i64) : i64
    %3 = llvm.mlir.constant(6 : i64) : i64
    %4 = llvm.mlir.constant(4 : i64) : i64
    omp.parallel {
      omp.single {
        %5 = omp.iterator(%arg1: i64, %arg2: i64, %arg3: i64) = (%0 to %2 step %0, %0 to %3 step %0, %0 to %1 step %0) {
          %6 = omp.affinity_entry %arg0, %4 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          omp.yield(%6 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
        } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        omp.task affinity(%5 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @task_affinity_iterator_multiple(%arg0: !llvm.ptr {llvm.nocapture}) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(3 : i64) : i64
    %2 = llvm.mlir.constant(4 : i64) : i64
    %3 = llvm.mlir.constant(6 : i64) : i64
    %4 = llvm.mlir.constant(4 : i64) : i64
    omp.parallel {
      omp.single {
        %5 = omp.iterator(%arg1: i64, %arg2: i64) = (%0 to %2 step %0, %0 to %3 step %0) {
          %7 = omp.affinity_entry %arg0, %4 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          omp.yield(%7 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
        } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        %6 = omp.iterator(%arg1: i64) = (%0 to %1 step %0) {
          %7 = omp.affinity_entry %arg0, %4 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          omp.yield(%7 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
        } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        omp.task affinity(%5 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>, %6 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @task_affinity_iterator_dynamic_tripcount(%arg0: !llvm.ptr {llvm.nocapture}, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64) {
    omp.parallel {
      omp.single {
        %0 = omp.iterator(%arg5: i64) = (%arg1 to %arg2 step %arg3) {
          %1 = omp.affinity_entry %arg0, %arg4 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          omp.yield(%1 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
        } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        omp.task affinity(%0 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @task_affinity_iterator_negative_step(%arg0: !llvm.ptr {llvm.nocapture}) {
    %0 = llvm.mlir.constant(4 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(-1 : i64) : i64
    omp.parallel {
      omp.single {
        %3 = omp.iterator(%arg1: i64) = (%0 to %1 step %2) {
          %4 = omp.affinity_entry %arg0, %arg1 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          omp.yield(%4 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
        } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        omp.task affinity(%3 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
}

// -----
module {
  llvm.func @omp_task_depend_iterator_simple(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(10 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = omp.iterator(%arg1: i64) = (%0 to %1 step %2) {
      omp.yield(%arg0 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.task depend(taskdependin -> %3 : !omp.iterated<!llvm.ptr>) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @omp_task_depend_iterator_mixed(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(10 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = omp.iterator(%arg2: i64) = (%0 to %1 step %2) {
      omp.yield(%arg0 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.task depend(taskdependout -> %arg1 : !llvm.ptr, taskdependin -> %3 : !omp.iterated<!llvm.ptr>) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @omp_task_depend_iterator_dynamic(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64) {
    %0 = omp.iterator(%arg4: i64) = (%arg1 to %arg2 step %arg3) {
      omp.yield(%arg0 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.task depend(taskdependin -> %0 : !omp.iterated<!llvm.ptr>) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @omp_task_depend_iterator_dynamic_mixed(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64) {
    %0 = omp.iterator(%arg5: i64) = (%arg2 to %arg3 step %arg4) {
      omp.yield(%arg0 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.task depend(taskdependout -> %arg1 : !llvm.ptr, taskdependin -> %0 : !omp.iterated<!llvm.ptr>) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
}

// -----
module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @omp_target_depend_iterator(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(10 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = omp.iterator(%arg1: i64) = (%0 to %1 step %2) {
      omp.yield(%arg0 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    %4 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "data"}
    omp.target kernel_type(generic) depend(taskdependin -> %3 : !omp.iterated<!llvm.ptr>) map_entries(%4 -> %arg1 : !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

