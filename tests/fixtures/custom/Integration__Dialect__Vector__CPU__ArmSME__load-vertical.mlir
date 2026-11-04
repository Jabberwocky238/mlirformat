module {
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_i32 = arith.constant 1 : i32
    %0 = arm_sme.streaming_vl <word>
    %1 = arith.muli %0, %0 : index
    %alloca = memref.alloca(%0, %0) : memref<?x?xi32>
    %c0_i32 = arith.constant 0 : i32
    %2 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %c0_i32) -> (i32) {
      %4 = vector.broadcast %arg1 : i32 to vector<[4]xi32>
      vector.store %4, %alloca[%arg0, %c0] : memref<?x?xi32>, vector<[4]xi32>
      %5 = arith.addi %arg1, %c1_i32 : i32
      scf.yield %5 : i32
    }
    %3 = arm_sme.tile_load %alloca[%c0, %c0] layout<vertical> : memref<?x?xi32>, vector<[4]x[4]xi32>
    vector.print str "TILE BEGIN\0A"
    scf.for %arg0 = %c0 to %0 step %c1 {
      %4 = vector.load %alloca[%arg0, %c0] : memref<?x?xi32>, vector<[4]xi32>
      vector.print %4 : vector<[4]xi32>
    }
    vector.print str "TILE END\0A"
    vector.print str "TILE BEGIN\0A"
    vector.print %3 : vector<[4]x[4]xi32>
    vector.print str "TILE END\0A"
    return
  }
}

