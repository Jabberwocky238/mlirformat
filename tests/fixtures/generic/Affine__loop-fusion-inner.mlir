#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> (100)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<() -> (4)>
#map6 = affine_map<(d0) -> (d0 * 4, 0)>
#map7 = affine_map<(d0, d1) -> (d0 * 4, d1)>
#map8 = affine_map<(d0, d1) -> (d0 * 4 + 3, d1)>
#map9 = affine_map<() -> (2)>
#map10 = affine_map<(d0) -> (0, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "fusion_inner_simple"}> ({
  ^bb0(%arg34: memref<10xf32>):
    %60 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg35: index):
      %61 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      %62 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg37: index):
        %64 = "affine.load"(%arg34, %arg37) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%64, %61, %arg37) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg36: index):
        %63 = "affine.load"(%61, %arg36) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%63, %62, %arg36) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "fusion_inner_simple_scf"}> ({
  ^bb0(%arg30: memref<10xf32>):
    %52 = "arith.constant"() <{value = 0 : index}> : () -> index
    %53 = "arith.constant"() <{value = 1 : index}> : () -> index
    %54 = "arith.constant"() <{value = 100 : index}> : () -> index
    %55 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%52, %54, %53) ({
    ^bb0(%arg31: index):
      %56 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      %57 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg33: index):
        %59 = "affine.load"(%arg30, %arg33) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%59, %56, %arg33) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg32: index):
        %58 = "affine.load"(%56, %arg32) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%58, %57, %arg32) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fusion_inner_multiple_nests"}> ({
    %39 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xi8>
    %40 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x4xi32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg26: index):
      %41 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi8>
      %42 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x4xi8>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg29: index):
        %51 = "affine.load"(%39, %arg29, %arg26) <{map = #map4}> : (memref<4x4xi8>, index, index) -> i8
        "affine.store"(%51, %41, %arg29) <{map = #map}> : (i8, memref<4xi8>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %43 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi8>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg28: index):
        %50 = "affine.load"(%41, %arg28) <{map = #map}> : (memref<4xi8>, index) -> i8
        "affine.store"(%50, %43, %arg28) <{map = #map}> : (i8, memref<4xi8>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
      ^bb0(%arg27: index):
        %44 = "affine.load"(%42, %arg27) <{map = #map6}> : (memref<8x4xi8>, index) -> i8
        %45 = "affine.load"(%43) <{map = #map1}> : (memref<4xi8>) -> i8
        %46 = "affine.load"(%40, %arg27, %arg26) <{map = #map7}> : (memref<8x4xi32>, index, index) -> i32
        %47 = "arith.muli"(%44, %45) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
        %48 = "arith.extsi"(%47) : (i8) -> i32
        %49 = "arith.addi"(%48, %46) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "affine.store"(%49, %40, %arg27, %arg26) <{map = #map8}> : (i32, memref<8x4xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "memref.dealloc"(%43) : (memref<4xi8>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "fusion_inside_scf_while"}> ({
  ^bb0(%arg21: memref<10xf32>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "arith.constant"() <{value = 100 : index}> : () -> index
    %31 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %32 = "scf.while"(%31) ({
    ^bb0(%arg25: f32):
      %38 = "arith.cmpf"(%arg25, %31) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
      "scf.condition"(%38, %arg25) : (i1, f32) -> ()
    }, {
    ^bb0(%arg22: f32):
      %33 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      %34 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg24: index):
        %37 = "affine.load"(%arg21, %arg24) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%37, %33, %arg24) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg23: index):
        %36 = "affine.load"(%33, %arg23) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%36, %34, %arg23) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %35 = "arith.mulf"(%arg22, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%35) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "memref.global"() <{constant, initial_value = dense<0.000000e+00> : tensor<10x2xf32>, sym_name = "__constant_10x2xf32", sym_visibility = "private", type = memref<10x2xf32>}> : () -> ()
  "func.func"() <{function_type = (memref<10x2xf32>, memref<10x10xf32>, memref<10x2xf32>, index) -> (), sym_name = "fusion_inner_long"}> ({
  ^bb0(%arg0: memref<10x2xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10x2xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.000000e-03 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 9 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "memref.get_global"() <{name = @__constant_10x2xf32}> : () -> memref<10x2xf32>
    %8 = "scf.for"(%6, %5, %4, %arg0) ({
    ^bb0(%arg6: i32, %arg7: memref<10x2xf32>):
      %10 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xi32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg20: index):
        %27 = "arith.index_cast"(%arg20) : (index) -> i32
        "affine.store"(%27, %10, %arg20) <{map = #map}> : (i32, memref<10xi32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %11 = "scf.for"(%6, %3, %4, %7) ({
      ^bb0(%arg12: i32, %arg13: memref<10x2xf32>):
        %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg19: index):
          %26 = "affine.load"(%arg7, %arg3, %arg19) <{map = #map4}> : (memref<10x2xf32>, index, index) -> f32
          "affine.store"(%26, %17, %arg19) <{map = #map}> : (f32, memref<2xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        %18 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x2xf32>
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg18: index):
          %25 = "affine.load"(%17, %arg18) <{map = #map}> : (memref<2xf32>, index) -> f32
          "affine.store"(%25, %18, %arg18) <{map = #map10}> : (f32, memref<1x2xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        %19 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x2xf32>
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg16: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
          ^bb0(%arg17: index):
            %24 = "affine.load"(%18, %arg17) <{map = #map10}> : (memref<1x2xf32>, index) -> f32
            "affine.store"(%24, %19, %arg16, %arg17) <{map = #map4}> : (f32, memref<10x2xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        %20 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x2xf32>
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg14: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
          ^bb0(%arg15: index):
            %21 = "affine.load"(%19, %arg14, %arg15) <{map = #map4}> : (memref<10x2xf32>, index, index) -> f32
            %22 = "affine.load"(%arg7, %arg14, %arg15) <{map = #map4}> : (memref<10x2xf32>, index, index) -> f32
            %23 = "arith.subf"(%21, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "affine.store"(%23, %20, %arg14, %arg15) <{map = #map4}> : (f32, memref<10x2xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "scf.yield"(%20) : (memref<10x2xf32>) -> ()
      }) : (i32, i32, i32, memref<10x2xf32>) -> memref<10x2xf32>
      %12 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x2xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg10: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg11: index):
          "affine.store"(%1, %12, %arg10, %arg11) <{map = #map4}> : (f32, memref<10x2xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %13 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x2xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg8: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg9: index):
          %14 = "affine.load"(%12, %arg8, %arg9) <{map = #map4}> : (memref<10x2xf32>, index, index) -> f32
          %15 = "affine.load"(%11, %arg8, %arg9) <{map = #map4}> : (memref<10x2xf32>, index, index) -> f32
          %16 = "arith.mulf"(%14, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%16, %13, %arg8, %arg9) <{map = #map4}> : (f32, memref<10x2xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "scf.yield"(%13) : (memref<10x2xf32>) -> ()
    }) : (i32, i32, i32, memref<10x2xf32>) -> memref<10x2xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
      ^bb0(%arg5: index):
        %9 = "affine.load"(%8, %arg4, %arg5) <{map = #map4}> : (memref<10x2xf32>, index, index) -> f32
        "affine.store"(%9, %arg2, %arg4, %arg5) <{map = #map4}> : (f32, memref<10x2xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

