#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @spmv8x8(%arg0: memref<8xvector<4xf32>>, %arg1: memref<8xvector<4xi32>>, %arg2: memref<?xf32>, %arg3: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.constant_mask [4] : vector<4xi1>
    %1 = vector.broadcast %cst : f32 to vector<4xf32>
    scf.for %arg4 = %c0 to %c8 step %c1 {
      %2 = memref.load %arg0[%arg4] : memref<8xvector<4xf32>>
      %3 = memref.load %arg1[%arg4] : memref<8xvector<4xi32>>
      %4 = vector.gather %arg2[%c0] [%3], %0, %1 : memref<?xf32>, vector<4xi32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
      %5 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %2, %4, %cst : vector<4xf32>, vector<4xf32> into f32
      memref.store %5, %arg3[%arg4] : memref<?xf32>
    }
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 6.000000e+00 : f32
    %cst_6 = arith.constant 7.000000e+00 : f32
    %cst_7 = arith.constant 8.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %c5_i32 = arith.constant 5 : i32
    %c6_i32 = arith.constant 6 : i32
    %c7_i32 = arith.constant 7 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xvector<4xf32>>
    %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<8xvector<4xi32>>
    %alloc_9 = memref.alloc(%c8) {alignment = 64 : i64} : memref<?xf32>
    %alloc_10 = memref.alloc(%c8) {alignment = 64 : i64} : memref<?xf32>
    %0 = vector.broadcast %cst_0 : f32 to vector<4xf32>
    %1 = vector.insert %cst_1, %0 [1] : f32 into vector<4xf32>
    memref.store %1, %alloc[%c0] : memref<8xvector<4xf32>>
    %2 = vector.insert %cst_7, %0 [1] : f32 into vector<4xf32>
    %3 = vector.insert %cst_2, %2 [2] : f32 into vector<4xf32>
    memref.store %3, %alloc[%c1] : memref<8xvector<4xf32>>
    %4 = vector.insert %cst_1, %0 [1] : f32 into vector<4xf32>
    %5 = vector.insert %cst_5, %4 [2] : f32 into vector<4xf32>
    %6 = vector.insert %cst_1, %5 [3] : f32 into vector<4xf32>
    memref.store %6, %alloc[%c2] : memref<8xvector<4xf32>>
    %7 = vector.insert %cst_2, %0 [0] : f32 into vector<4xf32>
    memref.store %7, %alloc[%c3] : memref<8xvector<4xf32>>
    %8 = vector.insert %cst_4, %0 [0] : f32 into vector<4xf32>
    memref.store %8, %alloc[%c4] : memref<8xvector<4xf32>>
    %9 = vector.insert %cst_2, %0 [0] : f32 into vector<4xf32>
    %10 = vector.insert %cst_1, %9 [1] : f32 into vector<4xf32>
    %11 = vector.insert %cst_1, %10 [3] : f32 into vector<4xf32>
    memref.store %11, %alloc[%c5] : memref<8xvector<4xf32>>
    %12 = vector.insert %cst_3, %0 [0] : f32 into vector<4xf32>
    %13 = vector.insert %cst_6, %12 [1] : f32 into vector<4xf32>
    memref.store %13, %alloc[%c6] : memref<8xvector<4xf32>>
    %14 = vector.insert %cst_2, %0 [0] : f32 into vector<4xf32>
    %15 = vector.insert %cst_1, %14 [1] : f32 into vector<4xf32>
    memref.store %15, %alloc[%c7] : memref<8xvector<4xf32>>
    %16 = vector.broadcast %c0_i32 : i32 to vector<4xi32>
    %17 = vector.insert %c2_i32, %16 [1] : i32 into vector<4xi32>
    %18 = vector.insert %c5_i32, %17 [2] : i32 into vector<4xi32>
    %19 = vector.insert %c7_i32, %18 [3] : i32 into vector<4xi32>
    memref.store %19, %alloc_8[%c0] : memref<8xvector<4xi32>>
    %20 = vector.insert %c1_i32, %16 [1] : i32 into vector<4xi32>
    %21 = vector.insert %c4_i32, %20 [2] : i32 into vector<4xi32>
    %22 = vector.insert %c6_i32, %21 [3] : i32 into vector<4xi32>
    memref.store %22, %alloc_8[%c1] : memref<8xvector<4xi32>>
    %23 = vector.insert %c2_i32, %16 [0] : i32 into vector<4xi32>
    %24 = vector.insert %c5_i32, %23 [1] : i32 into vector<4xi32>
    %25 = vector.insert %c6_i32, %24 [2] : i32 into vector<4xi32>
    %26 = vector.insert %c7_i32, %25 [3] : i32 into vector<4xi32>
    memref.store %26, %alloc_8[%c2] : memref<8xvector<4xi32>>
    %27 = vector.insert %c1_i32, %16 [0] : i32 into vector<4xi32>
    %28 = vector.insert %c3_i32, %27 [1] : i32 into vector<4xi32>
    %29 = vector.insert %c5_i32, %28 [2] : i32 into vector<4xi32>
    %30 = vector.insert %c7_i32, %29 [3] : i32 into vector<4xi32>
    memref.store %30, %alloc_8[%c3] : memref<8xvector<4xi32>>
    %31 = vector.insert %c3_i32, %16 [1] : i32 into vector<4xi32>
    %32 = vector.insert %c4_i32, %31 [2] : i32 into vector<4xi32>
    %33 = vector.insert %c5_i32, %32 [3] : i32 into vector<4xi32>
    memref.store %33, %alloc_8[%c4] : memref<8xvector<4xi32>>
    %34 = vector.insert %c1_i32, %16 [0] : i32 into vector<4xi32>
    %35 = vector.insert %c4_i32, %34 [1] : i32 into vector<4xi32>
    %36 = vector.insert %c5_i32, %35 [2] : i32 into vector<4xi32>
    %37 = vector.insert %c6_i32, %36 [3] : i32 into vector<4xi32>
    memref.store %37, %alloc_8[%c5] : memref<8xvector<4xi32>>
    %38 = vector.insert %c2_i32, %16 [1] : i32 into vector<4xi32>
    %39 = vector.insert %c4_i32, %38 [2] : i32 into vector<4xi32>
    %40 = vector.insert %c6_i32, %39 [3] : i32 into vector<4xi32>
    memref.store %40, %alloc_8[%c6] : memref<8xvector<4xi32>>
    %41 = vector.insert %c1_i32, %16 [0] : i32 into vector<4xi32>
    %42 = vector.insert %c3_i32, %41 [1] : i32 into vector<4xi32>
    %43 = vector.insert %c6_i32, %42 [2] : i32 into vector<4xi32>
    %44 = vector.insert %c7_i32, %43 [3] : i32 into vector<4xi32>
    memref.store %44, %alloc_8[%c7] : memref<8xvector<4xi32>>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %45 = arith.addi %arg0, %c1 : index
      %46 = arith.index_cast %45 : index to i32
      %47 = arith.sitofp %46 : i32 to f32
      memref.store %47, %alloc_9[%arg0] : memref<?xf32>
      memref.store %cst, %alloc_10[%arg0] : memref<?xf32>
    }
    call @spmv8x8(%alloc, %alloc_8, %alloc_9, %alloc_10) : (memref<8xvector<4xf32>>, memref<8xvector<4xi32>>, memref<?xf32>, memref<?xf32>) -> ()
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %45 = memref.load %alloc[%arg0] : memref<8xvector<4xf32>>
      vector.print %45 : vector<4xf32>
    }
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %45 = memref.load %alloc_8[%arg0] : memref<8xvector<4xi32>>
      vector.print %45 : vector<4xi32>
    }
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %45 = memref.load %alloc_10[%arg0] : memref<?xf32>
      vector.print %45 : f32
    }
    memref.dealloc %alloc : memref<8xvector<4xf32>>
    memref.dealloc %alloc_8 : memref<8xvector<4xi32>>
    memref.dealloc %alloc_9 : memref<?xf32>
    memref.dealloc %alloc_10 : memref<?xf32>
    return
  }
}

