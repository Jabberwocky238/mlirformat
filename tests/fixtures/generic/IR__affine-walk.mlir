#map = affine_map<(d0, d1) -> (d0 mod 2, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d0 mod 2, d1)>
"builtin.module"() ({
  "test.check_first_mod"() {map = #map} : () -> ()
  "test.check_first_mod"() {map = #map1} : () -> ()
}) : () -> ()

