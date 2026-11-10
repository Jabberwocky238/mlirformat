module {
  func.func @alloca() {
    %alloca = memref.alloca() : memref<2xf32>
    return
  }
}

// -----
module {
  func.func @alloca_rank0() {
    %alloca = memref.alloca() : memref<f32>
    return
  }
}

// -----
module {
  func.func @memref_store(%arg0: memref<4x8xf32>, %arg1: f32, %arg2: index, %arg3: index) {
    memref.store %arg1, %arg0[%arg2, %arg3] : memref<4x8xf32>
    return
  }
}

// -----
module {
  func.func @memref_load(%arg0: memref<4x8xf32>, %arg1: index, %arg2: index) -> f32 {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<4x8xf32>
    return %0 : f32
  }
}

// -----
module @globals {
  memref.global "private" constant @internal_global : memref<3x7xf32> = dense<4.000000e+00>
  memref.global "private" constant @__constant_xi32 : memref<i32> = dense<-1>
  memref.global @public_global : memref<3x7xf32>
  memref.global @uninitialized_global : memref<3x7xf32> = uninitialized
  func.func @use_global() {
    %0 = memref.get_global @public_global : memref<3x7xf32>
    %1 = memref.get_global @__constant_xi32 : memref<i32>
    return
  }
}

// -----
module @rank0_globals {
  memref.global @extern_global : memref<f32>
  memref.global @uninitialized_global : memref<f32> = uninitialized
}

