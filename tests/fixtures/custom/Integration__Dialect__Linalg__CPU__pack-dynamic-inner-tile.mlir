module {
  func.func @main() {
    %0 = tensor.empty() : tensor<7x16xi32>
    %cst = arith.constant dense<"0x01000000080000000F000000160000001D000000240000002B000000320000003900000040000000470000004E000000550000005C000000630000006A000000020000000900000010000000170000001E000000250000002C000000330000003A00000041000000480000004F000000560000005D000000640000006B000000030000000A00000011000000180000001F000000260000002D000000340000003B000000420000004900000050000000570000005E000000650000006C000000040000000B000000120000001900000020000000270000002E000000350000003C000000430000004A00000051000000580000005F000000660000006D000000050000000C000000130000001A00000021000000280000002F000000360000003D000000440000004B000000520000005900000060000000670000006E000000060000000D000000140000001B000000220000002900000030000000370000003E000000450000004C000000530000005A00000061000000680000006F000000070000000E000000150000001C000000230000002A00000031000000380000003F000000460000004D000000540000005B000000620000006900000070000000"> : tensor<7x16xi32>
    call @pack(%cst) : (tensor<7x16xi32>) -> ()
    return
  }
  func.func private @pack(%arg0: tensor<7x16xi32>) {
    %c1 = arith.constant 1 : index
    %c123_i32 = arith.constant 123 : i32
    %c8 = arith.constant 8 : index
    %0 = tensor.empty(%c1, %c8) : tensor<?x16x?x1xi32>
    %pack = linalg.pack %arg0 padding_value(%c123_i32 : i32) inner_dims_pos = [0, 1] inner_tiles = [%c8, 1] into %0 : tensor<7x16xi32> -> tensor<?x16x?x1xi32>
    %cast = tensor.cast %pack : tensor<?x16x?x1xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  module @transforms attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consume}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_parent_op %tiled_linalg_op {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %1 {
        transform.apply_patterns.linalg.decompose_pack_unpack
        transform.apply_patterns.linalg.decompose_pad
      } : !transform.op<"func.func">
      %2 = transform.structured.match ops{["linalg.fill"]} in %1 : (!transform.op<"func.func">) -> !transform.any_op
      transform.structured.vectorize %2 vector_sizes [8, 1] : !transform.any_op
      transform.apply_patterns to %1 {
        transform.apply_patterns.tensor.fold_tensor_subset_ops
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      %3 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["func.func"]} in %3 : (!transform.any_op) -> !transform.op<"func.func">
      %5 = transform.apply_registered_pass "buffer-deallocation-pipeline" to %4 : (!transform.op<"func.func">) -> !transform.op<"func.func">
      transform.apply_patterns to %5 {
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
}

