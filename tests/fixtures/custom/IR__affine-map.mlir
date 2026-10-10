#map = affine_map<() -> (0)>
#map1 = affine_map<(d0, d1) -> (d0 + 1, d1 * 4 + 2)>
#map2 = affine_map<(d0, d1) -> (d1 - d0 + (d0 - d1 + 1) * 2 + d1 - 1, d1 * 4 + 2)>
#map3 = affine_map<(d0, d1) -> (d0 + 2, d1)>
#map4 = affine_map<(d0, d1)[s0] -> (d0 + s0, d1)>
#map5 = affine_map<(d0, d1)[s0] -> (d0 + s0, d1 + 5)>
#map6 = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0, d1)>
#map7 = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0 + 5, d1)>
#map8 = affine_map<(d0, d1)[s0] -> (d0 + d1 + 5, d1)>
#map9 = affine_map<(d0, d1)[s0] -> (d0 + d1 + 5, d1)>
#map10 = affine_map<(d0, d1)[s0] -> (d0 * 2, d1 * 3)>
#map11 = affine_map<(d0, d1)[s0] -> (d0 + (d1 + s0 * 3) * 5 + 12, d1)>
#map12 = affine_map<(d0, d1)[s0] -> (d0 * 5 + d1, d1)>
#map13 = affine_map<(d0, d1)[s0] -> (d0 + d1, d1)>
#map14 = affine_map<(d0, d1)[s0] -> (d0 + d1 + 7, d1 + 3)>
#map15 = affine_map<(d0, d1)[s0] -> (d0, 0)>
#map16 = affine_map<(d0, d1)[s0] -> (d0, d1 * s0)>
#map17 = affine_map<(d0, d1) -> (d0, d0 * 3 + d1)>
#map18 = affine_map<(d0, d1) -> (d0, d0 + d1 * 3)>
#map19 = affine_map<(d0, d1)[s0] -> (d0, d0 * ((s0 * s0) * 9) + 3)>
#map20 = affine_map<(d0, d1) -> (1, d0 + d1 * 3 + 5)>
#map21 = affine_map<(d0, d1)[s0] -> (s0 * 5, d0 + d1 * 3 + d0 * 5)>
#map22 = affine_map<(d0, d1)[s0, s1] -> (d0 * (s0 * s1), d1)>
#map23 = affine_map<(d0, d1)[s0, s1] -> (d0, d1 mod 5)>
#map24 = affine_map<(d0, d1)[s0, s1] -> (d0, d1 floordiv 5)>
#map25 = affine_map<(d0, d1)[s0, s1] -> (d0, d1 ceildiv 5)>
#map26 = affine_map<(d0, d1)[s0, s1] -> (d0, d0 - d1 - 5)>
#map27 = affine_map<(d0, d1)[s0, s1] -> (d0, d0 - d1 * s1 + 2)>
#map28 = affine_map<(d0, d1)[s0, s1] -> (d0 * -5, d1 * -3, -2, -(d0 + d1), -s0)>
#map29 = affine_map<(d0, d1) -> (-4, -d0)>
#map30 = affine_map<(d0, d1)[s0, s1] -> (d0, d1 floordiv s0, d1 mod s0)>
#map31 = affine_map<(d0, d1, d2)[s0, s1, s2] -> ((d0 * s1) * s2 + d1 * s1 + d2)>
#map32 = affine_map<(d0, d1) -> (8, 4, 1, 3, 2, 4)>
#map33 = affine_map<(d0, d1) -> (4, 11, 512, 15)>
#map34 = affine_map<(d0, d1) -> (d0 * 2 + 1, d1 + 2)>
#map35 = affine_map<(d0, d1)[s0, s1] -> (d0 * s0, d0 + s0, d0 + 2, d1 * 2, s1 * 2, s0 + 2)>
#map36 = affine_map<(d0, d1)[s0] -> ((d0 * 5) floordiv 4, (d1 ceildiv 7) mod s0)>
#map37 = affine_map<(d0, d1) -> (d0 - d1 * 2, (d1 * 6) floordiv 4)>
#map38 = affine_map<(d0, d1, d2)[s0] -> (d0 + d1 + d2 + 1, d1 + d2, (d0 * s0) * 8)>
#map39 = affine_map<(d0, d1, d2) -> (0, d1, d0 * 2, 0)>
#map40 = affine_map<(d0, d1, d2) -> (d0, d0 * 4, 0, 0, 0)>
#map41 = affine_map<(d0, d1, d2) -> (d0, d0 * 4, 0, 0)>
#map42 = affine_map<(d0, d1)[s0] -> (0, 0, 0, 1)>
#map43 = affine_map<(d0, d1)[s0] -> (d0 * 2 + 1, d1 + s0)>
#map44 = affine_map<(d0) -> (-2, 1, -1)>
#map45 = affine_map<(d0) -> (d0 * 16 - (d0 + 1) + 15)>
#map46 = affine_map<(d0) -> (d0 - (d0 + 1))>
#map47 = affine_map<(d0)[s0] -> ((-s0) floordiv 4, d0 floordiv -1)>
#map48 = affine_map<() -> ()>
#map49 = affine_map<(d0, d1) -> (d0, d0 * 2 + d1 * 4 + 2, 1, 2, (d0 * 4) mod 8)>
#map50 = affine_map<(d0, d1) -> (d1, d0, 0)>
#map51 = affine_map<(d0, d1) -> (d0 * 3, (d0 + d1) * 2, d0 mod 2)>
#map52 = affine_map<(d0, d1) -> (d0 mod 5, (d1 mod 35) mod 4)>
#map53 = affine_map<(d0, d1) -> (d0, d1)>
#map54 = affine_map<(d0, d1)[s0, s1] -> (-d0 + s0, -d1 + s1)>
#map55 = affine_map<(d0, d1)[s0, s1] -> (-d0 + s0 floordiv 2, -d1 + s1 mod 3)>
#map56 = affine_map<(d0, d1)[s0, s1] -> (-d0 + s1 floordiv 2, -d1 + s0 mod 3)>
#map57 = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0)>
module {
  func.func private @f0(memref<2x4xi8, 1>)
  func.func private @f1(memref<2x4xi8, 1>)
  func.func private @f2(memref<i8, #map, 1>)
  func.func private @f3(memref<2x4xi8, #map1, 1>)
  func.func private @f3a(memref<2x4xi8, #map1, 1>)
  func.func private @f3b(memref<2x4xi8, #map1, 1>)
  func.func private @f3c(memref<2x4xi8, #map1, 1>)
  func.func private @f3d(memref<2x4xi8, #map1, 1>)
  func.func private @f3e(memref<2x4xi8, #map1, 1>)
  func.func private @f3f(memref<2x4xi8, #map1, 1>)
  func.func private @f3g(memref<2x4xi8, #map1, 1>)
  func.func private @f3h(memref<2x4xi8, #map1, 1>)
  func.func private @f3i(memref<2x4xi8, #map1, 1>)
  func.func private @f3j(memref<2x4xi8, #map1, 1>)
  func.func private @f3k(memref<2x4xi8, #map1, 1>)
  func.func private @f3l(memref<2x4xi8, #map2, 1>)
  func.func private @f4(memref<2x4xi8, #map3, 1>)
  func.func private @f5(memref<2x4xi8, #map4, 1>)
  func.func private @f6(memref<2x4xi8, #map5, 1>)
  func.func private @f7(memref<2x4xi8, #map6, 1>)
  func.func private @f8(memref<2x4xi8, #map7, 1>)
  func.func private @f9(memref<2x4xi8, #map8, 1>)
  func.func private @f10(memref<2x4xi8, #map9, 1>)
  func.func private @f11(memref<2x4xi8, #map10, 1>)
  func.func private @f12(memref<2x4xi8, #map11, 1>)
  func.func private @f13(memref<2x4xi8, #map12, 1>)
  func.func private @f14(memref<2x4xi8, #map13, 1>)
  func.func private @f15(memref<2x4xi8, #map14, 1>)
  func.func private @f16(memref<2x4xi8, #map15, 1>)
  func.func private @f17(memref<2x4xi8, #map16, 1>)
  func.func private @f19(memref<2x4xi8, #map17, 1>)
  func.func private @f20(memref<2x4xi8, #map18, 1>)
  func.func private @f18(memref<2x4xi8, #map19, 1>)
  func.func private @f21(memref<2x4xi8, #map20, 1>)
  func.func private @f22(memref<2x4xi8, #map21, 1>)
  func.func private @f23(memref<2x4xi8, #map22, 1>)
  func.func private @f24(memref<2x4xi8, #map23, 1>)
  func.func private @f25(memref<2x4xi8, #map24, 1>)
  func.func private @f26(memref<2x4xi8, #map25, 1>)
  func.func private @f29(memref<2x4xi8, #map26, 1>)
  func.func private @f30(memref<2x4xi8, #map27, 1>)
  func.func private @f32(memref<2x4xi8, #map28, 1>)
  func.func private @f33(memref<2x4xi8, #map29, 1>)
  func.func private @f34(memref<2x4xi8, #map30, 1>)
  func.func private @f35(memref<2x4x4xi8, #map31, 1>)
  func.func private @f36(memref<2x4xi8, #map32, 1>)
  func.func private @f37(memref<2x4xi8, #map33, 1>)
  func.func private @f38(memref<2x4xi8, #map34, 1>)
  func.func private @f39(memref<2x4xi8, #map35, 1>)
  func.func private @f43(memref<2x4xi8, #map36>)
  func.func private @f44(memref<2x4xi8, #map37>)
  func.func private @f45(memref<100x100x100xi8, #map38>)
  func.func private @f46(memref<100x100x100xi8, #map39>)
  func.func private @f47(memref<100x100x100xi8, #map40>)
  func.func private @f48(memref<100x100x100xi8, #map41>)
  func.func private @f49(memref<100x100xi8, #map42>)
  func.func private @f50(memref<100x100xi8, #map43>)
  func.func private @f51(memref<1xi8, #map44>)
  func.func private @f52(memref<1xi8, #map45>)
  func.func private @f53(memref<1xi8, #map46>)
  func.func private @f54(memref<10xi32, #map47>)
  "foo.op"() {map = #map48} : () -> ()
  func.func private @f56(memref<1x1xi8, #map49>)
  "f57"() {map = #map50} : () -> ()
  "f58"() {map = #map51} : () -> ()
  "f59"() {map = #map52} : () -> ()
  "f60"() {map = #map53} : () -> ()
  "f61"() {map = #map54} : () -> ()
  "f62"() {map = #map55} : () -> ()
  "f63"() {map = #map56} : () -> ()
  "f64"() {map = #map57} : () -> ()
}

