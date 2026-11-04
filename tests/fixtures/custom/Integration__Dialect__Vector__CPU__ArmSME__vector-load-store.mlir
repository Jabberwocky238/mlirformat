module {
  func.func @za0_d_f64() -> i32 {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 1.000000e+00 : f64
    %c1 = arith.constant 1 : index
    %0 = arm_sme.streaming_vl <double>
    %alloca = memref.alloca(%0, %0) : memref<?x?xf64>
    %cst_1 = arith.constant 1.000000e-01 : f64
    %1 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %cst_1) -> (f64) {
      %6 = vector.broadcast %arg1 : f64 to vector<[2]xf64>
      vector.store %6, %alloca[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      %7 = arith.addf %arg1, %cst_0 : f64
      scf.yield %7 : f64
    }
    scf.for %arg0 = %c0 to %0 step %c1 {
      %6 = vector.load %alloca[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      vector.print %6 : vector<[2]xf64>
    }
    %2 = vector.load %alloca[%c0, %c0] : memref<?x?xf64>, vector<[2]x[2]xf64>
    %alloca_2 = memref.alloca(%0, %0) : memref<?x?xf64>
    scf.for %arg0 = %c0 to %0 step %c1 {
      scf.for %arg1 = %c0 to %0 step %c1 {
        memref.store %cst, %alloca_2[%arg0, %arg1] : memref<?x?xf64>
      }
    }
    %cst_3 = arith.constant 0.000000e+00 : f64
    %3 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %cst_3) -> (f64) {
      %6 = vector.load %alloca_2[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      %7 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %cst_3) -> (f64) {
        %9 = vector.extract %6[%arg2] : f64 from vector<[2]xf64>
        %10 = arith.addf %arg3, %9 : f64
        scf.yield %10 : f64
      }
      %8 = arith.addf %arg1, %7 : f64
      scf.yield %8 : f64
    }
    vector.print %3 : f64
    scf.for %arg0 = %c0 to %0 step %c1 {
      %6 = vector.load %alloca_2[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      vector.print %6 : vector<[2]xf64>
    }
    %c1_i64 = arith.constant 1 : i64
    %4 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c1_i64) -> (i64) {
      %6 = vector.load %alloca[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      %7 = vector.load %alloca_2[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      %8 = arith.cmpf one, %6, %7 : vector<[2]xf64>
      %9 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %c1_i64) -> (i64) {
        %11 = vector.extract %8[%arg2] : i1 from vector<[2]xi1>
        %12 = arith.extui %11 : i1 to i64
        %13 = arith.muli %arg3, %12 : i64
        scf.yield %13 : i64
      }
      %10 = arith.muli %arg1, %9 : i64
      scf.yield %10 : i64
    }
    vector.print %4 : i64
    vector.store %2, %alloca_2[%c0, %c0] : memref<?x?xf64>, vector<[2]x[2]xf64>
    %5 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c1_i64) -> (i64) {
      %6 = vector.load %alloca[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      %7 = vector.load %alloca_2[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      %8 = arith.cmpf oeq, %6, %7 : vector<[2]xf64>
      %9 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %c1_i64) -> (i64) {
        %11 = vector.extract %8[%arg2] : i1 from vector<[2]xi1>
        %12 = arith.extui %11 : i1 to i64
        %13 = arith.muli %arg3, %12 : i64
        scf.yield %13 : i64
      }
      %10 = arith.muli %arg1, %9 : i64
      scf.yield %10 : i64
    }
    vector.print %5 : i64
    scf.for %arg0 = %c0 to %0 step %c1 {
      %6 = vector.load %alloca_2[%arg0, %c0] : memref<?x?xf64>, vector<[2]xf64>
      vector.print %6 : vector<[2]xf64>
    }
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
  func.func @load_store_two_za_s_tiles() -> i32 {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = arm_sme.streaming_vl <word>
    %1 = arith.muli %0, %c2 : index
    %alloca = memref.alloca(%1, %0) : memref<?x?xi32>
    scf.for %arg0 = %c0 to %1 step %c1 {
      %4 = arith.cmpi ult, %arg0, %0 : index
      %5 = scf.if %4 -> (i32) {
        scf.yield %c1_i32 : i32
      } else {
        scf.yield %c2_i32 : i32
      }
      %6 = vector.broadcast %5 : i32 to vector<[4]xi32>
      vector.store %6, %alloca[%arg0, %c0] : memref<?x?xi32>, vector<[4]xi32>
    }
    scf.for %arg0 = %c0 to %1 step %c1 {
      %4 = vector.load %alloca[%arg0, %c0] : memref<?x?xi32>, vector<[4]xi32>
      vector.print %4 : vector<[4]xi32>
    }
    %2 = vector.load %alloca[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    %3 = vector.load %alloca[%0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    %alloca_0 = memref.alloca(%1, %0) : memref<?x?xi32>
    scf.for %arg0 = %c0 to %1 step %c1 {
      memref.store %c0_i32, %alloca_0[%arg0, %c0] : memref<?x?xi32>
    }
    vector.store %3, %alloca_0[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    vector.store %2, %alloca_0[%0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    vector.print str "TILE BEGIN\0A"
    scf.for %arg0 = %c0 to %1 step %c1 {
      %4 = vector.load %alloca_0[%arg0, %c0] : memref<?x?xi32>, vector<[4]xi32>
      vector.print %4 : vector<[4]xi32>
      %5 = arith.subi %0, %c1 : index
      %6 = arith.cmpi eq, %arg0, %0 : index
      scf.if %6 {
        vector.print str "TILE END\0A"
        vector.print str "TILE BEGIN\0A"
      }
    }
    vector.print str "TILE END\0A"
    return %c0_i32 : i32
  }
}

