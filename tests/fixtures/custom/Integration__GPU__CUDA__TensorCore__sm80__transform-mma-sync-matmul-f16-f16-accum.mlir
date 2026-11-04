module {
  func.func @compute_linspace_val(%arg0: index, %arg1: index, %arg2: index) -> f16 {
    %0 = arith.index_cast %arg0 : index to i32
    %1 = arith.index_cast %arg1 : index to i32
    %2 = arith.index_cast %arg2 : index to i32
    %3 = arith.muli %0, %2 : i32
    %4 = arith.addi %1, %3 : i32
    %5 = arith.sitofp %4 : i32 to f16
    %cst = arith.constant 6.400000e+01 : f16
    %6 = arith.divf %5, %cst : f16
    return %6 : f16
  }
  func.func @print_lhs_as_memref_32(%arg0: memref<16x16xf16>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<16x16xf16>
    %dim_0 = memref.dim %arg0, %c1 : memref<16x16xf16>
    %alloc = memref.alloc(%dim, %dim_0) : memref<?x?xf32>
    scf.for %arg1 = %c0 to %dim step %c1 {
      scf.for %arg2 = %c0 to %dim_0 step %c1 {
        %0 = memref.load %arg0[%arg1, %arg2] : memref<16x16xf16>
        %1 = arith.extf %0 : f16 to f32
        memref.store %1, %alloc[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    %cast = memref.cast %alloc : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<?x?xf32>
    return
  }
  func.func @print_rhs_as_memref_32(%arg0: memref<16x8xf16>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<16x8xf16>
    %dim_0 = memref.dim %arg0, %c1 : memref<16x8xf16>
    %alloc = memref.alloc(%dim, %dim_0) : memref<?x?xf32>
    scf.for %arg1 = %c0 to %dim step %c1 {
      scf.for %arg2 = %c0 to %dim_0 step %c1 {
        %0 = memref.load %arg0[%arg1, %arg2] : memref<16x8xf16>
        %1 = arith.extf %0 : f16 to f32
        memref.store %1, %alloc[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    %cast = memref.cast %alloc : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<?x?xf32>
    return
  }
  func.func @print_res_as_memref_32(%arg0: memref<16x8xf16>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<16x8xf16>
    %dim_0 = memref.dim %arg0, %c1 : memref<16x8xf16>
    %alloc = memref.alloc(%dim, %dim_0) : memref<?x?xf32>
    scf.for %arg1 = %c0 to %dim step %c1 {
      scf.for %arg2 = %c0 to %dim_0 step %c1 {
        %0 = memref.load %arg0[%arg1, %arg2] : memref<16x8xf16>
        %1 = arith.extf %0 : f16 to f32
        memref.store %1, %alloc[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    %cast = memref.cast %alloc : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<?x?xf32>
    return
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<16x16xf16>
    %alloc_0 = memref.alloc() : memref<16x8xf16>
    %alloc_1 = memref.alloc() : memref<16x8xf16>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %alloc_1, %c0 : memref<16x8xf16>
    %dim_2 = memref.dim %alloc_1, %c1 : memref<16x8xf16>
    %dim_3 = memref.dim %alloc, %c1 : memref<16x16xf16>
    %cst = arith.constant 1.000000e+00 : f16
    %cst_4 = arith.constant 0.000000e+00 : f16
    %c32 = arith.constant 32 : index
    scf.for %arg0 = %c0 to %dim step %c1 {
      scf.for %arg1 = %c0 to %dim_3 step %c1 {
        %0 = func.call @compute_linspace_val(%arg0, %arg1, %dim_3) : (index, index, index) -> f16
        memref.store %0, %alloc[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    scf.for %arg0 = %c0 to %dim_3 step %c1 {
      scf.for %arg1 = %c0 to %dim_2 step %c1 {
        %0 = func.call @compute_linspace_val(%arg0, %arg1, %dim_2) : (index, index, index) -> f16
        memref.store %0, %alloc_0[%arg0, %arg1] : memref<16x8xf16>
      }
    }
    scf.for %arg0 = %c0 to %dim step %c1 {
      scf.for %arg1 = %c0 to %dim_2 step %c1 {
        %0 = func.call @compute_linspace_val(%arg0, %arg1, %dim_2) : (index, index, index) -> f16
        memref.store %0, %alloc_1[%arg0, %arg1] : memref<16x8xf16>
      }
    }
    %cast = memref.cast %alloc : memref<16x16xf16> to memref<*xf16>
    %cast_5 = memref.cast %alloc_0 : memref<16x8xf16> to memref<*xf16>
    %cast_6 = memref.cast %alloc_1 : memref<16x8xf16> to memref<*xf16>
    gpu.host_register %cast : memref<*xf16>
    gpu.host_register %cast_5 : memref<*xf16>
    gpu.host_register %cast_6 : memref<*xf16>
    call @print_lhs_as_memref_32(%alloc) : (memref<16x16xf16>) -> ()
    call @print_rhs_as_memref_32(%alloc_0) : (memref<16x8xf16>) -> ()
    call @print_res_as_memref_32(%alloc_1) : (memref<16x8xf16>) -> ()
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c1, %arg11 = %c1) {
      linalg.matmul ins(%alloc, %alloc_0 : memref<16x16xf16>, memref<16x8xf16>) outs(%alloc_1 : memref<16x8xf16>)
      gpu.terminator
    }
    call @print_res_as_memref_32(%alloc_1) : (memref<16x8xf16>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.nvgpu.rewrite_matmul_as_mma_sync %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

