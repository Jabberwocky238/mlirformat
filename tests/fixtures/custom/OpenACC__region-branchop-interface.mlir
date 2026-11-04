module {
  func.func @last_mod_openacc_parallel(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 1.000000e+00 : f32
    acc.parallel {
      memref.store %cst, %arg0[] {tag_name = "parallel_region"} : memref<f32>
      acc.yield
    }
    %0 = memref.load %arg0[] {tag = "acc_parallel_after"} : memref<f32>
    return {tag = "acc_parallel_return"} %arg0 : memref<f32>
  }
}

// -----
module {
  func.func @last_mod_openacc_serial(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 1.000000e+00 : f32
    acc.serial {
      memref.store %cst, %arg0[] {tag_name = "serial_region"} : memref<f32>
      acc.yield
    }
    %0 = memref.load %arg0[] {tag = "acc_serial_after"} : memref<f32>
    return {tag = "acc_serial_return"} %arg0 : memref<f32>
  }
}

// -----
module {
  func.func @last_mod_openacc_kernels(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "acc_kernels_before"} : memref<f32>
    acc.kernels {
      acc.terminator
    }
    %1 = memref.load %arg0[] {tag = "acc_kernels_after"} : memref<f32>
    return %arg0 : memref<f32>
  }
}

// -----
module {
  func.func @last_mod_openacc_data(%arg0: memref<f32>, %arg1: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "acc_data_before"} : memref<f32>
    acc.data {
      acc.terminator
    } attributes {defaultAttr = #acc<defaultvalue none>}
    %1 = memref.load %arg0[] {tag = "acc_data_after"} : memref<f32>
    return %arg0 : memref<f32>
  }
}

// -----
module {
  func.func @last_mod_openacc_host_data(%arg0: memref<f32>, %arg1: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "acc_host_before"} : memref<f32>
    %1 = acc.use_device varPtr(%arg1 : memref<f32>) varType(tensor<f32>) -> memref<f32>
    acc.host_data dataOperands(%1 : memref<f32>) {
      acc.terminator
    }
    %2 = memref.load %arg0[] {tag = "acc_host_after"} : memref<f32>
    return %arg0 : memref<f32>
  }
}

// -----
module {
  func.func @last_mod_openacc_loop(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "acc_loop_before"} : memref<f32>
    %cst_0 = arith.constant 1.000000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    acc.loop control(%arg1 : i32) = (%c1_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
      memref.store %cst_0, %arg0[] {tag_name = "loop_region"} : memref<f32>
      %3 = memref.load %arg0[] {tag = "acc_loop_inside"} : memref<f32>
      acc.yield
    } attributes {auto_ = [#acc.device_type<none>]}
    %1 = memref.load %arg0[] {tag = "acc_loop_after"} : memref<f32>
    memref.store %cst, %arg0[] {tag_name = "post_loop"} : memref<f32>
    %2 = memref.load %arg0[] {tag = "acc_loop_post"} : memref<f32>
    return {tag = "acc_loop_return"} %arg0 : memref<f32>
  }
}

// -----
module {
  func.func @last_mod_openacc_loop_unstructured(%arg0: memref<f32>) -> memref<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    memref.store %cst, %arg0[] {tag_name = "pre"} : memref<f32>
    %0 = memref.load %arg0[] {tag = "acc_loop_unstructured_before"} : memref<f32>
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c5_i32 = arith.constant 5 : i32
    acc.loop {
      cf.br ^bb1(%c0_i32 : i32)
    ^bb1(%2: i32):  // 2 preds: ^bb0, ^bb2
      %3 = arith.cmpi eq, %2, %c1_i32 : i32
      cf.cond_br %3, ^bb3, ^bb2
    ^bb2:  // pred: ^bb1
      %4 = arith.addi %2, %c1_i32 : i32
      %5 = arith.cmpi eq, %4, %c5_i32 : i32
      cf.cond_br %5, ^bb4, ^bb1(%4 : i32)
    ^bb3:  // pred: ^bb1
      memref.store %cst_0, %arg0[] {tag_name = "loop_unstructured_early"} : memref<f32>
      acc.yield
    ^bb4:  // pred: ^bb2
      memref.store %cst_0, %arg0[] {tag_name = "loop_unstructured_normal"} : memref<f32>
      acc.yield
    } attributes {auto_ = [#acc.device_type<none>], unstructured}
    %1 = memref.load %arg0[] {tag = "acc_loop_unstructured_after"} : memref<f32>
    return %arg0 : memref<f32>
  }
}

