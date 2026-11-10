module {
  func.func private @body(index, memref<?xf32, #gpu.address_space<workgroup>>)
  func.func @simple_depth_2_peeled(%arg0: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c200 = arith.constant 200 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc(%c200) : memref<?xf32, #gpu.address_space<workgroup>>
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg1 = %c0 to %c100 step %c4 {
      %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32>, vector<4xf32>
      vector.transfer_write %0, %alloc[%arg1] : vector<4xf32>, memref<?xf32, #gpu.address_space<workgroup>>
      func.call @body(%arg1, %alloc) : (index, memref<?xf32, #gpu.address_space<workgroup>>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.pipeline_shared_memory_copies failures(propagate) %0 {depth = 2 : i64, peel_epilogue} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @async_depth_2_predicated(%arg0: memref<?xf32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c98 = arith.constant 98 : index
    %c100 = arith.constant 100 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc(%arg1) : memref<?xf32, #gpu.address_space<workgroup>>
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg2 = %c0 to %c98 step %c4 {
      %c96 = arith.constant 96 : index
      %0 = arith.cmpi slt, %arg2, %c96 : index
      %c2 = arith.constant 2 : index
      %1 = arith.select %0, %c4, %c2 : index
      %2 = nvgpu.device_async_copy %arg0[%arg2], %alloc[%arg2], 4, %1 : memref<?xf32> to memref<?xf32, #gpu.address_space<workgroup>>
      nvgpu.device_async_wait %2
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.pipeline_shared_memory_copies failures(propagate) %0 {depth = 2 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @async_depth_2_peeled(%arg0: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c98 = arith.constant 98 : index
    %c100 = arith.constant 100 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc(%c100) : memref<?xf32, #gpu.address_space<workgroup>>
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg1 = %c0 to %c98 step %c4 {
      %c96 = arith.constant 96 : index
      %0 = arith.cmpi slt, %arg1, %c96 : index
      %c2 = arith.constant 2 : index
      %1 = arith.select %0, %c4, %c2 : index
      %2 = nvgpu.device_async_copy %arg0[%arg1], %alloc[%arg1], 4, %1 : memref<?xf32> to memref<?xf32, #gpu.address_space<workgroup>>
      nvgpu.device_async_wait %2
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.pipeline_shared_memory_copies failures(propagate) %0 {depth = 2 : i64, peel_epilogue} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

