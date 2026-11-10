module {
  func.func @test_simple_mod(%arg0: memref<i32>, %arg1: memref<i32>) -> (memref<i32>, memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    memref.store %c0_i32, %arg0[] {tag_name = "a"} : memref<i32>
    memref.store %c1_i32, %arg1[] {tag_name = "b"} : memref<i32>
    return {tag = "test_simple_mod"} %arg0, %arg1 : memref<i32>, memref<i32>
  }
  func.func @test_simple_mod_overwrite(%arg0: memref<i32>) -> memref<i32> {
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[] {tag = "test_simple_mod_overwrite_a", tag_name = "a"} : memref<i32>
    %c1_i32 = arith.constant 1 : i32
    memref.store %c1_i32, %arg0[] {tag_name = "b"} : memref<i32>
    return {tag = "test_simple_mod_overwrite_b"} %arg0 : memref<i32>
  }
  func.func @test_mod_control_flow(%arg0: i1, %arg1: memref<i32>) -> memref<i32> {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg1[] {tag_name = "a"} : memref<i32>
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %c1_i32 = arith.constant 1 : i32
    memref.store %c1_i32, %arg1[] {tag_name = "b"} : memref<i32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return {tag = "test_mod_control_flow"} %arg1 : memref<i32>
  }
  func.func @test_mod_dead_branch(%arg0: i32, %arg1: memref<i32>) -> memref<i32> {
    %0 = arith.subi %arg0, %arg0 : i32
    %c-1_i32 = arith.constant -1 : i32
    %1 = arith.cmpi sgt, %0, %c-1_i32 : i32
    cf.cond_br %1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg1[] {tag_name = "a"} : memref<i32>
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %c1_i32 = arith.constant 1 : i32
    memref.store %c1_i32, %arg1[] {tag_name = "b"} : memref<i32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return {tag = "test_mod_dead_branch"} %arg1 : memref<i32>
  }
  func.func @test_mod_region_control_flow(%arg0: i1, %arg1: memref<i32>) -> memref<i32> {
    scf.if %arg0 {
      %c0_i32 = arith.constant 0 : i32
      memref.store %c0_i32, %arg1[] {tag_name = "then"} : memref<i32>
    } else {
      %c1_i32 = arith.constant 1 : i32
      memref.store %c1_i32, %arg1[] {tag_name = "else"} : memref<i32>
    }
    return {tag = "test_mod_region_control_flow"} %arg1 : memref<i32>
  }
  func.func @test_mod_dead_region(%arg0: memref<i32>) -> memref<i32> {
    %false = arith.constant false
    scf.if %false {
      %c0_i32 = arith.constant 0 : i32
      memref.store %c0_i32, %arg0[] {tag_name = "then"} : memref<i32>
    } else {
      %c1_i32 = arith.constant 1 : i32
      memref.store %c1_i32, %arg0[] {tag_name = "else"} : memref<i32>
    }
    return {tag = "test_mod_dead_region"} %arg0 : memref<i32>
  }
  func.func @unknown_memory_effects(%arg0: memref<i32>) -> memref<i32> {
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %arg0[] {tag = "unknown_memory_effects_a", tag_name = "a"} : memref<i32>
    "test.unknown_effects"() : () -> ()
    return {tag = "unknown_memory_effects_b"} %arg0 : memref<i32>
  }
  func.func @store_with_a_region_before(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_region_before::before"} : memref<f32>
    test.store_with_a_region %arg0 attributes {store_before_region = true, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "inside_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_region_after(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_region_after::before"} : memref<f32>
    test.store_with_a_region %arg0 attributes {store_before_region = false, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "inside_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_region_before_containing_a_store(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_region_before_containing_a_store::before"} : memref<f32>
    test.store_with_a_region %arg0 attributes {store_before_region = true, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "enter_region"} : memref<f32>
      %cst_1 = arith.constant 2.000000e+00 : f32
      memref.store %cst_1, %arg0[] {tag_name = "inner"} : memref<f32>
      %3 = memref.load %arg0[] {tag = "exit_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_region_after_containing_a_store(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_region_after_containing_a_store::before"} : memref<f32>
    test.store_with_a_region %arg0 attributes {store_before_region = false, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "enter_region"} : memref<f32>
      %cst_1 = arith.constant 2.000000e+00 : f32
      memref.store %cst_1, %arg0[] {tag_name = "inner"} : memref<f32>
      %3 = memref.load %arg0[] {tag = "exit_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_loop_region_before(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_loop_region_before::before"} : memref<f32>
    test.store_with_a_loop_region %arg0 attributes {store_before_region = true, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "inside_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_loop_region_after(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_loop_region_after::before"} : memref<f32>
    test.store_with_a_loop_region %arg0 attributes {store_before_region = false, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "inside_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_loop_region_before_containing_a_store(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_loop_region_before_containing_a_store::before"} : memref<f32>
    test.store_with_a_loop_region %arg0 attributes {store_before_region = true, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "enter_region"} : memref<f32>
      %cst_1 = arith.constant 2.000000e+00 : f32
      memref.store %cst_1, %arg0[] {tag_name = "inner"} : memref<f32>
      %3 = memref.load %arg0[] {tag = "exit_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func @store_with_a_loop_region_after_containing_a_store(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "store_with_a_loop_region_after_containing_a_store::before"} : memref<f32>
    test.store_with_a_loop_region %arg0 attributes {store_before_region = false, tag_name = "region"} {
      %2 = memref.load %arg0[] {tag = "enter_region"} : memref<f32>
      %cst_1 = arith.constant 2.000000e+00 : f32
      memref.store %cst_1, %arg0[] {tag_name = "inner"} : memref<f32>
      %3 = memref.load %arg0[] {tag = "exit_region"} : memref<f32>
      test.store_with_a_region_terminator
    } : memref<f32>
    %1 = memref.load %arg0[] {tag = "after"} : memref<f32>
    memref.store %cst_0, %arg0[] {tag_name = "post"} : memref<f32>
    return {tag = "return"} %arg0 : memref<f32>
  }
  func.func private @unreachable_private(%arg0: i32) {
    %0 = arith.index_cast %arg0 {tag = "tag_in_unreachable_private"} : i32 to index
    return
  }
}

