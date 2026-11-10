module {
  func.func @structured_cfg() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c1 to %c10 step %c1 {
      %0 = "test.zero"(%arg0) : (index) -> i1
      scf.if %0 {
        "test.one"(%arg0) : (index) -> ()
      } else {
        "test.two"(%arg0) : (index) -> ()
      }
      "test.three"(%arg0) : (index) -> ()
    } {walk_blocks, walk_regions}
    return
  }
}

// -----
module {
  func.func @unstructured_cfg() {
    "test.region.op0"() ({
      "test.op0"() : () -> ()
      cf.br ^bb2
    ^bb1:  // no predecessors
      "test.op1"() : () -> ()
      cf.br ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "test.op2"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @unordered_cfg_with_loop() {
    "test.region.op0"() ({
      %0 = "test.op0"() : () -> i1
      cf.cond_br %0, ^bb2, ^bb3
    ^bb1:  // pred: ^bb2
      "test.op1"(%1) : (i32) -> ()
      cf.br ^bb5
    ^bb2:  // 3 preds: ^bb0, ^bb3, ^bb4
      %1 = "test.op2"() : () -> i32
      cf.br ^bb1
    ^bb3:  // pred: ^bb0
      "test.op3"() : () -> ()
      cf.br ^bb2
    ^bb4:  // no predecessors
      "test.op4"() : () -> ()
      cf.br ^bb2
    ^bb5:  // pred: ^bb1
      "test.op5"() : () -> ()
      cf.br ^bb7
    ^bb6:  // pred: ^bb6
      "test.op6"() : () -> ()
      cf.br ^bb6
    ^bb7:  // pred: ^bb5
      "test.op7"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_no_skip_block_erasure() {
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %0 = arith.cmpi eq, %c0, %c3 : index
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @test_no_skip_block_erasure_block_args(%arg0: i32, %arg1: i32) -> i32 {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %0 = arith.addi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
}

// -----
module {
  func.func @graph_region_skip(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<2xf32>) -> tensor<2xf32>
    %1 = scf.forall (%arg2) in (2) shared_outs(%arg3 = %arg1) -> (tensor<2xf32>) {
      %extracted_slice = tensor.extract_slice %0[%arg2] [1] [1] : tensor<2xf32> to tensor<1xf32>
      %extracted_slice_0 = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<2xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice_0 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<2xf32>
      }
    }
    return
  }
}

// -----
module attributes {gpu.container_module, llvm.data_layout = ""} {
  gpu.module @issue205717 {
    func.func @test_skip_block_erasure_nested_uses(%arg0: i32) -> i32 {
      %c0_i32 = arith.constant 0 : i32
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.cmpi eq, %arg0, %c0_i32 : i32
      cf.cond_br %0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      gpu.barrier
      cf.br ^bb3(%c1_i32 : i32)
    ^bb2:  // pred: ^bb0
      gpu.barrier
      %1 = arith.addi %arg0, %c1_i32 : i32
      cf.br ^bb3(%1 : i32)
    ^bb3(%2: i32):  // 2 preds: ^bb1, ^bb2
      return %2 : i32
    }
  }
}

