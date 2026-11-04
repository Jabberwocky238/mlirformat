module {
  func.func @entry() -> i32 {
    %c0 = arith.constant 0 : index
    %c1_i8 = arith.constant 1 : i8
    %c1 = arith.constant 1 : index
    %0 = arm_sme.streaming_vl <byte>
    %alloca = memref.alloca(%0, %0) : memref<?x?xi8>
    scf.for %arg0 = %c0 to %0 step %c1 {
      scf.for %arg1 = %c0 to %0 step %c1 {
        memref.store %c1_i8, %alloca[%arg0, %arg1] : memref<?x?xi8>
      }
    }
    %c1_i64 = arith.constant 1 : i64
    %1 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c1_i64) -> (i64) {
      %5 = vector.load %alloca[%arg0, %c0] : memref<?x?xi8>, vector<[16]xi8>
      %6 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %c1_i64) -> (i64) {
        %8 = vector.extract %5[%arg2] : i8 from vector<[16]xi8>
        %9 = arith.extui %8 : i8 to i64
        %10 = arith.muli %arg3, %9 : i64
        scf.yield %10 : i64
      }
      %7 = arith.muli %arg1, %6 : i64
      scf.yield %7 : i64
    }
    vector.print %1 : i64
    %c3 = arith.constant 3 : index
    %c4_i8 = arith.constant 4 : i8
    %c7 = arith.constant 7 : index
    %c15_i8 = arith.constant 15 : i8
    memref.store %c4_i8, %alloca[%c3, %c7] : memref<?x?xi8>
    memref.store %c15_i8, %alloca[%c7, %c3] : memref<?x?xi8>
    %2 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c1_i64) -> (i64) {
      %5 = vector.load %alloca[%arg0, %c0] : memref<?x?xi8>, vector<[16]xi8>
      %6 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %c1_i64) -> (i64) {
        %8 = vector.extract %5[%arg2] : i8 from vector<[16]xi8>
        %9 = arith.extui %8 : i8 to i64
        %10 = arith.muli %arg3, %9 : i64
        scf.yield %10 : i64
      }
      %7 = arith.muli %arg1, %6 : i64
      scf.yield %7 : i64
    }
    vector.print %2 : i64
    %cst = arith.constant dense<0> : vector<[16]x[16]xi8>
    vector.transfer_write %cst, %alloca[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[16]xi8>, memref<?x?xi8>
    %c0_i8 = arith.constant 0 : i8
    %3 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c0_i8) -> (i8) {
      %5 = vector.load %alloca[%arg0, %c0] : memref<?x?xi8>, vector<[16]xi8>
      %6 = vector.reduction <add>, %5 : vector<[16]xi8> into i8
      %7 = arith.addi %arg1, %6 : i8
      scf.yield %7 : i8
    }
    vector.print %3 : i8
    memref.store %c4_i8, %alloca[%c3, %c7] : memref<?x?xi8>
    memref.store %c15_i8, %alloca[%c7, %c3] : memref<?x?xi8>
    %4 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c0_i8) -> (i8) {
      %5 = vector.load %alloca[%arg0, %c0] : memref<?x?xi8>, vector<[16]xi8>
      %6 = vector.reduction <add>, %5 : vector<[16]xi8> into i8
      %7 = arith.addi %arg1, %6 : i8
      scf.yield %7 : i8
    }
    vector.print %4 : i8
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

