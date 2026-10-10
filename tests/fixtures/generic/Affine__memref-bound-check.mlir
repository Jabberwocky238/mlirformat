"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0 * 10 - d1 + 19)>
#map4 = affine_map<(d0) -> (d0)>
#map5 = affine_map<() -> (-1)>
#map6 = affine_map<() -> (10)>
#map7 = affine_map<() -> (0)>
#map8 = affine_map<(d0, d1, d2) -> (d0 mod 128 + 1)>
#map9 = affine_map<(d0, d1, d2) -> (d1 floordiv 4 + 1)>
#map10 = affine_map<(d0, d1, d2) -> (d2 ceildiv 4)>
#map11 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map12 = affine_map<(d0, d1, d2) -> (d0 mod 128)>
#map13 = affine_map<(d0, d1, d2) -> (d1 floordiv 4)>
#map14 = affine_map<(d0, d1, d2) -> (d2 ceildiv 4 - 1)>
#map15 = affine_map<() -> (256)>
#map16 = affine_map<(d0, d1) -> ((d0 ceildiv 64) * 64)>
#map17 = affine_map<(d0, d1) -> (d0 floordiv 256)>
#map18 = affine_map<(d0, d1) -> ((d0 mod 1024) floordiv 4)>
#map19 = affine_map<(d0, d1) -> (((d1 mod 32) ceildiv 4) * 32)>
#map20 = affine_map<(d0)[s0] -> (d0 * s0)>
#map21 = affine_map<(d0) -> ((d0 mod 147456) floordiv 1152)>
#map22 = affine_map<(d0) -> ((d0 mod 1152) floordiv 384)>
#map23 = affine_map<() -> (64)>
#map24 = affine_map<(d0, d1) -> (d0 * 9216 + d1 * 128)>
#map25 = affine_map<(d0) -> (d0 floordiv 294912)>
#map26 = affine_map<(d0) -> ((d0 mod 294912) floordiv 147456)>
#map27 = affine_map<(d0) -> (((d0 mod 147456) floordiv 1152) floordiv 8)>
#map28 = affine_map<(d0) -> ((d0 mod 384) floordiv 128)>
#map29 = affine_map<(d0) -> ((d0 mod 128) floordiv 128)>
#map30 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map31 = affine_map<() -> (9)>
#map32 = affine_map<() -> ()>
#map33 = affine_map<(d0) -> ((d0 * 100) floordiv 1000)>
#map34 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    %52 = "arith.constant"() <{value = 0 : index}> : () -> index
    %53 = "arith.constant"() <{value = -1 : index}> : () -> index
    %54 = "arith.constant"() <{value = 111 : index}> : () -> index
    %55 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<9x9xi32>
    %56 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<111xi32>
    "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg16: index):
      "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg17: index):
        %59 = "affine.apply"(%arg16, %arg17) <{map = #map}> : (index, index) -> index
        %60 = "affine.apply"(%arg16, %arg17) <{map = #map1}> : (index, index) -> index
        %61 = "affine.load"(%55, %59, %60) <{map = #map2}> : (memref<9x9xi32>, index, index) -> i32
        %62 = "affine.apply"(%arg16, %arg17) <{map = #map3}> : (index, index) -> index
        %63 = "affine.load"(%56, %62) <{map = #map4}> : (memref<111xi32>, index) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg15: index):
      %57 = "affine.load"(%56, %52) <{map = #map4}> : (memref<111xi32>, index) -> i32
      %58 = "affine.load"(%56, %54) <{map = #map4}> : (memref<111xi32>, index) -> i32
      "affine.store"(%58, %56, %53) <{map = #map4}> : (i32, memref<111xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_mod_floordiv_ceildiv"}> ({
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64x64xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
    ^bb0(%arg13: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg14: index):
        %45 = "affine.apply"(%arg13, %arg14, %arg14) <{map = #map8}> : (index, index, index) -> index
        %46 = "affine.apply"(%arg13, %arg14, %arg14) <{map = #map9}> : (index, index, index) -> index
        %47 = "affine.apply"(%arg13, %arg14, %arg14) <{map = #map10}> : (index, index, index) -> index
        %48 = "affine.load"(%44, %45, %46, %47) <{map = #map11}> : (memref<128x64x64xi32>, index, index, index) -> i32
        %49 = "affine.apply"(%arg13, %arg14, %arg14) <{map = #map12}> : (index, index, index) -> index
        %50 = "affine.apply"(%arg13, %arg14, %arg14) <{map = #map13}> : (index, index, index) -> index
        %51 = "affine.apply"(%arg13, %arg14, %arg14) <{map = #map14}> : (index, index, index) -> index
        "affine.store"(%48, %44, %49, %50, %51) <{map = #map11}> : (i32, memref<128x64x64xi32>, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_no_out_of_bounds"}> ({
    %35 = "arith.constant"() <{value = 0 : index}> : () -> index
    %36 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<257x256xi32>
    %37 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<257xi32>
    %38 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
    ^bb0(%arg11: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg12: index):
        %39 = "affine.apply"(%arg11, %arg12) <{map = #map16}> : (index, index) -> index
        %40 = "affine.load"(%36, %39, %35) <{map = #map2}> : (memref<257x256xi32>, index, index) -> i32
        %41 = "affine.apply"(%arg11, %arg11) <{map = #map17}> : (index, index) -> index
        %42 = "affine.load"(%38, %41) <{map = #map4}> : (memref<1xi32>, index) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "mod_div"}> ({
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64x64xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
    ^bb0(%arg9: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg10: index):
        %28 = "affine.apply"(%arg9, %arg10, %arg10) <{map = #map8}> : (index, index, index) -> index
        %29 = "affine.apply"(%arg9, %arg10, %arg10) <{map = #map9}> : (index, index, index) -> index
        %30 = "affine.apply"(%arg9, %arg10, %arg10) <{map = #map10}> : (index, index, index) -> index
        %31 = "affine.load"(%27, %28, %29, %30) <{map = #map11}> : (memref<128x64x64xi32>, index, index, index) -> i32
        %32 = "affine.apply"(%arg9, %arg10, %arg10) <{map = #map12}> : (index, index, index) -> index
        %33 = "affine.apply"(%arg9, %arg10, %arg10) <{map = #map13}> : (index, index, index) -> index
        %34 = "affine.apply"(%arg9, %arg10, %arg10) <{map = #map14}> : (index, index, index) -> index
        "affine.store"(%31, %27, %32, %33, %34) <{map = #map11}> : (i32, memref<128x64x64xi32>, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "mod_floordiv_nested"}> ({
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg8: index):
        %23 = "affine.apply"(%arg7, %arg8) <{map = #map18}> : (index, index) -> index
        %24 = "affine.apply"(%arg7, %arg8) <{map = #map19}> : (index, index) -> index
        %25 = "affine.load"(%22, %23, %24) <{map = #map2}> : (memref<256x256xi32>, index, index) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "test_semi_affine_bailout"}> ({
  ^bb0(%arg5: index):
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg6: index):
      %20 = "affine.apply"(%arg6, %arg5) <{map = #map20}> : (index, index) -> index
      %21 = "affine.load"(%19, %20) <{map = #map4}> : (memref<10xi32>, index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "multi_mod_floordiv"}> ({
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map23}> ({
    ^bb0(%arg4: index):
      %16 = "affine.apply"(%arg4) <{map = #map21}> : (index) -> index
      %17 = "affine.apply"(%arg4) <{map = #map22}> : (index) -> index
      %18 = "affine.load"(%15, %16, %17) <{map = #map2}> : (memref<2x2xi32>, index, index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "delinearize_mod_floordiv"}> ({
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2x3x3x16x1xi32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x9xi32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map23}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map31}> ({
      ^bb0(%arg3: index):
        %7 = "affine.apply"(%arg2, %arg3) <{map = #map24}> : (index, index) -> index
        %8 = "affine.apply"(%7) <{map = #map25}> : (index) -> index
        %9 = "affine.apply"(%7) <{map = #map26}> : (index) -> index
        %10 = "affine.apply"(%7) <{map = #map27}> : (index) -> index
        %11 = "affine.apply"(%7) <{map = #map22}> : (index) -> index
        %12 = "affine.apply"(%7) <{map = #map28}> : (index) -> index
        %13 = "affine.apply"(%7) <{map = #map29}> : (index) -> index
        %14 = "affine.load"(%5, %8, %9, %11, %12, %10, %13) <{map = #map30}> : (memref<2x2x3x3x16x1xi32>, index, index, index, index, index, index) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "zero_d_memref"}> ({
  ^bb0(%arg1: memref<i32>):
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.store"(%3, %arg1) <{map = #map32}> : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "out_of_bounds"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %1 = "arith.constant"() <{value = 9 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map6, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map34}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map33}> : (index) -> index
      "affine.store"(%1, %0, %2) <{map = #map4}> : (i32, memref<1xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ((d0 * 72 + d1) floordiv 2304 + (d1 mod 9) floordiv 3)>
#map1 = affine_map<(d0, d1) -> ((d0 * 72 + d1) mod 2304 - (((d0 * 72 + d1) mod 2304) floordiv 1152) * 1151 - (((d0 * 72 + d1) mod 1152) floordiv 9) * 9 - ((d1 mod 9) floordiv 3) * 3)>
#map2 = affine_map<(d0, d1) -> ((((d0 * 72 + d1) mod 1152) floordiv 9) floordiv 8)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2, d1)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (9)>
#map6 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x16x1xf32>) -> (), sym_name = "test_complex_mod_floordiv"}> ({
  ^bb0(%arg0: memref<4x4x16x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x2x3x3x16x1xf32>
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg2: index):
        %2 = "affine.apply"(%arg1, %arg2) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg1, %arg2) <{map = #map1}> : (index, index) -> index
        %4 = "affine.apply"(%arg1, %arg2) <{map = #map2}> : (index, index) -> index
        %5 = "affine.load"(%arg0, %2, %0, %4) <{map = #map3}> : (memref<4x4x16x1xf32>, index, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 mod 4)>
#map2 = affine_map<(d0) -> (d0 mod 4 + 4)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (4096)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_mod_bound"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<7xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6xf32>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %2 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<7xf32>, index) -> f32
        %3 = "affine.load"(%1, %arg1) <{map = #map}> : (memref<6xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 floordiv 4)>
#map2 = affine_map<(d0) -> (d0 floordiv 4 + 4)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<(d0) -> ((d0 floordiv 4) * 4 + d0 mod 4)>
#map5 = affine_map<() -> (4096)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_floordiv_bound"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1027xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1026xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf32>
    %3 = "arith.constant"() <{value = 2048 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        %5 = "affine.load"(%0, %arg2) <{map = #map}> : (memref<1027xf32>, index) -> f32
        %6 = "affine.load"(%1, %arg2) <{map = #map}> : (memref<1026xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.for"(%3) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg1: index):
        %4 = "affine.load"(%2, %arg1) <{map = #map}> : (memref<4096xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 4)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 4)>
#map3 = affine_map<() -> (4)>
#map4 = affine_map<() -> (1028)>
#map5 = affine_map<() -> ()>
#map6 = affine_map<() -> (0)>
#map7 = affine_map<() -> (100)>
#map8 = affine_map<(d0, d1) -> (d0, d1)>
#map9 = affine_map<() -> (2048)>
#map10 = affine_map<() -> (3000)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>) -> (), sym_name = "non_composed_bound_operand"}> ({
  ^bb0(%arg4: memref<1024xf32>):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg5: index):
      %3 = "affine.apply"(%arg5) <{map = #map}> : (index) -> index
      "affine.for"(%3, %3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg6: index):
        %4 = "affine.load"(%arg4, %arg6) <{map = #map1}> : (memref<1024xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_d_memref"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "affine.for"() <{lowerBoundMap = #map6, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%1) <{map = #map5}> : (memref<f32>) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2048x2048xf64>) -> (), sym_name = "affine_parallel"}> ({
  ^bb0(%arg0: memref<2048x2048xf64>):
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map6, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map10}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map6, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
      ^bb0(%arg2: index):
        %0 = "affine.load"(%arg0, %arg1, %arg2) <{map = #map8}> : (memref<2048x2048xf64>, index, index) -> f64
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

