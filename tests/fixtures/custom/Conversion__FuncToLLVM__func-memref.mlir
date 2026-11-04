module {
  func.func @check_noalias(%arg0: memref<2xf32> {llvm.noalias}, %arg1: memref<2xf32> {llvm.noalias}) {
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 * 20 + d1 + 1)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 * s0 + d1 + 1)>
module {
  func.func @check_strided_memref_arguments(%arg0: memref<10x20xf32, #map>, %arg1: memref<?x?xf32, #map1>, %arg2: memref<10x?xf32, #map1>) {
    return
  }
}

// -----
module {
  func.func @memref_index(%arg0: memref<32xindex>) -> memref<32xindex> {
    return %arg0 : memref<32xindex>
  }
}

// -----
module {
  func.func @check_arguments(%arg0: memref<10x20xf32>, %arg1: memref<?x?xf32>, %arg2: memref<10x?xf32>) {
    return
  }
}

// -----
module {
  func.func private @hoo(memref<*xi8>) -> memref<*xi8>
  func.func @check_unranked_memref_func_call(%arg0: memref<*xi8>) -> memref<*xi8> {
    %0 = call @hoo(%arg0) : (memref<*xi8>) -> memref<*xi8>
    return %0 : memref<*xi8>
  }
}

// -----
module {
  func.func private @unsupported_memref_element_type() -> memref<42x!test.memref_element>
  func.func private @unsupported_unranked_memref_element_type() -> memref<*x!test.memref_element>
}

// -----
module {
  func.func private @goo(f32) -> f32
  func.func @check_scalar_func_call(%arg0: f32) {
    %0 = call @goo(%arg0) : (f32) -> f32
    return
  }
}

// -----
module {
  func.func @loop_carried(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<64xi32, 201>, %arg4: memref<64xi32, 201>) -> (memref<64xi32, 201>, memref<64xi32, 201>) {
    cf.br ^bb1(%arg0, %arg3, %arg4 : index, memref<64xi32, 201>, memref<64xi32, 201>)
  ^bb1(%0: index, %1: memref<64xi32, 201>, %2: memref<64xi32, 201>):  // 2 preds: ^bb0, ^bb2
    %3 = arith.cmpi slt, %0, %arg1 : index
    cf.cond_br %3, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %4 = arith.addi %0, %arg2 : index
    cf.br ^bb1(%4, %2, %1 : index, memref<64xi32, 201>, memref<64xi32, 201>)
  ^bb3:  // pred: ^bb1
    return %1, %2 : memref<64xi32, 201>, memref<64xi32, 201>
  }
}

