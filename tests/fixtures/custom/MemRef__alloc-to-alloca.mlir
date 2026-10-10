module {
  func.func private @callee(memref<*xf32>)
  func.func @large_alloc() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cast = memref.cast %alloc : memref<100x100xf32> to memref<*xf32>
    call @callee(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<100x100xf32>
    return
  }
  func.func @small_alloc() {
    %alloc = memref.alloc() : memref<2x2xf32>
    %cast = memref.cast %alloc : memref<2x2xf32> to memref<*xf32>
    call @callee(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
  func.func @no_dealloc() {
    %alloc = memref.alloc() : memref<2x2xf32>
    %cast = memref.cast %alloc : memref<2x2xf32> to memref<*xf32>
    call @callee(%cast) : (memref<*xf32>) -> ()
    return
  }
  func.func @mismatching_scope() {
    %alloc = memref.alloc() : memref<2x2xf32>
    %cast = memref.cast %alloc : memref<2x2xf32> to memref<*xf32>
    call @callee(%cast) : (memref<*xf32>) -> ()
    scf.execute_region {
      memref.dealloc %alloc : memref<2x2xf32>
      scf.yield
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @all(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.alloc_to_alloca
      } : !transform.any_op
      transform.yield 
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @small(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.alloc_to_alloca size_limit(32)
      } : !transform.any_op
      transform.yield 
    }
  }
}

