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
  func.func @condBranchDynamicTypeNested(%arg0: i1, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index) {
    cf.cond_br %arg0, ^bb1, ^bb2(%arg3 : index)
  ^bb1:  // pred: ^bb0
    cf.br ^bb6(%arg1 : memref<?xf32>)
  ^bb2(%0: index):  // pred: ^bb0
    %alloc = memref.alloc(%0) : memref<?xf32>
    test.buffer_based in(%arg1 : memref<?xf32>) out(%alloc : memref<?xf32>)
    cf.cond_br %arg0, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    cf.br ^bb5(%alloc : memref<?xf32>)
  ^bb4:  // pred: ^bb2
    cf.br ^bb5(%alloc : memref<?xf32>)
  ^bb5(%1: memref<?xf32>):  // 2 preds: ^bb3, ^bb4
    cf.br ^bb6(%1 : memref<?xf32>)
  ^bb6(%2: memref<?xf32>):  // 2 preds: ^bb1, ^bb5
    cf.br ^bb7(%2 : memref<?xf32>)
  ^bb7(%3: memref<?xf32>):  // pred: ^bb6
    test.copy(%3, %arg2) : (memref<?xf32>, memref<?xf32>)
    return
  }
}

// -----
module {
  func.func @criticalEdge(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2(%arg1 : memref<2xf32>)
  ^bb1:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.br ^bb2(%alloc : memref<2xf32>)
  ^bb2(%0: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElse(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloc : memref<2xf32>, memref<2xf32>), ^bb2(%alloc, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%2, %3 : memref<2xf32>, memref<2xf32>)
  ^bb3(%4: memref<2xf32>, %5: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%alloc_0 : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    test.copy(%alloc_0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElseNoUsers(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloc : memref<2xf32>, memref<2xf32>), ^bb2(%alloc, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%2, %3 : memref<2xf32>, memref<2xf32>)
  ^bb3(%4: memref<2xf32>, %5: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%arg1, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElseNested(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloc : memref<2xf32>, memref<2xf32>), ^bb2(%alloc, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb5(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.cond_br %arg0, ^bb3(%2 : memref<2xf32>), ^bb4(%3 : memref<2xf32>)
  ^bb3(%4: memref<2xf32>):  // pred: ^bb2
    cf.br ^bb5(%4, %2 : memref<2xf32>, memref<2xf32>)
  ^bb4(%5: memref<2xf32>):  // pred: ^bb2
    cf.br ^bb5(%2, %5 : memref<2xf32>, memref<2xf32>)
  ^bb5(%6: memref<2xf32>, %7: memref<2xf32>):  // 3 preds: ^bb1, ^bb3, ^bb4
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%6 : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    test.copy(%alloc_0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @redundantOperations(%arg0: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg0 : memref<2xf32>) out(%alloc : memref<2xf32>)
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%alloc : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @moving_alloc_and_inserting_missing_dealloc(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    cf.br ^bb3(%alloc_0 : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @moving_invalid_dealloc_op_complex(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    memref.dealloc %alloc : memref<2xf32>
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
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
  func.func @nested_region_control_flow_div(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %1 = scf.if %0 -> (memref<?x?xf32>) {
      scf.yield %alloc : memref<?x?xf32>
    } else {
      %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
      scf.yield %alloc_0 : memref<?x?xf32>
    }
    return %1 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @nested_region_control_flow_div_nested(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %1 = scf.if %0 -> (memref<?x?xf32>) {
      %2 = scf.if %0 -> (memref<?x?xf32>) {
        scf.yield %alloc : memref<?x?xf32>
      } else {
        %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
        scf.yield %alloc_0 : memref<?x?xf32>
      }
      scf.yield %2 : memref<?x?xf32>
    } else {
      %alloc_0 = memref.alloc(%arg1, %arg1) : memref<?x?xf32>
      scf.yield %alloc_0 : memref<?x?xf32>
    }
    return %1 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @nested_region_control_flow_div_nested_dependencies(%arg0: i32, %arg1: i1, %arg2: index) -> memref<?x?xf32> {
    %0 = scf.if %arg1 -> (memref<?x?xf32>) {
      %c1_i32 = arith.constant 1 : i32
      %1 = arith.addi %arg0, %c1_i32 : i32
      %2 = arith.index_cast %1 : i32 to index
      %alloc = memref.alloc(%arg2, %2) : memref<?x?xf32>
      scf.yield %alloc : memref<?x?xf32>
    } else {
      %c2_i32 = arith.constant 2 : i32
      %1 = arith.addi %arg0, %c2_i32 : i32
      %2 = arith.index_cast %1 : i32 to index
      %alloc = memref.alloc(%arg2, %2) : memref<?x?xf32>
      scf.yield %alloc : memref<?x?xf32>
    }
    return %0 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @inner_region_control_flow(%arg0: index) -> memref<?x?xf32> {
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %0 = test.region_if %alloc: memref<?x?xf32> -> memref<?x?xf32> then {
    ^bb0(%arg1: memref<?x?xf32>):
      test.region_if_yield %arg1 : memref<?x?xf32>
    } else {
    ^bb0(%arg1: memref<?x?xf32>):
      test.region_if_yield %arg1 : memref<?x?xf32>
    } join {
    ^bb0(%arg1: memref<?x?xf32>):
      test.region_if_yield %arg1 : memref<?x?xf32>
    }
    return %0 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @inner_region_control_flow_div(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %0 = test.region_if %alloc: memref<?x?xf32> -> memref<?x?xf32> then {
    ^bb0(%arg2: memref<?x?xf32>):
      test.region_if_yield %arg2 : memref<?x?xf32>
    } else {
    ^bb0(%arg2: memref<?x?xf32>):
      %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
      test.region_if_yield %alloc_0 : memref<?x?xf32>
    } join {
    ^bb0(%arg2: memref<?x?xf32>):
      test.region_if_yield %arg2 : memref<?x?xf32>
    }
    return %0 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @condBranchAlloca(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloca = memref.alloca() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloca : memref<2xf32>)
    cf.br ^bb3(%alloca : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElseNestedAlloca(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloca = memref.alloca() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloca : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloca : memref<2xf32>, memref<2xf32>), ^bb2(%alloca, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb5(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.cond_br %arg0, ^bb3(%2 : memref<2xf32>), ^bb4(%3 : memref<2xf32>)
  ^bb3(%4: memref<2xf32>):  // pred: ^bb2
    cf.br ^bb5(%4, %2 : memref<2xf32>, memref<2xf32>)
  ^bb4(%5: memref<2xf32>):  // pred: ^bb2
    cf.br ^bb5(%2, %5 : memref<2xf32>, memref<2xf32>)
  ^bb5(%6: memref<2xf32>, %7: memref<2xf32>):  // 3 preds: ^bb1, ^bb3, ^bb4
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%6 : memref<2xf32>) out(%alloc : memref<2xf32>)
    test.copy(%alloc, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @nestedRegionsAndCondBranchAlloca(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.region_buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>) {
    ^bb0(%arg3: f32, %arg4: f32):
      %alloca = memref.alloca() : memref<2xf32>
      test.buffer_based in(%arg1 : memref<2xf32>) out(%alloca : memref<2xf32>)
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
            %alloc_1 = memref.alloc() : memref<2xf32>
            scf.yield %alloc_1 : memref<2xf32>
          } else {
            scf.yield %arg10 : memref<2xf32>
          }
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
          %3 = arith.cmpi eq, %arg6, %arg1 : index
          %4 = scf.if %3 -> (memref<?xf32>) {
            %alloc_0 = memref.alloc(%arg10) : memref<?xf32>
            scf.yield %alloc_0 : memref<?xf32>
          } else {
            scf.yield %arg11 : memref<?xf32>
          }
          scf.yield %4 : memref<?xf32>
        }
        scf.yield %2 : memref<?xf32>
      }
      scf.yield %alloc : memref<?xf32>
    }
    test.copy(%0, %arg5) : (memref<?xf32>, memref<?xf32>)
    return
  }
  func.func @unreachable_alloc(%arg0: f32) {
    %c0 = arith.constant 0 : index
    return
  ^bb1(%0: i32):  // no predecessors
    %alloc = memref.alloc() : memref<10xf32>
    return
  }
}

