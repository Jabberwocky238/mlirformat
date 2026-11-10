module {
  func.func @make_isolated_from_above_single_block(%arg0: index, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    "test.one_region_with_operands_op"() ({
      "foo.yield"(%c0, %c1, %dim, %dim_0) : (index, index, index, index) -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @make_isolated_from_above_multiple_blocks(%arg0: index, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    "test.one_region_with_operands_op"(%arg2) ({
    ^bb0(%arg3: index):
      cf.br ^bb1(%arg3 : index)
    ^bb1(%1: index):  // pred: ^bb0
      "foo.yield"(%c0, %c1, %dim, %dim_0, %1) : (index, index, index, index, index) -> ()
    }) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @make_isolated_from_above_nested_region(%arg0: memref<8xindex>) {
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    "test.one_region_with_operands_op"() ({
      scf.for %arg1 = %c1 to %c8 step %c1 {
        memref.store %c1, %arg0[%arg1] : memref<8xindex>
      }
      "foo.yield"() : () -> ()
    }) : () -> ()
    return
  }
}

