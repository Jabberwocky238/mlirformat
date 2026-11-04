module {
  gpu.module @kernel {
    gpu.func @private(%arg0: f32) private(%arg1 : memref<4xf32, #gpu.address_space<private>>) {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<4xf32, #gpu.address_space<private>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @workgroup(%arg0: f32) workgroup(%arg1 : memref<4xf32, #gpu.address_space<workgroup>>) {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<4xf32, #gpu.address_space<workgroup>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @nested_memref(%arg0: memref<4xmemref<4xf32, #gpu.address_space<global>>, #gpu.address_space<global>>) -> f32 {
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0] : memref<4xmemref<4xf32, #gpu.address_space<global>>, #gpu.address_space<global>>
      %1 = memref.load %0[%c0] : memref<4xf32, #gpu.address_space<global>>
      gpu.return %1 : f32
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @dynamic_shmem_with_vector(%arg0: memref<1xf32>) {
      %c0 = arith.constant 0 : index
      %0 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %0[%c0][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<1xf32, #gpu.address_space<workgroup>>
      %1 = vector.load %view[%c0] : memref<1xf32, #gpu.address_space<workgroup>>, vector<1xf32>
      vector.store %1, %arg0[%c0] : memref<1xf32>, vector<1xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @dynamic_shmem(%arg0: f32) {
      %c0 = arith.constant 0 : index
      %0 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %0[%c0][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<4xf32, #gpu.address_space<workgroup>>
      memref.store %arg0, %view[%c0] : memref<4xf32, #gpu.address_space<workgroup>>
      gpu.return
    }
  }
}

