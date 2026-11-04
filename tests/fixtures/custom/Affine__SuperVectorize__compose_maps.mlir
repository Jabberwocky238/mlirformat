#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @simple1() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 - 1)>
#map1 = affine_map<(d0)[s0] -> (d0 - s0 + 1)>
module {
  func.func @simple2() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d0 ceildiv s0, d1 ceildiv s1)>
#map1 = affine_map<(d0, d1)[s0, s1] -> (d0 * s0, d1 * s1)>
module {
  func.func @simple3a() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d0 mod s0, d1 mod s1)>
module {
  func.func @simple3b() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1] -> ((d0 ceildiv s0) * s0, (d1 ceildiv s1) * s1, d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3)[s0, s1, s2, s3] -> (d0 + d2 mod s2, d1 + d3 mod s3)>
module {
  func.func @simple3c() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1)[s0, s1] -> (d0 * s1, d1 ceildiv s0)>
module {
  func.func @simple4() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 24)>
#map3 = affine_map<(d0) -> (d0 ceildiv 8)>
module {
  func.func @simple5a() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<(d0) -> (d0 ceildiv 8)>
module {
  func.func @simple5b() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 24)>
#map3 = affine_map<(d0) -> (d0 floordiv 3)>
module {
  func.func @simple5c() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<(d0) -> (d0 floordiv 3)>
module {
  func.func @simple5d() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 ceildiv 8)>
module {
  func.func @simple5e() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 * 4)>
#map2 = affine_map<(d0) -> (d0 floordiv 3)>
module {
  func.func @simple5f() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
module {
  func.func @perm_and_proj() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0, d0 - s0)>
#map1 = affine_map<(d0, d1) -> (d0 + 1, d1 - 1)>
module {
  func.func @symbols1() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2)[s0, s1] -> (d0 + s1, d1 + s0, d0 + d1 + d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0 + d2)>
module {
  func.func @drop() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0, d0 - s0)>
#map1 = affine_map<(d0, d1)[s0, s1] -> (d0 + s1 + 1, d1 - s0 - 1)>
module {
  func.func @multi_symbols() {
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    return
  }
}

// -----
module {
  func.func @no_affine_maps() {
    return
  }
}

