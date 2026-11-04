module {
  func.func @spmv8x8(%arg0: memref<4xvector<8xf32>>, %arg1: memref<4xvector<8xi32>>, %arg2: memref<?xf32>, %arg3: memref<1xvector<8xf32>>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.constant_mask [8] : vector<8xi1>
    %1 = vector.broadcast %cst : f32 to vector<8xf32>
    %2 = memref.load %arg3[%c0] : memref<1xvector<8xf32>>
    %3 = scf.for %arg4 = %c0 to %c4 step %c1 iter_args(%arg5 = %2) -> (vector<8xf32>) {
      %4 = memref.load %arg0[%arg4] : memref<4xvector<8xf32>>
      %5 = memref.load %arg1[%arg4] : memref<4xvector<8xi32>>
      %6 = vector.gather %arg2[%c0] [%5], %0, %1 : memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
      %7 = vector.fma %4, %6, %arg5 : vector<8xf32>
      scf.yield %7 : vector<8xf32>
    }
    memref.store %3, %arg3[%c0] : memref<1xvector<8xf32>>
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
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<4xvector<8xf32>>
    %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<4xvector<8xi32>>
    %alloc_9 = memref.alloc(%c8) {alignment = 64 : i64} : memref<?xf32>
    %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<1xvector<8xf32>>
    %0 = vector.broadcast %cst_0 : f32 to vector<8xf32>
    %1 = vector.insert %cst_2, %0 [3] : f32 into vector<8xf32>
    %2 = vector.insert %cst_4, %1 [4] : f32 into vector<8xf32>
    %3 = vector.insert %cst_2, %2 [5] : f32 into vector<8xf32>
    %4 = vector.insert %cst_3, %3 [6] : f32 into vector<8xf32>
    %5 = vector.insert %cst_2, %4 [7] : f32 into vector<8xf32>
    memref.store %5, %alloc[%c0] : memref<4xvector<8xf32>>
    %6 = vector.insert %cst_1, %0 [0] : f32 into vector<8xf32>
    %7 = vector.insert %cst_7, %6 [1] : f32 into vector<8xf32>
    %8 = vector.insert %cst_1, %7 [2] : f32 into vector<8xf32>
    %9 = vector.insert %cst_1, %8 [5] : f32 into vector<8xf32>
    %10 = vector.insert %cst_6, %9 [6] : f32 into vector<8xf32>
    %11 = vector.insert %cst_1, %10 [7] : f32 into vector<8xf32>
    memref.store %11, %alloc[%c1] : memref<4xvector<8xf32>>
    %12 = vector.insert %cst_2, %0 [1] : f32 into vector<8xf32>
    %13 = vector.insert %cst_5, %12 [2] : f32 into vector<8xf32>
    memref.store %13, %alloc[%c2] : memref<4xvector<8xf32>>
    %14 = vector.insert %cst_1, %0 [2] : f32 into vector<8xf32>
    %15 = vector.insert %cst_1, %14 [5] : f32 into vector<8xf32>
    memref.store %15, %alloc[%c3] : memref<4xvector<8xf32>>
    %16 = vector.broadcast %c0_i32 : i32 to vector<8xi32>
    %17 = vector.insert %c2_i32, %16 [2] : i32 into vector<8xi32>
    %18 = vector.insert %c1_i32, %17 [3] : i32 into vector<8xi32>
    %19 = vector.insert %c1_i32, %18 [5] : i32 into vector<8xi32>
    %20 = vector.insert %c1_i32, %19 [7] : i32 into vector<8xi32>
    memref.store %20, %alloc_8[%c0] : memref<4xvector<8xi32>>
    %21 = vector.insert %c2_i32, %16 [0] : i32 into vector<8xi32>
    %22 = vector.insert %c1_i32, %21 [1] : i32 into vector<8xi32>
    %23 = vector.insert %c5_i32, %22 [2] : i32 into vector<8xi32>
    %24 = vector.insert %c3_i32, %23 [3] : i32 into vector<8xi32>
    %25 = vector.insert %c3_i32, %24 [4] : i32 into vector<8xi32>
    %26 = vector.insert %c4_i32, %25 [5] : i32 into vector<8xi32>
    %27 = vector.insert %c2_i32, %26 [6] : i32 into vector<8xi32>
    %28 = vector.insert %c3_i32, %27 [7] : i32 into vector<8xi32>
    memref.store %28, %alloc_8[%c1] : memref<4xvector<8xi32>>
    %29 = vector.insert %c5_i32, %16 [0] : i32 into vector<8xi32>
    %30 = vector.insert %c4_i32, %29 [1] : i32 into vector<8xi32>
    %31 = vector.insert %c6_i32, %30 [2] : i32 into vector<8xi32>
    %32 = vector.insert %c5_i32, %31 [3] : i32 into vector<8xi32>
    %33 = vector.insert %c4_i32, %32 [4] : i32 into vector<8xi32>
    %34 = vector.insert %c5_i32, %33 [5] : i32 into vector<8xi32>
    %35 = vector.insert %c4_i32, %34 [6] : i32 into vector<8xi32>
    %36 = vector.insert %c6_i32, %35 [7] : i32 into vector<8xi32>
    memref.store %36, %alloc_8[%c2] : memref<4xvector<8xi32>>
    %37 = vector.insert %c7_i32, %16 [0] : i32 into vector<8xi32>
    %38 = vector.insert %c6_i32, %37 [1] : i32 into vector<8xi32>
    %39 = vector.insert %c7_i32, %38 [2] : i32 into vector<8xi32>
    %40 = vector.insert %c7_i32, %39 [3] : i32 into vector<8xi32>
    %41 = vector.insert %c5_i32, %40 [4] : i32 into vector<8xi32>
    %42 = vector.insert %c6_i32, %41 [5] : i32 into vector<8xi32>
    %43 = vector.insert %c6_i32, %42 [6] : i32 into vector<8xi32>
    %44 = vector.insert %c7_i32, %43 [7] : i32 into vector<8xi32>
    memref.store %44, %alloc_8[%c3] : memref<4xvector<8xi32>>
    %45 = vector.broadcast %cst : f32 to vector<8xf32>
    memref.store %45, %alloc_10[%c0] : memref<1xvector<8xf32>>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %47 = arith.addi %arg0, %c1 : index
      %48 = arith.index_cast %47 : index to i32
      %49 = arith.sitofp %48 : i32 to f32
      memref.store %49, %alloc_9[%arg0] : memref<?xf32>
    }
    call @spmv8x8(%alloc, %alloc_8, %alloc_9, %alloc_10) : (memref<4xvector<8xf32>>, memref<4xvector<8xi32>>, memref<?xf32>, memref<1xvector<8xf32>>) -> ()
    scf.for %arg0 = %c0 to %c4 step %c1 {
      %47 = memref.load %alloc[%arg0] : memref<4xvector<8xf32>>
      vector.print %47 : vector<8xf32>
    }
    scf.for %arg0 = %c0 to %c4 step %c1 {
      %47 = memref.load %alloc_8[%arg0] : memref<4xvector<8xi32>>
      vector.print %47 : vector<8xi32>
    }
    %46 = memref.load %alloc_10[%c0] : memref<1xvector<8xf32>>
    vector.print %46 : vector<8xf32>
    memref.dealloc %alloc : memref<4xvector<8xf32>>
    memref.dealloc %alloc_8 : memref<4xvector<8xi32>>
    memref.dealloc %alloc_9 : memref<?xf32>
    memref.dealloc %alloc_10 : memref<1xvector<8xf32>>
    return
  }
}

