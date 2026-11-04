#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @linalg_generic(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      linalg.yield %0 : f32
    }
    return
  }
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 4.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c50 = arith.constant 50 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x10xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x10xf32>
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<1x10xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<1x10xf32>)
    linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<1x10xf32>)
    %cast = memref.cast %alloc : memref<1x10xf32> to memref<?x?xf32>
    %cast_3 = memref.cast %alloc_1 : memref<1x10xf32> to memref<?x?xf32>
    %cast_4 = memref.cast %alloc_2 : memref<1x10xf32> to memref<?x?xf32>
    call @linalg_generic(%cast, %cast_3, %cast_4) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    %cast_5 = memref.cast %alloc_2 : memref<1x10xf32> to memref<*xf32>
    call @printMemrefF32(%cast_5) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<1x10xf32>
    memref.dealloc %alloc_1 : memref<1x10xf32>
    memref.dealloc %alloc_2 : memref<1x10xf32>
    %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<1024x1024xf32>
    %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<1024x1024xf32>
    %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<1024x1024xf32>
    %cast_9 = memref.cast %alloc_6 : memref<1024x1024xf32> to memref<?x?xf32>
    %cast_10 = memref.cast %alloc_7 : memref<1024x1024xf32> to memref<?x?xf32>
    %cast_11 = memref.cast %alloc_8 : memref<1024x1024xf32> to memref<?x?xf32>
    call @linalg_generic(%cast_9, %cast_10, %cast_11) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    %0 = call @rtclock() : () -> f64
    scf.for %arg0 = %c0 to %c50 step %c1 {
      func.call @linalg_generic(%cast_9, %cast_10, %cast_11) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    }
    %1 = call @rtclock() : () -> f64
    %2 = arith.subf %1, %0 : f64
    vector.print %2 : f64
    memref.dealloc %alloc_6 : memref<1024x1024xf32>
    memref.dealloc %alloc_7 : memref<1024x1024xf32>
    memref.dealloc %alloc_8 : memref<1024x1024xf32>
    return
  }
  func.func private @rtclock() -> f64
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

