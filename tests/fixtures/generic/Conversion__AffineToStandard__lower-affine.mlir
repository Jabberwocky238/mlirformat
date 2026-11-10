#map = affine_map<() -> (1)>
#map1 = affine_map<() -> (42)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
#map5 = affine_map<() -> (7)>
#map6 = affine_map<() -> (56)>
#map7 = affine_map<() -> (18)>
#map8 = affine_map<() -> (37)>
#map9 = affine_map<()[s0] -> (s0)>
#map10 = affine_map<(d0)[s0] -> (d0, -d0 + s0)>
#map11 = affine_map<(d0)[s0] -> (s0, d0 + 10)>
#map12 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4, d5, d6)>
#map13 = affine_map<(d0)[s0] -> (d0 + s0 + 1)>
#map14 = affine_map<(d0, d1, d2, d3)[s0, s1, s2] -> (d0 + d1 * 2 + d2 * 3 + d3 * 4 + s0 * 5 + s1 * 6 + s2 * 7)>
#set = affine_set<(d0) : (-d0 + 20 >= 0)>
#set1 = affine_set<(d0) : (d0 - 10 >= 0)>
#set2 = affine_set<(d0)[s0, s1, s2, s3] : (-d0 + s0 + 1 >= 0, s0 - 1 >= 0, s1 - 1 >= 0, s2 - 1 >= 0, s3 - 42 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "body", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "simple_loop"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg32: index):
      "func.call"(%arg32) <{callee = @body}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1024xf32>) -> f32, sym_name = "for_with_yield"}> ({
  ^bb0(%arg29: memref<1024xf32>):
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %19 = "affine.for"(%18) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg30: index, %arg31: f32):
      %20 = "affine.load"(%arg29, %arg30) <{map = #map2}> : (memref<1024xf32>, index) -> f32
      %21 = "arith.addf"(%arg31, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%21) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"(%19) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "pre", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "body2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "post", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "imperfectly_nested_loops"}> ({
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg27: index):
      "func.call"(%arg27) <{callee = @pre}> : (index) -> ()
      "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg28: index):
        "func.call"(%arg27, %arg28) <{callee = @body2}> : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "func.call"(%arg27) <{callee = @post}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "mid", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "body3", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "more_imperfectly_nested_loops"}> ({
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg24: index):
      "func.call"(%arg24) <{callee = @pre}> : (index) -> ()
      "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg26: index):
        "func.call"(%arg24, %arg26) <{callee = @body2}> : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "func.call"(%arg24) <{callee = @mid}> : (index) -> ()
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 3 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg25: index):
        "func.call"(%arg24, %arg25) <{callee = @body3}> : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "func.call"(%arg24) <{callee = @post}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_apply_loops_shorthand"}> ({
  ^bb0(%arg21: index):
    "affine.for"(%arg21) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map9}> ({
    ^bb0(%arg22: index):
      "affine.for"(%arg22) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg23: index):
        "func.call"(%arg22, %arg23) <{callee = @body2}> : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "get_idx", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "if_only"}> ({
    %17 = "func.call"() <{callee = @get_idx}> : () -> index
    "affine.if"(%17) <{condition = #set}> ({
      "func.call"(%17) <{callee = @body}> : (index) -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "if_else"}> ({
    %16 = "func.call"() <{callee = @get_idx}> : () -> index
    "affine.if"(%16) <{condition = #set}> ({
      "func.call"(%16) <{callee = @body}> : (index) -> ()
      "affine.yield"() : () -> ()
    }, {
      "func.call"(%16) <{callee = @mid}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_ifs"}> ({
    %15 = "func.call"() <{callee = @get_idx}> : () -> index
    "affine.if"(%15) <{condition = #set}> ({
      "affine.if"(%15) <{condition = #set1}> ({
        "func.call"(%15) <{callee = @body}> : (index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }, {
      "affine.if"(%15) <{condition = #set1}> ({
        "func.call"(%15) <{callee = @mid}> : (index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "if_with_yield"}> ({
    %11 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %12 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %13 = "func.call"() <{callee = @get_idx}> : () -> index
    %14 = "affine.if"(%13) <{condition = #set1}> ({
      "affine.yield"(%11) : (i64) -> ()
    }, {
      "affine.yield"(%12) : (i64) -> ()
    }) : (index) -> i64
    "func.return"(%14) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "multi_cond"}> ({
  ^bb0(%arg17: index, %arg18: index, %arg19: index, %arg20: index):
    %10 = "func.call"() <{callee = @get_idx}> : () -> index
    "affine.if"(%10, %arg17, %arg18, %arg19, %arg20) <{condition = #set2}> ({
      "func.call"(%10) <{callee = @body}> : (index) -> ()
      "affine.yield"() : () -> ()
    }, {
      "func.call"(%10) <{callee = @mid}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "if_for"}> ({
    %9 = "func.call"() <{callee = @get_idx}> : () -> index
    "affine.if"(%9) <{condition = #set}> ({
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg16: index):
        "affine.if"(%arg16) <{condition = #set1}> ({
          "func.call"(%9, %arg16) <{callee = @body2}> : (index, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : (index) -> ()
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg14: index):
      "affine.if"(%arg14) <{condition = #set1}> ({
        "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg15: index):
          "func.call"(%arg14, %arg15) <{callee = @body3}> : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_min_max"}> ({
  ^bb0(%arg11: index):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg12: index):
      "affine.for"(%arg12, %arg11, %arg12, %arg11) <{lowerBoundMap = #map10, operandSegmentSizes = array<i32: 2, 2, 0>, step = 1 : index, upperBoundMap = #map11}> ({
      ^bb0(%arg13: index):
        "func.call"(%arg12, %arg13) <{callee = @body2}> : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index, index) -> (), sym_name = "min_reduction_tree"}> ({
  ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index):
    "affine.for"(%arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 7, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg10: index):
      "func.call"(%arg10) <{callee = @body}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_applies"}> ({
  ^bb0(%arg2: index):
    %2 = "affine.apply"() <{map = #map3}> : () -> index
    %3 = "arith.constant"() <{value = 101 : index}> : () -> index
    %4 = "affine.apply"(%2) <{map = #map9}> : (index) -> index
    %5 = "arith.constant"() <{value = 102 : index}> : () -> index
    %6 = "affine.apply"(%2) <{map = #map2}> : (index) -> index
    %7 = "affine.apply"(%4, %2) <{map = #map13}> : (index, index) -> index
    %8 = "affine.apply"(%arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg2) <{map = #map14}> : (index, index, index, index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (index, index), sym_name = "args_ret_affine_apply"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
    %1 = "affine.apply"(%arg1) <{map = #map9}> : (index) -> index
    "func.return"(%0, %1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 42)>
#map1 = affine_map<(d0)[s0] -> (d0 mod s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_mod"}> ({
  ^bb0(%arg2: index):
    %1 = "affine.apply"(%arg2) <{map = #map}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "affine_apply_mod_dynamic_divisor"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 floordiv 42)>
#map1 = affine_map<(d0)[s0] -> (d0 floordiv s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_floordiv"}> ({
  ^bb0(%arg2: index):
    %1 = "affine.apply"(%arg2) <{map = #map}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "affine_apply_floordiv_dynamic_divisor"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 ceildiv 42)>
#map1 = affine_map<(d0)[s0] -> (d0 ceildiv s0)>
#map2 = affine_map<(d0)[s0] -> (d0 + s0 + 7)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
#map5 = affine_map<(d0)[s0] -> (d0 - s0 + 7)>
#map6 = affine_map<() -> ()>
#map7 = affine_map<(d0) -> (d0 + 11)>
#map8 = affine_map<(d0) -> (d0 + 7)>
#map9 = affine_map<(d0) -> (d0)>
#map10 = affine_map<(d0, d1) -> (d0 + d1 + 17)>
#map11 = affine_map<(d0, d1) -> (d0 - d1, d1 - d0)>
#map12 = affine_map<() -> (0, 0)>
#map13 = affine_map<() -> (100, 100)>
#map14 = affine_map<(d0, d1) -> (d0, d1)>
#map15 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map16 = affine_map<(d0, d1, d2) -> (d0 + 10, d1 + 10, d2 + 10)>
#map17 = affine_map<() -> (0, 0, 0)>
#map18 = affine_map<() -> (100, 100, 100)>
#map19 = affine_map<() -> (2, 2)>
#map20 = affine_map<(d0) -> (d0, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_ceildiv"}> ({
  ^bb0(%arg52: index):
    %43 = "affine.apply"(%arg52) <{map = #map}> : (index) -> index
    "func.return"(%43) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "affine_apply_ceildiv_dynamic_divisor"}> ({
  ^bb0(%arg50: index, %arg51: index):
    %42 = "affine.apply"(%arg50, %arg51) <{map = #map1}> : (index, index) -> index
    "func.return"(%42) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_load"}> ({
  ^bb0(%arg48: index):
    %40 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg49: index):
      %41 = "affine.load"(%40, %arg49, %arg48) <{map = #map2}> : (memref<10xf32>, index, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_store"}> ({
  ^bb0(%arg46: index):
    %38 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %39 = "arith.constant"() <{value = 1.100000e+01 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg47: index):
      "affine.store"(%39, %38, %arg47, %arg46) <{map = #map5}> : (f32, memref<10xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "affine_load_store_zero_dim"}> ({
  ^bb0(%arg44: memref<i32>, %arg45: memref<i32>):
    %37 = "affine.load"(%arg44) <{map = #map6}> : (memref<i32>) -> i32
    "affine.store"(%37, %arg45) <{map = #map6}> : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_prefetch"}> ({
  ^bb0(%arg42: index):
    %36 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg43: index):
      "affine.prefetch"(%36, %arg43, %arg42) <{isDataCache = true, isWrite = false, localityHint = 3 : i32, map = #map2}> : (memref<10xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_dma_start"}> ({
  ^bb0(%arg40: index):
    %31 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %32 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32, 2>
    %33 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index
    %35 = "arith.constant"() <{value = 64 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg41: index):
      "affine.dma_start"(%31, %arg41, %32, %arg40, %33, %34, %35) <{dst_map = #map7, src_map = #map8, tag_map = #map9}> : (memref<100xf32>, index, memref<100xf32, 2>, index, memref<1xi32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_dma_wait"}> ({
  ^bb0(%arg38: index):
    %29 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %30 = "arith.constant"() <{value = 64 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg39: index):
      "affine.dma_wait"(%29, %arg39, %arg38, %30) <{tag_map = #map10}> : (memref<1xi32>, index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "affine_min"}> ({
  ^bb0(%arg36: index, %arg37: index):
    %28 = "affine.min"(%arg36, %arg37) <{map = #map11}> : (index, index) -> index
    "func.return"(%28) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "affine_max"}> ({
  ^bb0(%arg34: index, %arg35: index):
    %27 = "affine.max"(%arg34, %arg35) <{map = #map11}> : (index, index) -> index
    "func.return"(%27) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x100xf32>, memref<100x100xf32>) -> (), sym_name = "affine_parallel"}> ({
  ^bb0(%arg30: memref<100x100xf32>, %arg31: memref<100x100xf32>):
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map12, reductions = [], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map13}> ({
    ^bb0(%arg32: index, %arg33: index):
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x100xf32>, memref<100x100xf32>, memref<100x100xf32>) -> (), sym_name = "affine_parallel_tiled"}> ({
  ^bb0(%arg21: memref<100x100xf32>, %arg22: memref<100x100xf32>, %arg23: memref<100x100xf32>):
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<3xi32>, lowerBoundsMap = #map17, reductions = [], steps = [10, 10, 10], upperBoundsGroups = dense<1> : tensor<3xi32>, upperBoundsMap = #map18}> ({
    ^bb0(%arg24: index, %arg25: index, %arg26: index):
      "affine.parallel"(%arg24, %arg25, %arg26, %arg24, %arg25, %arg26) <{lowerBoundsGroups = dense<1> : tensor<3xi32>, lowerBoundsMap = #map15, reductions = [], steps = [1, 1, 1], upperBoundsGroups = dense<1> : tensor<3xi32>, upperBoundsMap = #map16}> ({
      ^bb0(%arg27: index, %arg28: index, %arg29: index):
        %24 = "affine.load"(%arg22, %arg27, %arg29) <{map = #map14}> : (memref<100x100xf32>, index, index) -> f32
        %25 = "affine.load"(%arg23, %arg29, %arg28) <{map = #map14}> : (memref<100x100xf32>, index, index) -> f32
        %26 = "arith.mulf"(%24, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x3xf32>, memref<3x3xf32>) -> memref<3x3xf32>, sym_name = "affine_parallel_simple"}> ({
  ^bb0(%arg17: memref<3x3xf32>, %arg18: memref<3x3xf32>):
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map12, reductions = [], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map19}> ({
    ^bb0(%arg19: index, %arg20: index):
      %21 = "affine.load"(%arg17, %arg19, %arg20) <{map = #map14}> : (memref<3x3xf32>, index, index) -> f32
      %22 = "affine.load"(%arg18, %arg19, %arg20) <{map = #map14}> : (memref<3x3xf32>, index, index) -> f32
      %23 = "arith.mulf"(%21, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%23, %20, %arg19, %arg20) <{map = #map14}> : (f32, memref<3x3xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%20) : (memref<3x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "affine_parallel_simple_dynamic_bounds"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: memref<?x?xf32>, %arg14: memref<?x?xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "memref.dim"(%arg12, %15) : (memref<?x?xf32>, index) -> index
    "affine.parallel"(%15, %16) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map20, reductions = [], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map20}> ({
    ^bb0(%arg15: index, %arg16: index):
      %17 = "affine.load"(%arg12, %arg15, %arg16) <{map = #map14}> : (memref<?x?xf32>, index, index) -> f32
      %18 = "affine.load"(%arg13, %arg15, %arg16) <{map = #map14}> : (memref<?x?xf32>, index, index) -> f32
      %19 = "arith.mulf"(%17, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%19, %arg14, %arg15, %arg16) <{map = #map14}> : (f32, memref<?x?xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x3xf32>, memref<3x3xf32>) -> (f32, f32), sym_name = "affine_parallel_with_reductions"}> ({
  ^bb0(%arg8: memref<3x3xf32>, %arg9: memref<3x3xf32>):
    %10:2 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map12, reductions = [0, 12], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map19}> ({
    ^bb0(%arg10: index, %arg11: index):
      %11 = "affine.load"(%arg8, %arg10, %arg11) <{map = #map14}> : (memref<3x3xf32>, index, index) -> f32
      %12 = "affine.load"(%arg9, %arg10, %arg11) <{map = #map14}> : (memref<3x3xf32>, index, index) -> f32
      %13 = "arith.mulf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.addf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%13, %14) : (f32, f32) -> ()
    }) : () -> (f32, f32)
    "func.return"(%10#0, %10#1) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x3xf64>, memref<3x3xf64>) -> (f64, f64), sym_name = "affine_parallel_with_reductions_f64"}> ({
  ^bb0(%arg4: memref<3x3xf64>, %arg5: memref<3x3xf64>):
    %5:2 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map12, reductions = [0, 12], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map19}> ({
    ^bb0(%arg6: index, %arg7: index):
      %6 = "affine.load"(%arg4, %arg6, %arg7) <{map = #map14}> : (memref<3x3xf64>, index, index) -> f64
      %7 = "affine.load"(%arg5, %arg6, %arg7) <{map = #map14}> : (memref<3x3xf64>, index, index) -> f64
      %8 = "arith.mulf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %9 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "affine.yield"(%8, %9) : (f64, f64) -> ()
    }) : () -> (f64, f64)
    "func.return"(%5#0, %5#1) : (f64, f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x3xi64>, memref<3x3xi64>) -> (i64, i64), sym_name = "affine_parallel_with_reductions_i64"}> ({
  ^bb0(%arg0: memref<3x3xi64>, %arg1: memref<3x3xi64>):
    %0:2 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map12, reductions = [1, 13], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map19}> ({
    ^bb0(%arg2: index, %arg3: index):
      %1 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map14}> : (memref<3x3xi64>, index, index) -> i64
      %2 = "affine.load"(%arg1, %arg2, %arg3) <{map = #map14}> : (memref<3x3xi64>, index, index) -> i64
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %4 = "arith.addi"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "affine.yield"(%3, %4) : (i64, i64) -> ()
    }) : () -> (i64, i64)
    "func.return"(%0#0, %0#1) : (i64, i64) -> ()
  }) : () -> ()
}) : () -> ()

