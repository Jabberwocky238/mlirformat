module {
  func.func @view(%arg0: index, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<2048xi8>
    %view = memref.view %alloc[%arg2][%arg0, %arg1] : memref<2048xi8> to memref<?x?xf32>
    %view_0 = memref.view %alloc[%arg2][%arg1] : memref<2048xi8> to memref<4x?xf32>
    %view_1 = memref.view %alloc[%arg2][] : memref<2048xi8> to memref<64x4xf32>
    %alloc_2 = memref.alloc() : memref<2048xi8, 4>
    %view_3 = memref.view %alloc_2[%arg2][] : memref<2048xi8, 4> to memref<64x4xf32, 4>
    return
  }
}

// -----
module {
  func.func @view_empty_memref(%arg0: index, %arg1: memref<0xi8>) {
    %view = memref.view %arg1[%arg0][] : memref<0xi8> to memref<0x4xf32>
    return
  }
}

// -----
module {
  func.func @view_memref_as_rank0(%arg0: index, %arg1: memref<2xi8>) {
    %view = memref.view %arg1[%arg0][] : memref<2xi8> to memref<bf16>
    return
  }
}

// -----
module {
  func.func @subview(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @assume_alignment(%arg0: memref<4x4xf16>) {
    %assume_align = memref.assume_alignment %arg0, 16 : memref<4x4xf16>
    return
  }
}

// -----
module {
  func.func @distinct_objects(%arg0: memref<?xf16>, %arg1: memref<?xf32>, %arg2: memref<?xf64>) -> (memref<?xf16>, memref<?xf32>, memref<?xf64>) {
    %0:3 = memref.distinct_objects %arg0, %arg1, %arg2 : memref<?xf16>, memref<?xf32>, memref<?xf64>
    return %0#0, %0#1, %0#2 : memref<?xf16>, memref<?xf32>, memref<?xf64>
  }
}

// -----
module {
  func.func @distinct_objects_noop(%arg0: memref<?xf16>) -> memref<?xf16> {
    %0 = memref.distinct_objects %arg0 : memref<?xf16>
    return %0 : memref<?xf16>
  }
}

// -----
module {
  func.func @assume_alignment_w_offset(%arg0: memref<4x4xf16, strided<[?, ?], offset: ?>>) {
    %assume_align = memref.assume_alignment %arg0, 16 : memref<4x4xf16, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @dim_of_unranked(%arg0: memref<*xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<*xi32>
    return %dim : index
  }
}

// -----
module {
  func.func @address_space(%arg0: memref<32xf32, 7>) {
    %alloc = memref.alloc() : memref<32xf32, 5>
    %c7 = arith.constant 7 : index
    %0 = memref.load %alloc[%c7] : memref<32xf32, 5>
    return
  }
}

// -----
module {
  func.func @transpose(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    %transpose = memref.transpose %arg0 (d0, d1, d2) -> (d2, d0, d1) : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>> to memref<?x?x?xf32, strided<[1, ?, ?], offset: ?>>
    return
  }
}

// -----
module {
  memref.global @gv0 : memref<2xf32> = uninitialized
  memref.global "private" @gv1 : memref<2xf32>
  memref.global @gv2 : memref<2x3xf32> = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]>
  func.func @get_gv0_memref() {
    %0 = memref.get_global @gv0 : memref<2xf32>
    return
  }
  func.func @get_gv2_memref() {
    %0 = memref.get_global @gv2 : memref<2x3xf32>
    return
  }
  memref.global @gv3 : memref<f32> = dense<1.000000e+00>
  func.func @get_gv3_memref() {
    %0 = memref.get_global @gv3 : memref<f32>
    return
  }
  memref.global "private" @gv4 : memref<f32> = dense<1.000000e+00> {alignment = 64 : i64}
}

// -----
module {
  func.func @expand_shape_static(%arg0: memref<3x4x5xf32>) -> memref<1x3x4x1x5xf32> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2], [3, 4]] output_shape [1, 3, 4, 1, 5] : memref<3x4x5xf32> into memref<1x3x4x1x5xf32>
    return %expand_shape : memref<1x3x4x1x5xf32>
  }
}

// -----
module {
  func.func @collapse_shape_static(%arg0: memref<1x3x4x1x5xf32>) -> memref<3x4x5xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : memref<1x3x4x1x5xf32> into memref<3x4x5xf32>
    return %collapse_shape : memref<3x4x5xf32>
  }
}

// -----
module {
  func.func @rank_of_unranked(%arg0: memref<*xi32>) {
    %0 = memref.rank %arg0 : memref<*xi32>
    return
  }
}

// -----
module {
  func.func @rank_of_ranked(%arg0: memref<?xi32>) {
    %0 = memref.rank %arg0 : memref<?xi32>
    return
  }
}

// -----
module {
  func.func @atomic_rmw(%arg0: memref<10xi32>, %arg1: i32, %arg2: memref<10xf32>, %arg3: f32, %arg4: index) {
    %0 = memref.atomic_rmw assign %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %1 = memref.atomic_rmw addi %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %2 = memref.atomic_rmw maxs %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %3 = memref.atomic_rmw mins %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %4 = memref.atomic_rmw maxu %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %5 = memref.atomic_rmw minu %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %6 = memref.atomic_rmw addf %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %7 = memref.atomic_rmw maximumf %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %8 = memref.atomic_rmw maxnumf %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %9 = memref.atomic_rmw minimumf %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %10 = memref.atomic_rmw minnumf %arg3, %arg2[%arg4] : (f32, memref<10xf32>) -> f32
    %11 = memref.atomic_rmw ori %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %12 = memref.atomic_rmw andi %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    %13 = memref.atomic_rmw xori %arg1, %arg0[%arg4] : (i32, memref<10xi32>) -> i32
    return
  }
}

// -----
module {
  func.func @atomic_rmw_with_offset(%arg0: memref<10xi32, strided<[1], offset: 5>>, %arg1: i32, %arg2: index) {
    %0 = memref.atomic_rmw andi %arg1, %arg0[%arg2] : (i32, memref<10xi32, strided<[1], offset: 5>>) -> i32
    return
  }
}

// -----
module {
  llvm.func @generic_atomic_rmw() {
    %0 = "test.foo"() : () -> memref<10xi32>
    %1 = "test.foo"() : () -> index
    %2 = memref.generic_atomic_rmw %0[%1] : memref<10xi32> {
    ^bb0(%arg0: i32):
      memref.atomic_yield %arg0 : i32
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @generic_atomic_rmw_in_alloca_scope() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<2x3xi32>
    memref.alloca_scope  {
      %0 = memref.generic_atomic_rmw %alloc[%c1, %c1] : memref<2x3xi32> {
      ^bb0(%arg0: i32):
        memref.atomic_yield %arg0 : i32
      }
    }
    llvm.return
  }
}

// -----
module {
  func.func @memref_copy_ranked() {
    %alloc = memref.alloc() : memref<2xf32>
    %cast = memref.cast %alloc : memref<2xf32> to memref<?xf32>
    %alloc_0 = memref.alloc() : memref<2xf32>
    %cast_1 = memref.cast %alloc_0 : memref<2xf32> to memref<?xf32>
    memref.copy %cast, %cast_1 : memref<?xf32> to memref<?xf32>
    return
  }
}

// -----
module {
  func.func @memref_copy_contiguous(%arg0: memref<16x4xi32>, %arg1: index) {
    %alloc = memref.alloc() : memref<1x2xi32>
    %subview = memref.subview %arg0[%arg1, 0] [1, 2] [1, 1] : memref<16x4xi32> to memref<1x2xi32, strided<[4, 1], offset: ?>>
    memref.copy %subview, %alloc : memref<1x2xi32, strided<[4, 1], offset: ?>> to memref<1x2xi32>
    return
  }
}

// -----
module {
  func.func @memref_copy_0d_offset(%arg0: memref<2xi32>) {
    %alloc = memref.alloc() : memref<i32>
    %subview = memref.subview %arg0[1] [1] [1] : memref<2xi32> to memref<1xi32, strided<[1], offset: 1>>
    %collapse_shape = memref.collapse_shape %subview [] : memref<1xi32, strided<[1], offset: 1>> into memref<i32, strided<[], offset: 1>>
    memref.copy %collapse_shape, %alloc : memref<i32, strided<[], offset: 1>> to memref<i32>
    return
  }
}

// -----
module {
  func.func @memref_copy_noncontiguous(%arg0: memref<16x2xi32>, %arg1: index) {
    %alloc = memref.alloc() : memref<2x1xi32>
    %subview = memref.subview %arg0[%arg1, 0] [2, 1] [1, 1] : memref<16x2xi32> to memref<2x1xi32, strided<[2, 1], offset: ?>>
    memref.copy %subview, %alloc : memref<2x1xi32, strided<[2, 1], offset: ?>> to memref<2x1xi32>
    return
  }
}

// -----
module {
  func.func @memref_copy_unranked() {
    %alloc = memref.alloc() : memref<2xi1>
    %cast = memref.cast %alloc : memref<2xi1> to memref<*xi1>
    %alloc_0 = memref.alloc() : memref<2xi1>
    %cast_1 = memref.cast %alloc_0 : memref<2xi1> to memref<*xi1>
    memref.copy %cast, %cast_1 : memref<*xi1> to memref<*xi1>
    return
  }
}

// -----
module {
  func.func @extract_aligned_pointer_as_index(%arg0: memref<?xf32>) -> index {
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<?xf32> -> index
    return %intptr : index
  }
}

// -----
module {
  func.func @extract_aligned_pointer_as_index_unranked(%arg0: memref<*xf32>) -> index {
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<*xf32> -> index
    return %intptr : index
  }
}

// -----
module {
  func.func @extract_strided_metadata(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>) {
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<?x?xf32, strided<[?, ?], offset: ?>> -> memref<f32>, index, index, index, index, index
    return
  }
}

// -----
module {
  func.func @load_non_temporal(%arg0: memref<32xf32>) {
    %c7 = arith.constant 7 : index
    %0 = memref.load %arg0[%c7] {nontemporal = true} : memref<32xf32>
    return
  }
}

// -----
module {
  func.func @load_with_alignment(%arg0: memref<32xf32>, %arg1: index) {
    %0 = memref.load %arg0[%arg1] {alignment = 32 : i64} : memref<32xf32>
    return
  }
}

// -----
module {
  func.func @store_non_temporal(%arg0: memref<32xf32>, %arg1: memref<32xf32>) {
    %c7 = arith.constant 7 : index
    %0 = memref.load %arg0[%c7] {nontemporal = true} : memref<32xf32>
    memref.store %0, %arg1[%c7] {nontemporal = true} : memref<32xf32>
    return
  }
}

// -----
module {
  func.func @store_with_alignment(%arg0: memref<32xf32>, %arg1: f32, %arg2: index) {
    memref.store %arg1, %arg0[%arg2] {alignment = 32 : i64} : memref<32xf32>
    return
  }
}

// -----
module {
  func.func @alloca_unconvertable_memory_space() {
    %alloca = memref.alloca() : memref<1x32x33xi32, #spirv.storage_class<StorageBuffer>>
    return
  }
}

