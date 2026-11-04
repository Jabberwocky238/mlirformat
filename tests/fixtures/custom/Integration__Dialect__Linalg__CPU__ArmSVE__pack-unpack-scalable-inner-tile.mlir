module {
  func.func @main() {
    %c256_i32 = arith.constant 256 : i32
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @pack_unpack_with_scalable_inner_tile() : () -> ()
    return
  }
  func.func @pack_unpack_with_scalable_inner_tile() attributes {no_inline} {
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    vector.print str "\0AINNER TILE SIZE (run-time value): "
    vector.print %c4_vscale : index
    %cst = arith.constant dense<[[1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6]]> : tensor<7x12xi32>
    %0 = call @pack_main(%cst, %c4_vscale) : (tensor<7x12xi32>, index) -> tensor<2x?x4x?xi32>
    %1 = call @unpack_main(%0, %c4_vscale) : (tensor<2x?x4x?xi32>, index) -> tensor<7x12xi32>
    vector.print str "\0AINPUT MATRIX (before packing)\0A"
    %cast = tensor.cast %cst : tensor<7x12xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    vector.print str "\0AINPUT MATRIX (after packing)\0A"
    %cast_0 = tensor.cast %0 : tensor<2x?x4x?xi32> to tensor<*xi32>
    call @printMemrefI32(%cast_0) : (tensor<*xi32>) -> ()
    vector.print str "\0AINPUT MATRIX (after unpacking)\0A"
    %cast_1 = tensor.cast %1 : tensor<7x12xi32> to tensor<*xi32>
    call @printMemrefI32(%cast_1) : (tensor<*xi32>) -> ()
    return
  }
  func.func private @pack_main(%arg0: tensor<7x12xi32>, %arg1: index) -> tensor<2x?x4x?xi32> {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<7x12xi32>
    %0 = arith.ceildivui %dim, %arg1 : index
    %c123_i32 = arith.constant 123 : i32
    %1 = tensor.empty(%0, %arg1) : tensor<2x?x4x?xi32>
    %pack = linalg.pack %arg0 padding_value(%c123_i32 : i32) inner_dims_pos = [0, 1] inner_tiles = [4, %arg1] into %1 : tensor<7x12xi32> -> tensor<2x?x4x?xi32>
    return %pack : tensor<2x?x4x?xi32>
  }
  func.func private @unpack_main(%arg0: tensor<2x?x4x?xi32>, %arg1: index) -> tensor<7x12xi32> {
    %0 = tensor.empty() : tensor<7x12xi32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [4, %arg1] into %0 : tensor<2x?x4x?xi32> -> tensor<7x12xi32>
    return %unpack : tensor<7x12xi32>
  }
  func.func private @printMemrefI32(tensor<*xi32>)
  func.func private @setArmVLBits(i32)
}

