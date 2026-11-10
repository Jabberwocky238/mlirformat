module {
  func.func @affine_constant_loops() {
    affine.for %arg0 = 0 to 10 {
    }
    affine.for %arg0 = 0 to 10 step 2 {
    }
    affine.for %arg0 = 10 to 0 {
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @affine_symbolic_loops(%arg0: index) {
    affine.for %arg1 = 0 to %arg0 {
    }
    affine.for %arg1 = #map(%arg0) to #map1(%arg0) {
    }
    return
  }
}

