module {
  func.func @blocks_prematurely_declared_dead_bug(%arg0: memref<?xf16>) {
    %cst = arith.constant dense<false> : vector<1xi1>
    %c1 = arith.constant 1 : index
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1xf16>
    %cst_1 = arith.constant 0.000000e+00 : f16
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %thread_id_x = gpu.thread_id x upper_bound 64
    %0 = test.with_bounds {smax = 112 : index, smin = 16 : index, umax = 112 : index, umin = 16 : index} : index
    %1 = arith.divui %0, %c16 : index
    %2 = arith.muli %1, %c16 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%3: index):  // 2 preds: ^bb0, ^bb7
    %4 = arith.cmpi slt, %3, %2 : index
    cf.cond_br %4, ^bb2, ^bb8
  ^bb2:  // pred: ^bb1
    %5 = arith.subi %2, %3 : index
    %6 = arith.minsi %5, %c64 : index
    %7 = arith.subi %6, %thread_id_x : index
    %8 = vector.constant_mask [1] : vector<1xi1>
    %9 = arith.cmpi sgt, %7, %c0 : index
    %10 = arith.select %9, %8, %cst : vector<1xi1>
    %11 = vector.extract %10[0] : i1 from vector<1xi1>
    %12 = vector.insert %11, %cst [0] : i1 into vector<1xi1>
    %13 = arith.addi %3, %thread_id_x : index
    cf.br ^bb3(%c0, %cst_0 : index, vector<1xf16>)
  ^bb3(%14: index, %15: vector<1xf16>):  // 2 preds: ^bb2, ^bb6
    %16 = arith.cmpi slt, %14, %c1 : index
    cf.cond_br %16, ^bb4, ^bb7
  ^bb4:  // pred: ^bb3
    %17 = vector.extract %12[%14] : i1 from vector<1xi1>
    cf.cond_br %17, ^bb5, ^bb6(%15 : vector<1xf16>)
  ^bb5:  // pred: ^bb4
    %18 = arith.addi %13, %14 : index
    %19 = memref.load %arg0[%18] : memref<?xf16>
    %20 = vector.insert %19, %15 [%14] : f16 into vector<1xf16>
    cf.br ^bb6(%20 : vector<1xf16>)
  ^bb6(%21: vector<1xf16>):  // 2 preds: ^bb4, ^bb5
    %22 = arith.addi %14, %c1 : index
    cf.br ^bb3(%22, %21 : index, vector<1xf16>)
  ^bb7:  // pred: ^bb3
    %23 = arith.addi %3, %c64 : index
    cf.br ^bb1(%23 : index)
  ^bb8:  // pred: ^bb1
    %24 = arith.cmpi eq, %thread_id_x, %c0 : index
    cf.cond_br %24, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    memref.store %cst_1, %arg0[%c0] : memref<?xf16>
    cf.br ^bb10
  ^bb10:  // 2 preds: ^bb8, ^bb9
    return
  }
}

