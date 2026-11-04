module {
  func.func @scatter8(%arg0: memref<?xf32>, %arg1: vector<8xi32>, %arg2: vector<8xi1>, %arg3: vector<8xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>
    return
  }
  func.func @printmem8(%arg0: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<8xf32>
    %1 = scf.for %arg1 = %c0 to %c8 step %c1 iter_args(%arg2 = %0) -> (vector<8xf32>) {
      %2 = memref.load %arg0[%arg1] : memref<?xf32>
      %3 = vector.insert %2, %arg2 [%arg1] : f32 into vector<8xf32>
      scf.yield %3 : vector<8xf32>
    }
    vector.print %1 : vector<8xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %alloc = memref.alloc(%c8) : memref<?xf32>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %20 = arith.index_cast %arg0 : index to i32
      %21 = arith.sitofp %20 : i32 to f32
      memref.store %21, %alloc[%arg0] : memref<?xf32>
    }
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %c5_i32 = arith.constant 5 : i32
    %c6_i32 = arith.constant 6 : i32
    %c7_i32 = arith.constant 7 : i32
    %0 = vector.broadcast %c7_i32 : i32 to vector<8xi32>
    %1 = vector.insert %c0_i32, %0 [1] : i32 into vector<8xi32>
    %2 = vector.insert %c1_i32, %1 [2] : i32 into vector<8xi32>
    %3 = vector.insert %c6_i32, %2 [3] : i32 into vector<8xi32>
    %4 = vector.insert %c2_i32, %3 [4] : i32 into vector<8xi32>
    %5 = vector.insert %c4_i32, %4 [5] : i32 into vector<8xi32>
    %6 = vector.insert %c5_i32, %5 [6] : i32 into vector<8xi32>
    %7 = vector.insert %c3_i32, %6 [7] : i32 into vector<8xi32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 6.000000e+00 : f32
    %cst_6 = arith.constant 7.000000e+00 : f32
    %8 = vector.broadcast %cst : f32 to vector<8xf32>
    %9 = vector.insert %cst_0, %8 [1] : f32 into vector<8xf32>
    %10 = vector.insert %cst_1, %9 [2] : f32 into vector<8xf32>
    %11 = vector.insert %cst_2, %10 [3] : f32 into vector<8xf32>
    %12 = vector.insert %cst_3, %11 [4] : f32 into vector<8xf32>
    %13 = vector.insert %cst_4, %12 [5] : f32 into vector<8xf32>
    %14 = vector.insert %cst_5, %13 [6] : f32 into vector<8xf32>
    %15 = vector.insert %cst_6, %14 [7] : f32 into vector<8xf32>
    %true = arith.constant true
    %16 = vector.constant_mask [0] : vector<8xi1>
    %17 = vector.constant_mask [4] : vector<8xi1>
    %18 = vector.insert %true, %17 [7] : i1 into vector<8xi1>
    %19 = vector.constant_mask [8] : vector<8xi1>
    vector.print %7 : vector<8xi32>
    call @printmem8(%alloc) : (memref<?xf32>) -> ()
    call @scatter8(%alloc, %7, %16, %15) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    call @printmem8(%alloc) : (memref<?xf32>) -> ()
    call @scatter8(%alloc, %7, %17, %15) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    call @printmem8(%alloc) : (memref<?xf32>) -> ()
    call @scatter8(%alloc, %7, %18, %15) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    call @printmem8(%alloc) : (memref<?xf32>) -> ()
    call @scatter8(%alloc, %7, %19, %15) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    call @printmem8(%alloc) : (memref<?xf32>) -> ()
    memref.dealloc %alloc : memref<?xf32>
    return
  }
}

