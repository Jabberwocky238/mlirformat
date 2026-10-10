#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (256)>
#map4 = affine_map<() -> (64)>
#map5 = affine_map<(d0) -> (d0 + 1)>
#map6 = affine_map<(d0) -> (d0)>
#map7 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map8 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map9 = affine_map<() -> (128)>
#map10 = affine_map<(d0, d1) -> (d0, -d1 - 10)>
#map11 = affine_map<(d0, d1) -> (d0 floordiv 8, d1 floordiv 16, d0 mod 8, d1 mod 16)>
#map12 = affine_map<(d0) -> (d0, d0)>
#map13 = affine_map<(d0, d1) -> (d0 * 2, d1 * 4)>
#map14 = affine_map<(d0, d1) -> (d0 * 3 + d1 * 17)>
#map15 = affine_map<() -> (5)>
#map16 = affine_map<() -> (2)>
#map17 = affine_map<(d0, d1)[s0] -> (d0 * 10 + d1)>
#map18 = affine_map<() -> (10)>
#map19 = affine_map<(d0, d1)[s0, s1] -> (d0 * s0 + d1 * s1)>
#map20 = affine_map<() -> (1024)>
#map21 = affine_map<(d0) -> (d0 floordiv 4, d0 mod 4)>
#map22 = affine_map<() -> (8)>
#map23 = affine_map<(d0, d1)[s0] -> (d0 * 3 + s0 + d1)>
#map24 = affine_map<(d0, d1) -> (d0, d1 - 100)>
#map25 = affine_map<(d0, d1) -> (d0 * 4 + d1)>
#map26 = affine_map<(d0, d1) -> ((d0 mod 2) * 2 + d1 mod 2 + (d0 floordiv 2) * 4 + (d1 floordiv 2) * 8)>
#map27 = affine_map<(d0, d1) -> (d0 mod 2 + (d1 mod 2) * 2 + (d0 floordiv 2) * 8 + (d1 floordiv 2) * 4)>
#map28 = affine_map<() -> (4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "permute"}> ({
    %62 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x256xf32, #map>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg45: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg46: index):
        %63 = "affine.load"(%62, %arg45, %arg46) <{map = #map1}> : (memref<64x256xf32, #map>, index, index) -> f32
        "prevent.dce"(%63) : (f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%62) : (memref<64x256xf32, #map>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "alloca"}> ({
  ^bb0(%arg43: index):
    %59 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xf32, #map5>
    %60 = "affine.load"(%59, %arg43) <{map = #map6}> : (memref<64xf32, #map5>, index) -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg44: index):
      %61 = "affine.load"(%59, %arg44) <{map = #map6}> : (memref<64xf32, #map5>, index) -> f32
      "prevent.dce"(%61) : (f32) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "shift"}> ({
  ^bb0(%arg41: index):
    %56 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xf32, #map5>
    %57 = "affine.load"(%56, %arg41) <{map = #map6}> : (memref<64xf32, #map5>, index) -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg42: index):
      %58 = "affine.load"(%56, %arg42) <{map = #map6}> : (memref<64xf32, #map5>, index) -> f32
      "prevent.dce"(%58) : (f32) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "high_dim_permute"}> ({
    %54 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128x256xf32, #map7>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg38: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
      ^bb0(%arg39: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg40: index):
          %55 = "affine.load"(%54, %arg38, %arg39, %arg40) <{map = #map8}> : (memref<64x128x256xf32, #map7>, index, index, index) -> f32
          "prevent.dce"(%55) : (f32) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "invalid_map"}> ({
    %53 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf32, #map10>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "data_tiling"}> ({
  ^bb0(%arg37: index):
    %51 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x512xf32, #map11>
    %52 = "affine.load"(%51, %arg37) <{map = #map12}> : (memref<64x512xf32, #map11>, index) -> f32
    "prevent.dce"(%52) : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "strided"}> ({
    %49 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf32, #map13>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg35: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
      ^bb0(%arg36: index):
        %50 = "affine.load"(%49, %arg35, %arg36) <{map = #map1}> : (memref<64x128xf32, #map13>, index, index) -> f32
        "prevent.dce"(%50) : (f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "strided_cumulative"}> ({
    %47 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x5xf32, #map14>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map16}> ({
    ^bb0(%arg33: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg34: index):
        %48 = "affine.load"(%47, %arg33, %arg34) <{map = #map1}> : (memref<2x5xf32, #map14>, index, index) -> f32
        "prevent.dce"(%48) : (f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "symbolic_operands"}> ({
  ^bb0(%arg30: index):
    %45 = "memref.alloc"(%arg30) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<10x10xf32, #map17>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map18}> ({
    ^bb0(%arg31: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map18}> ({
      ^bb0(%arg32: index):
        %46 = "affine.load"(%45, %arg31, %arg32) <{map = #map1}> : (memref<10x10xf32, #map17>, index, index) -> f32
        "prevent.dce"(%46) : (f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "semi_affine_layout_map"}> ({
  ^bb0(%arg26: index, %arg27: index):
    %43 = "memref.alloc"(%arg26, %arg27) <{operandSegmentSizes = array<i32: 0, 2>}> : (index, index) -> memref<256x1024xf32, #map19>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg28: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map20}> ({
      ^bb0(%arg29: index):
        %44 = "affine.load"(%43, %arg28, %arg29) <{map = #map1}> : (memref<256x1024xf32, #map19>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "alignment"}> ({
    %42 = "memref.alloc"() <{alignment = 32 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128x256xf32, #map7>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf64, #map21>, f64, memref<8xf64, #map21>, memref<24xf64>) -> f64, sym_name = "multiple_argument_type"}> ({
  ^bb0(%arg22: memref<16xf64, #map21>, %arg23: f64, %arg24: memref<8xf64, #map21>, %arg25: memref<24xf64>):
    %40 = "affine.load"(%arg22) <{map = #map2}> : (memref<16xf64, #map21>) -> f64
    %41 = "arith.mulf"(%40, %40) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "affine.store"(%41, %arg22) <{map = #map18}> : (f64, memref<16xf64, #map21>) -> ()
    "func.call"(%arg24) <{callee = @single_argument_type}> : (memref<8xf64, #map21>) -> ()
    "func.return"(%arg23) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "single_argument_type"}> ({
  ^bb0(%arg21: memref<8xf64, #map21>):
    %35 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf64, #map21>
    %36 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf64, #map21>
    %37 = "arith.constant"() <{value = 2.300000e+01 : f64}> : () -> f64
    %38 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<24xf64>
    "func.call"(%35) <{callee = @single_argument_type}> : (memref<8xf64, #map21>) -> ()
    "func.call"(%arg21) <{callee = @single_argument_type}> : (memref<8xf64, #map21>) -> ()
    %39 = "func.call"(%36, %37, %35, %38) <{callee = @multiple_argument_type}> : (memref<16xf64, #map21>, f64, memref<8xf64, #map21>, memref<24xf64>) -> f64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> i1, sym_name = "non_memref_ret"}> ({
  ^bb0(%arg20: memref<8xf64, #map21>):
    %34 = "arith.constant"() <{value = true}> : () -> i1
    "func.return"(%34) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf64, #map21>, f64, memref<8xf64, #map21>) -> (memref<8xf64, #map21>, f64), sym_name = "ret_multiple_argument_type"}> ({
  ^bb0(%arg17: memref<16xf64, #map21>, %arg18: f64, %arg19: memref<8xf64, #map21>):
    %30 = "affine.load"(%arg17) <{map = #map2}> : (memref<16xf64, #map21>) -> f64
    %31 = "arith.mulf"(%30, %30) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    %32 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%32)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %33:2 = "func.call"(%arg19) <{callee = @ret_single_argument_type}> : (memref<8xf64, #map21>) -> (memref<16xf64, #map21>, memref<8xf64, #map21>)
    "func.return"(%33#1, %31) : (memref<8xf64, #map21>, f64) -> ()
  ^bb2:  // pred: ^bb0
    "func.return"(%arg19, %31) : (memref<8xf64, #map21>, f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (memref<16xf64, #map21>, memref<8xf64, #map21>), sym_name = "ret_single_argument_type"}> ({
  ^bb0(%arg16: memref<8xf64, #map21>):
    %23 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf64, #map21>
    %24 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf64, #map21>
    %25 = "arith.constant"() <{value = 2.300000e+01 : f64}> : () -> f64
    %26:2 = "func.call"(%23) <{callee = @ret_single_argument_type}> : (memref<8xf64, #map21>) -> (memref<16xf64, #map21>, memref<8xf64, #map21>)
    %27:2 = "func.call"(%arg16) <{callee = @ret_single_argument_type}> : (memref<8xf64, #map21>) -> (memref<16xf64, #map21>, memref<8xf64, #map21>)
    %28:2 = "func.call"(%24, %25, %23) <{callee = @ret_multiple_argument_type}> : (memref<16xf64, #map21>, f64, memref<8xf64, #map21>) -> (memref<8xf64, #map21>, f64)
    %29:2 = "func.call"(%28#0) <{callee = @ret_single_argument_type}> : (memref<8xf64, #map21>) -> (memref<16xf64, #map21>, memref<8xf64, #map21>)
    "func.return"(%24, %23) : (memref<16xf64, #map21>, memref<8xf64, #map21>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "func_A"}> ({
  ^bb0(%arg15: memref<8xf64, #map21>):
    "func.call"(%arg15) <{callee = @func_B}> : (memref<8xf64, #map21>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "func_B"}> ({
  ^bb0(%arg14: memref<8xf64, #map21>):
    "func.call"(%arg14) <{callee = @func_C}> : (memref<8xf64, #map21>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "func_C"}> ({
  ^bb0(%arg13: memref<8xf64, #map21>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "some_func_A"}> ({
  ^bb0(%arg12: memref<8xf64, #map21>):
    "func.call"(%arg12) <{callee = @some_func_B}> : (memref<8xf64, #map21>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "some_func_B"}> ({
  ^bb0(%arg11: memref<8xf64, #map21>):
    "test.test"(%arg11) : (memref<8xf64, #map21>) -> ()
    "func.call"(%arg11) <{callee = @some_func_C}> : (memref<8xf64, #map21>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf64, #map21>) -> (), sym_name = "some_func_C"}> ({
  ^bb0(%arg10: memref<8xf64, #map21>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf64, #map21>) -> (), sym_name = "external_func_A", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf64, #map21>, f64) -> memref<8xf64, #map21>, sym_name = "external_func_B", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "simply_call_external"}> ({
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf64, #map21>
    "func.call"(%22) <{callee = @external_func_A}> : (memref<16xf64, #map21>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf64, #map21>, f64) -> memref<8xf64, #map21>, sym_name = "use_value_of_external"}> ({
  ^bb0(%arg8: memref<16xf64, #map21>, %arg9: f64):
    %21 = "func.call"(%arg8, %arg9) <{callee = @external_func_B}> : (memref<16xf64, #map21>, f64) -> memref<8xf64, #map21>
    "func.return"(%21) : (memref<8xf64, #map21>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<8xf32, #map21>, sym_name = "affine_parallel_norm"}> ({
    %18 = "arith.constant"() <{value = 2.300000e+01 : f32}> : () -> f32
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf32, #map21>
    %20 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map2, reductions = [3], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map22}> ({
    ^bb0(%arg7: index):
      "affine.store"(%18, %19, %arg7) <{map = #map6}> : (f32, memref<8xf32, #map21>, index) -> ()
      "affine.yield"(%19) : (memref<8xf32, #map21>) -> ()
    }) : () -> memref<8xf32, #map21>
    "func.return"(%20) : (memref<8xf32, #map21>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<2x3xf32, #map23>, sym_name = "map_symbol"}> ({
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    %17 = "memref.alloc"(%16) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<2x3xf32, #map23>
    "func.return"(%17) : (memref<2x3xf32, #map23>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<2x3xf32, #map24>, sym_name = "neg_map"}> ({
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32, #map24>
    "func.return"(%15) : (memref<2x3xf32, #map24>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128x512xf32>, index, index) -> tensor<16x512xf32>, sym_name = "memref_with_strided_offset"}> ({
  ^bb0(%arg4: tensor<128x512xf32>, %arg5: index, %arg6: index):
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "bufferization.to_buffer"(%arg4) : (tensor<128x512xf32>) -> memref<128x512xf32, strided<[?, ?], offset: ?>>
    %12 = "memref.subview"(%11, %arg6, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 512>, static_strides = array<i64: 1, 1>}> : (memref<128x512xf32, strided<[?, ?], offset: ?>>, index, index) -> memref<?x512xf32, strided<[?, ?], offset: ?>>
    %13 = "memref.cast"(%12) : (memref<?x512xf32, strided<[?, ?], offset: ?>>) -> memref<16x512xf32, strided<[?, ?], offset: ?>>
    %14 = "bufferization.to_tensor"(%13) : (memref<16x512xf32, strided<[?, ?], offset: ?>>) -> tensor<16x512xf32>
    "func.return"(%14) : (tensor<16x512xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xf32, #map25>) -> (), sym_name = "memref_load_with_reduction_map"}> ({
  ^bb0(%arg0: memref<4x4xf32, #map25>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32, #map26>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x4xf32, #map27>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xf32, #map25>
    %3 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map28}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map22}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map22}> ({
        ^bb0(%arg3: index):
          %5 = "memref.load"(%0, %arg1, %arg3) : (memref<4x8xf32, #map26>, index, index) -> f32
          %6 = "memref.load"(%1, %arg3, %arg2) : (memref<8x4xf32, #map27>, index, index) -> f32
          %7 = "memref.load"(%2, %arg1, %arg2) : (memref<4x4xf32, #map25>, index, index) -> f32
          %8 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %9 = "arith.addf"(%8, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%9, %arg0, %arg1, %arg2) <{map = #map1}> : (f32, memref<4x4xf32, #map25>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

