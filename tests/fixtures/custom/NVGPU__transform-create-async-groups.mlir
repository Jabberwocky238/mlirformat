module {
  func.func @copies_to_asyncs(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true]} : memref<1024x1024xf32>, vector<4xf32>
    vector.transfer_write %0, %alloc[%c0, %c0, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %1 = vector.transfer_read %arg0[%c0, %c4], %cst {in_bounds = [true]} : memref<1024x1024xf32>, vector<1xf32>
    vector.transfer_write %1, %alloc[%c0, %c4, %c0] {in_bounds = [true]} : vector<1xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 {bypass_l1} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copies_to_asyncs_no_mma(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true]} : memref<1024x1024xf32>, vector<4xf32>
    vector.transfer_write %0, %alloc[%c0, %c0, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %1 = vector.transfer_read %arg0[%c0, %c4], %cst {in_bounds = [true]} : memref<1024x1024xf32>, vector<1xf32>
    vector.transfer_write %1, %alloc[%c0, %c4, %c0] {in_bounds = [true]} : vector<1xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copies_to_asyncs_load_store(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.load %arg0[%c0, %c0] : memref<1024x1024xf32>, vector<4xf32>
    vector.store %0, %alloc[%c0, %c0, %c0] : memref<4x32x16xf32, #gpu.address_space<workgroup>>, vector<4xf32>
    %1 = vector.load %arg0[%c0, %c4] : memref<1024x1024xf32>, vector<1xf32>
    vector.store %1, %alloc[%c0, %c4, %c0] : memref<4x32x16xf32, #gpu.address_space<workgroup>>, vector<1xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copies_to_asyncs_load_store(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf16>) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<4x32x16xf16, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.load %arg0[%c0, %c4] : memref<1024x1024xf32>, vector<2x2xf32>
    vector.store %0, %alloc[%c0, %c4, %c0] : memref<4x32x16xf32, #gpu.address_space<workgroup>>, vector<2x2xf32>
    %1 = vector.load %arg1[%c0, %c4] : memref<1024x1024xf16>, vector<1xf16>
    vector.store %1, %alloc_0[%c0, %c4, %c0] : memref<4x32x16xf16, #gpu.address_space<workgroup>>, vector<1xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @read_with_mask(%arg0: memref<1024x1024xf32>, %arg1: index) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %arg1 : vector<4xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %cst, %0 {in_bounds = [true]} : memref<1024x1024xf32>, vector<4xf32>
    vector.transfer_write %1, %alloc[%c0, %c0, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 {bypass_l1} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @read_2d_with_mask(%arg0: index, %arg1: index, %arg2: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %arg0, %arg1 : vector<3x4xi1>
    %1 = vector.transfer_read %arg2[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<1024x1024xf32>, vector<3x4xf32>
    vector.transfer_write %1, %alloc[%c0, %c0, %c0] {in_bounds = [true, true]} : vector<3x4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.transfer_to_scf full_unroll = true
      } : !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 {bypass_l1} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_cse to %2 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @read_3d_with_mask(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<1024x1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %arg0, %arg1, %arg2 : vector<2x3x4xi1>
    %1 = vector.transfer_read %arg3[%c0, %c0, %c0], %cst, %0 {in_bounds = [true, true, true]} : memref<1024x1024x1024xf32>, vector<2x3x4xf32>
    vector.transfer_write %1, %alloc[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<2x3x4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.transfer_to_scf full_unroll = true
      } : !transform.any_op
      %1 = transform.nvgpu.create_async_groups %0 {bypass_l1} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_cse to %2 : !transform.any_op
      transform.yield 
    }
  }
}

