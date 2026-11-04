module {
  func.func @check_static_return(%arg0: memref<32x18xf32>) -> memref<32x18xf32> {
    return %arg0 : memref<32x18xf32>
  }
  func.func @check_static_return_with_offset(%arg0: memref<32x18xf32, strided<[22, 1], offset: 7>>) -> memref<32x18xf32, strided<[22, 1], offset: 7>> {
    return %arg0 : memref<32x18xf32, strided<[22, 1], offset: 7>>
  }
  func.func private @foo(memref<10xi8>) -> memref<20xi8>
  func.func @check_memref_func_call(%arg0: memref<10xi8>) -> memref<20xi8> {
    %0 = call @foo(%arg0) : (memref<10xi8>) -> memref<20xi8>
    return %0 : memref<20xi8>
  }
  func.func @check_return(%arg0: memref<?xi8>) -> memref<?xi8> {
    return %arg0 : memref<?xi8>
  }
  func.func @unconvertible_multiresult(%arg0: memref<?xf32>, %arg1: memref<?xf32>) -> (memref<?xf32>, memref<?xf32>) {
    return %arg0, %arg1 : memref<?xf32>, memref<?xf32>
  }
  func.func @unranked_memref(%arg0: memref<*xi32>) {
    call @printMemrefI32(%arg0) : (memref<*xi32>) -> ()
    return
  }
  func.func private @printMemrefI32(memref<*xi32>)
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.func.func_to_llvm
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter {use_bare_ptr_call_conv = true, use_opaque_pointers = true}
      } {legal_dialects = ["llvm"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
}

