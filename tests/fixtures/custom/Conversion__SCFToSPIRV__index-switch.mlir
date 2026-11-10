module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @switch_no_result(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    scf.index_switch %arg1 
    case 2 {
      memref.store %cst, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      scf.yield
    }
    default {
    }
    return
  }
  func.func @switch_yield(%arg0: index) -> i32 {
    %0 = scf.index_switch %arg0 -> i32 
    case 2 {
      %c10_i32 = arith.constant 10 : i32
      scf.yield %c10_i32 : i32
    }
    case 5 {
      %c20_i32 = arith.constant 20 : i32
      scf.yield %c20_i32 : i32
    }
    default {
      %c30_i32 = arith.constant 30 : i32
      scf.yield %c30_i32 : i32
    }
    return %0 : i32
  }
  func.func @switch_selection_control(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    scf.index_switch %arg1 {spirv.selection_control = #spirv.selection_control<Flatten>} 
    case 2 {
      memref.store %cst, %arg0[%c0] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      scf.yield
    }
    default {
    }
    return
  }
}

