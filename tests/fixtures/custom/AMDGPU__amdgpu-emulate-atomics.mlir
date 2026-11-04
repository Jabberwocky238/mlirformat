module {
}

// -----
module {
  func.func @atomic_fmax(%arg0: f32, %arg1: memref<?xf32>, %arg2: i32) {
    gpu.printf "Begin\0A"
    amdgpu.raw_buffer_atomic_fmax {foo, indexOffset = 4 : i32} %arg0 -> %arg1[%arg2] : f32 -> memref<?xf32>, i32
    gpu.printf "End\0A"
    return
  }
}

// -----
module {
  func.func @atomic_fmax_f64(%arg0: f64, %arg1: memref<?xf64>, %arg2: i32) {
    gpu.printf "Begin\0A"
    amdgpu.raw_buffer_atomic_fmax %arg0 -> %arg1[%arg2] : f64 -> memref<?xf64>, i32
    gpu.printf "End\0A"
    return
  }
}

// -----
module {
  func.func @atomic_fadd(%arg0: f32, %arg1: memref<?xf32>, %arg2: i32) {
    amdgpu.raw_buffer_atomic_fadd %arg0 -> %arg1[%arg2] : f32 -> memref<?xf32>, i32
    return
  }
  func.func @atomic_fadd_v2f16(%arg0: vector<2xf16>, %arg1: memref<?xf16>, %arg2: i32) {
    amdgpu.raw_buffer_atomic_fadd %arg0 -> %arg1[%arg2] : vector<2xf16> -> memref<?xf16>, i32
    return
  }
  func.func @atomic_fadd_v2bf16(%arg0: vector<2xbf16>, %arg1: memref<?xbf16>, %arg2: i32) {
    amdgpu.raw_buffer_atomic_fadd %arg0 -> %arg1[%arg2] : vector<2xbf16> -> memref<?xbf16>, i32
    return
  }
}

