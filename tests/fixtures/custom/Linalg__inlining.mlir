#map = affine_map<(d0) -> (d0)>
module {
  func.func @inline_into(%arg0: memref<?xf32>) {
    call @inlined_fn(%arg0) : (memref<?xf32>) -> ()
    return
  }
  func.func @inlined_fn(%arg0: memref<?xf32>) {
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : memref<?xf32>) outs(%arg0 : memref<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %0 = arith.addf %in, %in : f32
      linalg.yield %0 : f32
    }
    return
  }
}

