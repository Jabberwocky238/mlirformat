#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple1"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 - 1)>
#map1 = affine_map<(d0)[s0] -> (d0 - s0 + 1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple2"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d0 ceildiv s0, d1 ceildiv s1)>
#map1 = affine_map<(d0, d1)[s0, s1] -> (d0 * s0, d1 * s1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple3a"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d0 mod s0, d1 mod s1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple3b"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0, s1] -> ((d0 ceildiv s0) * s0, (d1 ceildiv s1) * s1, d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3)[s0, s1, s2, s3] -> (d0 + d2 mod s2, d1 + d3 mod s3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple3c"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1)[s0, s1] -> (d0 * s1, d1 ceildiv s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple4"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 24)>
#map3 = affine_map<(d0) -> (d0 ceildiv 8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple5a"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<(d0) -> (d0 ceildiv 8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple5b"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 24)>
#map3 = affine_map<(d0) -> (d0 floordiv 3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple5c"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<(d0) -> (d0 floordiv 3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple5d"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "test_affine_map"() {affine_map = #map3} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 ceildiv 8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple5e"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 * 4)>
#map2 = affine_map<(d0) -> (d0 floordiv 3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple5f"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "test_affine_map"() {affine_map = #map2} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "perm_and_proj"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0, d0 - s0)>
#map1 = affine_map<(d0, d1) -> (d0 + 1, d1 - 1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "symbols1"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2)[s0, s1] -> (d0 + s1, d1 + s0, d0 + d1 + d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0 + d2)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "drop"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0, d0 - s0)>
#map1 = affine_map<(d0, d1)[s0, s1] -> (d0 + s1 + 1, d1 - s0 - 1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_symbols"}> ({
    "test_affine_map"() {affine_map = #map} : () -> ()
    "test_affine_map"() {affine_map = #map1} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_affine_maps"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

