module {
  func.func @condBranch(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @condBranchDynamicType(%arg0: i1, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index) {
    cf.cond_br %arg0, ^bb1, ^bb2(%arg3 : index)
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<?xf32>)
  ^bb2(%0: index):  // pred: ^bb0
    %alloc = memref.alloc(%0) : memref<?xf32>
    test.buffer_based in(%arg1 : memref<?xf32>) out(%alloc : memref<?xf32>)
    cf.br ^bb3(%alloc : memref<?xf32>)
  ^bb3(%1: memref<?xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%1, %arg2) : (memref<?xf32>, memref<?xf32>)
    return
  }
}

// -----
module {
  func.func @nested_regions_and_cond_branch(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.region_buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>) {
    ^bb0(%arg3: f32, %arg4: f32):
      %alloc_0 = memref.alloc() : memref<2xf32>
      test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
      %1 = math.exp %arg3 : f32
      test.region_yield %1 : f32
    }
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @nested_region_control_flow(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %1 = scf.if %0 -> (memref<?x?xf32>) {
      scf.yield %alloc : memref<?x?xf32>
    } else {
      %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
      scf.yield %alloc : memref<?x?xf32>
    }
    return %1 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @loop_alloc(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = arith.cmpi eq, %arg5, %arg1 : index
      %alloc_0 = memref.alloc() : memref<2xf32>
      scf.yield %alloc_0 : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @loop_nested_if_alloc(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>) -> memref<2xf32> {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg4 = %arg0 to %arg1 step %arg2 iter_args(%arg5 = %arg3) -> (memref<2xf32>) {
      %1 = arith.cmpi eq, %arg4, %arg1 : index
      %2 = scf.if %1 -> (memref<2xf32>) {
        %alloc_0 = memref.alloc() : memref<2xf32>
        scf.yield %alloc_0 : memref<2xf32>
      } else {
        scf.yield %alloc : memref<2xf32>
      }
      scf.yield %2 : memref<2xf32>
    }
    return %0 : memref<2xf32>
  }
}

// -----
module {
  func.func @loop_nested_alloc(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = scf.for %arg7 = %arg0 to %arg1 step %arg2 iter_args(%arg8 = %arg6) -> (memref<2xf32>) {
        %2 = scf.for %arg9 = %arg0 to %arg1 step %arg2 iter_args(%arg10 = %arg8) -> (memref<2xf32>) {
          %alloc_0 = memref.alloc() : memref<2xf32>
          %3 = arith.cmpi eq, %arg5, %arg1 : index
          %4 = scf.if %3 -> (memref<2xf32>) {
            %alloc_2 = memref.alloc() : memref<2xf32>
            %alloc_3 = memref.alloc() : memref<2xf32>
            scf.yield %alloc_3 : memref<2xf32>
          } else {
            scf.yield %arg10 : memref<2xf32>
          }
          %alloc_1 = memref.alloc() : memref<2xf32>
          scf.yield %4 : memref<2xf32>
        }
        scf.yield %2 : memref<2xf32>
      }
      scf.yield %1 : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @loop_nested_alloc_dyn_dependency(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?xf32>, %arg5: memref<?xf32>) {
    %alloc = memref.alloc(%arg3) : memref<?xf32>
    %0 = scf.for %arg6 = %arg0 to %arg1 step %arg2 iter_args(%arg7 = %arg4) -> (memref<?xf32>) {
      %1 = scf.for %arg8 = %arg0 to %arg1 step %arg2 iter_args(%arg9 = %arg7) -> (memref<?xf32>) {
        %2 = scf.for %arg10 = %arg0 to %arg1 step %arg2 iter_args(%arg11 = %arg9) -> (memref<?xf32>) {
          %alloc_0 = memref.alloc(%arg10) : memref<?xf32>
          %3 = arith.cmpi eq, %arg6, %arg1 : index
          %4 = scf.if %3 -> (memref<?xf32>) {
            %alloc_2 = memref.alloc(%arg10) : memref<?xf32>
            scf.yield %alloc_2 : memref<?xf32>
          } else {
            scf.yield %arg11 : memref<?xf32>
          }
          %alloc_1 = memref.alloc(%arg10) : memref<?xf32>
          scf.yield %4 : memref<?xf32>
        }
        scf.yield %2 : memref<?xf32>
      }
      scf.yield %alloc : memref<?xf32>
    }
    test.copy(%0, %arg5) : (memref<?xf32>, memref<?xf32>)
    return
  }
}

// -----
module {
  func.func @hoist_one_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %alloc_0 = memref.alloc() : memref<2xf32>
      scf.yield %alloc : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @no_hoist_one_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %alloc = memref.alloc() : memref<2xf32>
      scf.yield %alloc : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @hoist_multiple_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = scf.for %arg7 = %arg0 to %arg1 step %arg2 iter_args(%arg8 = %arg6) -> (memref<2xf32>) {
        %alloc_0 = memref.alloc() : memref<2xf32>
        scf.yield %alloc : memref<2xf32>
      }
      scf.yield %alloc : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @no_hoist_one_loop_conditional(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = arith.cmpi eq, %arg5, %arg1 : index
      %2 = scf.if %1 -> (memref<2xf32>) {
        %alloc = memref.alloc() : memref<2xf32>
        scf.yield %alloc : memref<2xf32>
      } else {
        scf.yield %arg6 : memref<2xf32>
      }
      scf.yield %2 : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @hoist_one_loop_conditional(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %1 = scf.if %0 -> (memref<2xf32>) {
      %2 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
        %alloc_0 = memref.alloc() : memref<2xf32>
        scf.yield %alloc : memref<2xf32>
      }
      scf.yield %alloc : memref<2xf32>
    } else {
      scf.yield %alloc : memref<2xf32>
    }
    test.copy(%1, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @no_hoist_one_loop_dependency(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %alloc_0 = memref.alloc(%arg5) : memref<?xf32>
      scf.yield %alloc : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @partial_hoist_multiple_loop_dependency(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = scf.for %arg7 = %arg0 to %arg1 step %arg2 iter_args(%arg8 = %arg6) -> (memref<2xf32>) {
        %alloc_0 = memref.alloc(%arg5) : memref<?xf32>
        scf.yield %alloc : memref<2xf32>
      }
      scf.yield %alloc : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @no_hoist_parallel(%arg0: index, %arg1: index, %arg2: index) {
    scf.parallel (%arg3) = (%arg0) to (%arg1) step (%arg2) {
      %alloc = memref.alloc() : memref<2xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @no_hoist_forall(%arg0: index, %arg1: index, %arg2: index) {
    scf.forall (%arg3) = (%arg0) to (%arg1) step (%arg2) {
      %alloc = memref.alloc() : memref<2xf32>
    }
    return
  }
}

// -----
module {
  func.func @hoist_alloca(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloca = memref.alloca() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = scf.for %arg7 = %arg0 to %arg1 step %arg2 iter_args(%arg8 = %arg6) -> (memref<2xf32>) {
        %alloca_0 = memref.alloca() : memref<2xf32>
        scf.yield %alloca : memref<2xf32>
      }
      scf.yield %alloca : memref<2xf32>
    }
    test.copy(%0, %arg4) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

