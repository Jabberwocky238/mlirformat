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
      "test.read_buffer"(%alloc_0) : (memref<?x?xf32>) -> ()
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
  func.func @nestedRegionControlFlowAlloca(%arg0: index, %arg1: index, %arg2: f32) -> memref<?x?xf32> {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %1 = scf.if %0 -> (memref<?x?xf32>) {
      scf.yield %alloc : memref<?x?xf32>
    } else {
      %alloca = memref.alloca(%arg0, %arg1) : memref<?x?xf32>
      %c0 = arith.constant 0 : index
      memref.store %arg2, %alloca[%c0, %c0] : memref<?x?xf32>
      scf.yield %alloc : memref<?x?xf32>
    }
    return %1 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @loop_alloc(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    "test.read_buffer"(%alloc) : (memref<2xf32>) -> ()
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
  func.func @loop_nested_if_no_alloc(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = arith.cmpi eq, %arg5, %arg1 : index
      %2 = scf.if %1 -> (memref<2xf32>) {
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
    "test.read_buffer"(%alloc) : (memref<2xf32>) -> ()
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (memref<2xf32>) {
      %1 = scf.for %arg7 = %arg0 to %arg1 step %arg2 iter_args(%arg8 = %arg6) -> (memref<2xf32>) {
        %2 = scf.for %arg9 = %arg0 to %arg1 step %arg2 iter_args(%arg10 = %arg8) -> (memref<2xf32>) {
          %alloc_0 = memref.alloc() : memref<2xf32>
          "test.read_buffer"(%alloc_0) : (memref<2xf32>) -> ()
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
  func.func @affine_loop() -> f32 {
    %alloc = memref.alloc() : memref<1024xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg0 = 0 to 10 step 2 iter_args(%arg1 = %cst) -> (f32) {
      %1 = affine.load %alloc[%arg0] : memref<1024xf32>
      %2 = arith.addf %arg1, %1 : f32
      affine.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @assumingOp(%arg0: !shape.witness, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %0 = shape.assuming %arg0 -> (memref<2xf32>) {
      %alloc = memref.alloc() : memref<2xf32>
      "test.read_buffer"(%alloc) : (memref<2xf32>) -> ()
      shape.assuming_yield %arg1 : memref<2xf32>
    }
    %1 = shape.assuming %arg0 -> (memref<2xf32>) {
      %alloc = memref.alloc() : memref<2xf32>
      shape.assuming_yield %alloc : memref<2xf32>
    }
    test.copy(%1, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @noRegionBranchOpInterface() {
    %0 = "test.one_region_with_recursive_memory_effects"() ({
      %1 = "test.one_region_with_recursive_memory_effects"() ({
        %alloc = memref.alloc() : memref<2xi32>
        "test.read_buffer"(%alloc) : (memref<2xi32>) -> ()
        "test.return"() : () -> ()
      }) : () -> i32
      "test.return"() : () -> ()
    }) : () -> i32
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @while_two_arg(%arg0: index) {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    %0:2 = scf.while (%arg1 = %alloc, %arg2 = %alloc) : (memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>) {
      %1 = "test.side_effect_op"() {effects = [{effect = "read"}]} : () -> i1
      scf.condition(%1) %arg1, %arg2 : memref<?xf32>, memref<?xf32>
    } do {
    ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>):
      %alloc_0 = memref.alloc(%arg0) : memref<?xf32>
      scf.yield %arg1, %alloc_0 : memref<?xf32>, memref<?xf32>
    }
    return
  }
}

// -----
module {
  func.func @while_three_arg(%arg0: index) {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    %0:3 = scf.while (%arg1 = %alloc, %arg2 = %alloc, %arg3 = %alloc) : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>, memref<?xf32>) {
      %1 = "test.side_effect_op"() {effects = [{effect = "read"}]} : () -> i1
      scf.condition(%1) %arg1, %arg2, %arg3 : memref<?xf32>, memref<?xf32>, memref<?xf32>
    } do {
    ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: memref<?xf32>):
      %alloc_0 = memref.alloc(%arg0) : memref<?xf32>
      %alloc_1 = memref.alloc(%arg0) : memref<?xf32>
      scf.yield %alloc_1, %alloc_0, %arg2 : memref<?xf32>, memref<?xf32>, memref<?xf32>
    }
    return
  }
}

// -----
#set = affine_set<() : (0 >= 0)>
module {
  func.func @test_affine_if_1(%arg0: memref<10xf32>) -> memref<10xf32> {
    %0 = affine.if #set() -> memref<10xf32> {
      %alloc = memref.alloc() : memref<10xf32>
      affine.yield %alloc : memref<10xf32>
    } else {
      affine.yield %arg0 : memref<10xf32>
    }
    return %0 : memref<10xf32>
  }
}

// -----
#set = affine_set<() : (0 >= 0)>
module {
  func.func @test_affine_if_2() -> memref<10xf32> {
    %alloc = memref.alloc() : memref<10xf32>
    %0 = affine.if #set() -> memref<10xf32> {
      affine.yield %alloc : memref<10xf32>
    } else {
      %alloc_0 = memref.alloc() : memref<10xf32>
      affine.yield %alloc_0 : memref<10xf32>
    }
    return %0 : memref<10xf32>
  }
}

// -----
#set = affine_set<() : (0 >= 0)>
module {
  func.func @test_affine_if_3() -> memref<10xf32> {
    %alloc = memref.alloc() : memref<10xf32>
    %0 = affine.if #set() -> memref<10xf32> {
      %alloc_0 = memref.alloc() : memref<10xf32>
      affine.yield %alloc_0 : memref<10xf32>
    } else {
      affine.yield %alloc : memref<10xf32>
    }
    return %0 : memref<10xf32>
  }
}

