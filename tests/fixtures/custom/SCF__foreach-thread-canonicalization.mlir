#map = affine_map<(d0) -> (d0 * -64 + 128, 64)>
#map1 = affine_map<(d0) -> (0, d0)>
#map2 = affine_map<(d0) -> (d0 * 64)>
#map3 = affine_map<(d0, d1) -> (d1 * -64 + 128, d0)>
#map4 = affine_map<(d0, d1)[s0] -> (d0 * 384 + s0 + d1)>
#map5 = affine_map<(d0)[s0] -> (d0 + s0)>
#map6 = affine_map<(d0, d1) -> (d0, d1)>
#map7 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduce() {
    %c2 = arith.constant 2 : index
    %cst = arith.constant -0.000000e+00 : f32
    %alloc = memref.alloc() : memref<128x384xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<128x384xf32>)
    %alloc_0 = memref.alloc() : memref<128xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<128xf32>)
    scf.forall (%arg0) in (%c2) {
      %0 = affine.min #map(%arg0)
      %1 = affine.max #map1(%0)
      %2 = affine.apply #map2(%arg0)
      %3 = affine.min #map3(%1, %arg0)
      %subview = memref.subview %alloc[%2, 0] [%3, 384] [1, 1] : memref<128x384xf32> to memref<?x384xf32, #map4>
      %subview_1 = memref.subview %alloc_0[%2] [%3] [1] : memref<128xf32> to memref<?xf32, #map5>
      linalg.generic {indexing_maps = [#map6, #map7], iterator_types = ["parallel", "reduction"]} ins(%subview : memref<?x384xf32, #map4>) outs(%subview_1 : memref<?xf32, #map5>) {
      ^bb0(%in: f32, %out: f32):
        %4 = arith.addf %in, %out : f32
        linalg.yield %4 : f32
      }
    }
    return
  }
}

