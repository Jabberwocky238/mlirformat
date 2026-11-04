module {
  func.func @print_i8s(%arg0: memref<?xi8>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    scf.for %arg2 = %c0 to %arg1 step %c16 {
      %0 = vector.load %arg0[%arg2] : memref<?xi8>, vector<16xi8>
      vector.print %0 : vector<16xi8>
    }
    return
  }
  func.func @vector_copy_i128(%arg0: memref<?x?xi128>, %arg1: memref<?x?xi128>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<?x?xi128>, vector<[1]x[1]xi128>
    vector.store %0, %arg1[%c0, %c0] : memref<?x?xi128>, vector<[1]x[1]xi128>
    return
  }
  func.func @test_load_store_zaq0() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %vscale = vector.vscale
    %c1_vscale = arith.muli %c1, %vscale : index
    %0 = arith.muli %c1_vscale, %c1_vscale : index
    %1 = arith.muli %0, %c16 : index
    %alloca = memref.alloca(%1) {alignment = 16 : i64} : memref<?xi8>
    %alloca_0 = memref.alloca(%1) {alignment = 16 : i64} : memref<?xi8>
    %c7_i8 = arith.constant 7 : i8
    %c64_i8 = arith.constant 64 : i8
    linalg.fill ins(%c7_i8 : i8) outs(%alloca : memref<?xi8>)
    linalg.fill ins(%c64_i8 : i8) outs(%alloca_0 : memref<?xi8>)
    %view = memref.view %alloca[%c0][%c1_vscale, %c1_vscale] : memref<?xi8> to memref<?x?xi128>
    %view_1 = memref.view %alloca_0[%c0][%c1_vscale, %c1_vscale] : memref<?xi8> to memref<?x?xi128>
    vector.print str "INITIAL TILE A:\0A"
    call @print_i8s(%alloca, %1) : (memref<?xi8>, index) -> ()
    vector.print
    vector.print str "INITIAL TILE B:\0A"
    call @print_i8s(%alloca_0, %1) : (memref<?xi8>, index) -> ()
    vector.print
    call @vector_copy_i128(%view, %view_1) : (memref<?x?xi128>, memref<?x?xi128>) -> ()
    vector.print str "FINAL TILE A:\0A"
    call @print_i8s(%alloca, %1) : (memref<?xi8>, index) -> ()
    vector.print
    vector.print str "FINAL TILE B:\0A"
    call @print_i8s(%alloca_0, %1) : (memref<?xi8>, index) -> ()
    return
  }
}

