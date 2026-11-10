module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @kernel_simple_selection(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: i1) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    scf.if %arg1 {
      memref.store %cst, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    }
    return
  }
  func.func @kernel_nested_selection(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg2: i1, %arg3: i1) {
    %c0 = arith.constant 0 : index
    %c9 = arith.constant 9 : index
    scf.if %arg2 {
      scf.if %arg3 {
        %0 = memref.load %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
        memref.store %0, %arg1[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      } else {
        %0 = memref.load %arg1[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
        memref.store %0, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      }
    } else {
      scf.if %arg3 {
        %0 = memref.load %arg0[%c9] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
        memref.store %0, %arg1[%c9] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      } else {
        %0 = memref.load %arg1[%c9] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
        memref.store %0, %arg0[%c9] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      }
    }
    return
  }
  func.func @simple_if_yield(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: i1) {
    %0:2 = scf.if %arg1 -> (f32, f32) {
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant 1.000000e+00 : f32
      scf.yield %cst, %cst_0 : f32, f32
    } else {
      %cst = arith.constant 2.000000e+00 : f32
      %cst_0 = arith.constant 3.000000e+00 : f32
      scf.yield %cst_0, %cst : f32, f32
    }
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    memref.store %0#0, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    memref.store %0#1, %arg0[%c1] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @simple_if_yield_type_change(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg2: i1) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.if %arg2 -> (memref<10xf32, #spirv.storage_class<StorageBuffer>>) {
      scf.yield %arg0 : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    } else {
      scf.yield %arg1 : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    }
    memref.store %cst, %0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @unsupported_yield_type(%arg0: memref<8xi32>, %arg1: memref<8xi32>, %arg2: i1) {
    %0 = scf.if %arg2 -> (memref<8xi32>) {
      scf.yield %arg0 : memref<8xi32>
    } else {
      scf.yield %arg1 : memref<8xi32>
    }
    return
  }
  func.func @selection_flatten(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: i1) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    scf.if %arg1 {
      memref.store %cst, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    } {spirv.selection_control = #spirv.selection_control<Flatten>}
    return
  }
  func.func @selection_dont_flatten(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: i1) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    scf.if %arg1 {
      memref.store %cst, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    } {spirv.selection_control = #spirv.selection_control<DontFlatten>}
    return
  }
}

