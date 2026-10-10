#map = affine_map<(d0, d1)[s0] -> (d0 floordiv 128 + s0 + d1 mod 128)>
#map1 = affine_map<(d0, d1)[s0] -> ((s0 ceildiv 128) * 128)>
#map2 = affine_map<(d0) -> (42)>
module {
  func.func @affine_apply(%arg0: index) -> (index, index, index) {
    %c177 = arith.constant 177 : index
    %c211 = arith.constant 211 : index
    %c1075 = arith.constant 1075 : index
    %0 = affine.apply #map(%c177, %c211)[%c1075]
    %1 = affine.apply #map1(%c177, %c211)[%c1075]
    %2 = affine.apply #map2(%arg0)
    return %0, %1, %2 : index, index, index
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @affine_min(%arg0: index) -> (index, index) {
    %c42 = arith.constant 42 : index
    %c44 = arith.constant 44 : index
    %0 = affine.min #map(%c42, %arg0)
    %1 = affine.min #map(%c42, %c44)
    return %0, %1 : index, index
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @affine_min(%arg0: index) -> (index, index) {
    %c42 = arith.constant 42 : index
    %c44 = arith.constant 44 : index
    %0 = affine.max #map(%c42, %arg0)
    %1 = affine.max #map(%c42, %c44)
    return %0, %1 : index, index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 mod 0)>
#map1 = affine_map<(d0)[s0] -> (d0 floordiv 0)>
#map2 = affine_map<(d0)[s0] -> (d0 ceildiv 0)>
module {
  func.func @affine_apply_poison_division_zero() {
    %0 = ub.poison : index
    %c16 = arith.constant 16 : index
    %1 = affine.apply #map(%c16)[%c16]
    %2 = affine.apply #map1(%c16)[%c16]
    %3 = affine.apply #map2(%c16)[%c16]
    %alloc = memref.alloc(%1, %2, %3) : memref<?x?x?xi1>
    %4 = affine.load %alloc[%1, %2, %3] : memref<?x?x?xi1>
    affine.store %4, %alloc[%1, %2, %3] : memref<?x?x?xi1>
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 mod 0)>
module {
  func.func @affine_apply_poison_division_zero_2() -> index {
    %c16 = arith.constant 16 : index
    %0 = affine.apply #map(%c16)[%c16]
    return %0 : index
  }
}

