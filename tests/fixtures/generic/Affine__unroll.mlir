#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (4)>
#map2 = affine_map<() -> (100)>
#map3 = affine_map<(d0) -> (d0 + 1)>
#map4 = affine_map<() -> (2)>
#map5 = affine_map<() -> (6)>
#map6 = affine_map<() -> (7)>
#map7 = affine_map<(d0, d1) -> (d0 + 1)>
#map8 = affine_map<(d0, d1) -> (d0 + 3)>
#map9 = affine_map<(d0)[s0] -> (d0 + s0 + 1)>
#map10 = affine_map<() -> (1)>
#map11 = affine_map<() -> (8)>
#map12 = affine_map<() -> (512)>
#map13 = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map14 = affine_map<() -> (10)>
#map15 = affine_map<() -> (48)>
#map16 = affine_map<() -> (5)>
#map17 = affine_map<()[s0] -> (s0)>
#map18 = affine_map<(d0) -> (d0 - d0 mod 4)>
#map19 = affine_map<(d0) -> (d0)>
#map20 = affine_map<(d0) -> (d0 * 5 + 4)>
#map21 = affine_map<(d0)[s0] -> ((d0 * 16) floordiv (s0 * 4))>
#map22 = affine_map<(d0)[s0] -> ((d0 * 16) mod (s0 * 4))>
#map23 = affine_map<(d0) -> (d0 + 9)>
#map24 = affine_map<()[s0, s1] -> (s0, s1, 1024)>
#map25 = affine_map<(d0) -> (d0 * 4 + 1)>
#map26 = affine_map<(d0) -> (d0 - 1)>
#map27 = affine_map<(d0, d1) -> (d0 * 4, d1, 1024)>
#map28 = affine_map<()[s0] -> (s0 * 8, s0 * 12)>
#map29 = affine_map<(d0) -> (d0 * 4)>
#map30 = affine_map<()[s0, s1] -> (s0 * 4, s1, 1024)>
#map31 = affine_map<() -> (9)>
#map32 = affine_map<() -> (3)>
#map33 = affine_map<(d0) -> (d0 * 32 + 64)>
#map34 = affine_map<(d0) -> (d0 * 4 + 8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_simplest"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg89: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg90: index):
        %74 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_simple_iv_use"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg87: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg88: index):
        %73 = "addi32"(%arg88, %arg88) : (index, index) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_body_def_use"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg85: index):
      %70 = "arith.constant"() <{value = 0 : index}> : () -> index
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg86: index):
        %71 = "affine.apply"(%arg86) <{map = #map3}> : (index) -> index
        %72 = "addi32"(%71, %70) : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_strided"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg82: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg84: index):
        %68 = "affine.apply"(%arg84) <{map = #map3}> : (index) -> index
        %69 = "addi32"(%68, %68) : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg83: index):
        %66 = "affine.apply"(%arg83) <{map = #map3}> : (index) -> index
        %67 = "addi32"(%66, %66) : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_multiple_results"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg80: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg81: index):
        %62 = "affine.apply"(%arg80, %arg81) <{map = #map7}> : (index, index) -> index
        %63 = "addi32"(%62, %62) : (index, index) -> index
        %64 = "affine.apply"(%arg80, %arg81) <{map = #map8}> : (index, index) -> index
        %65:2 = "fma"(%64, %62, %62) : (index, index, index) -> (index, index)
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128x128xf32>) -> (), sym_name = "loop_nest_seq_imperfect"}> ({
  ^bb0(%arg77: memref<128x128xf32>):
    %56 = "arith.constant"() <{value = 128 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg78: index):
      %57 = "vld"(%arg78) : (index) -> i32
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg79: index):
        %59 = "affine.apply"(%arg79) <{map = #map3}> : (index) -> index
        %60 = "vmulf"(%arg79, %59) : (index, index) -> index
        %61 = "vaddf"(%60, %60) : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : () -> ()
      %58 = "scale"(%56, %arg78) : (index, index) -> index
      "vst"(%58, %arg78) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_seq_multiple"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg76: index):
      %55 = "affine.apply"(%arg76) <{map = #map3}> : (index) -> index
      "mul"(%55, %55) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %52 = "arith.constant"() <{value = 99 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg74: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg75: index):
        %53 = "affine.apply"(%arg75) <{map = #map3}> : (index) -> index
        %54 = "affine.apply"(%arg75, %52) <{map = #map9}> : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_unroll_full"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg73: index):
      %50 = "foo"() : () -> i32
      %51 = "bar"() : () -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "unroll_full"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg71: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg72: index):
          %49 = "arith.constant"() <{value = 1 : i32}> : () -> i32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gpu_loop_nest_simplest", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_outer_unroll"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg69: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg70: index):
        %47 = "affine.apply"(%arg70) <{map = #map3}> : (index) -> index
        %48 = "addi32"(%47, %47) : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "loop_nest_seq_long"}> ({
    %31 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512x512xi32, 2>
    %32 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512x512xi32, 2>
    %33 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512x512xi32, 2>
    %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %35 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %36 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg67: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
      ^bb0(%arg68: index):
        "memref.store"(%35, %31, %arg67, %arg68) : (i32, memref<512x512xi32, 2>, index, index) -> ()
        "memref.store"(%36, %32, %arg67, %arg68) : (i32, memref<512x512xi32, 2>, index, index) -> ()
        "memref.store"(%34, %33, %arg67, %arg68) : (i32, memref<512x512xi32, 2>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg61: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg62: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
        ^bb0(%arg66: index):
          %45 = "affine.apply"(%arg62, %arg66) <{map = #map13}> : (index, index) -> index
          %46 = "memref.load"(%32, %arg61, %45) : (memref<512x512xi32, 2>, index, index) -> i32
          "op1"(%46) : (i32) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
        ^bb0(%arg63: index):
          "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
          ^bb0(%arg65: index):
            %43 = "affine.apply"(%arg62, %arg65) <{map = #map13}> : (index, index) -> index
            %44 = "memref.load"(%31, %arg63, %43) : (memref<512x512xi32, 2>, index, index) -> i32
            "op2"(%44) : (i32) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
          ^bb0(%arg64: index):
            %39 = "op3"() : () -> i32
            %40 = "affine.apply"(%arg61, %arg64) <{map = #map13}> : (index, index) -> index
            %41 = "memref.load"(%33, %arg63, %40) : (memref<512x512xi32, 2>, index, index) -> i32
            %42 = "addi32"(%39, %41) : (i32, i32) -> i32
            "memref.store"(%42, %33, %arg63, %40) : (i32, memref<512x512xi32, 2>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "op4"() : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %38 = "memref.load"(%33, %37, %37) : (memref<512x512xi32, 2>, index, index) -> i32
    "func.return"(%38) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_unit_stride_no_cleanup"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg58: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
      ^bb0(%arg60: index):
        %29 = "addi32"(%arg60, %arg60) : (index, index) -> i32
        %30 = "addi32"(%29, %29) : (i32, i32) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
      ^bb0(%arg59: index):
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_unit_stride_cleanup"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg56: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg57: index):
        %27 = "addi32"(%arg57, %arg57) : (index, index) -> i32
        %28 = "addi32"(%27, %27) : (i32, i32) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_non_unit_stride_cleanup"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg54: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 5 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg55: index):
        %25 = "addi32"(%arg55, %arg55) : (index, index) -> i32
        %26 = "addi32"(%25, %25) : (i32, i32) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_nest_single_iteration_after_unroll"}> ({
  ^bb0(%arg51: index):
    "affine.for"(%arg51) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map17}> ({
    ^bb0(%arg52: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map16}> ({
      ^bb0(%arg53: index):
        %24 = "addi32"(%arg53, %arg53) : (index, index) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_operand1"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg49: index):
      "affine.for"(%arg49) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map18}> ({
      ^bb0(%arg50: index):
        %23 = "foo"() : () -> i32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_operand2"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg47: index):
      "affine.for"(%arg47, %arg47) <{lowerBoundMap = #map19, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map20}> ({
      ^bb0(%arg48: index):
        %22 = "foo"() : () -> i32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "floordiv_mod_ub"}> ({
  ^bb0(%arg41: index, %arg42: index):
    "affine.for"(%arg42) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 4 : index, upperBoundMap = #map17}> ({
    ^bb0(%arg45: index):
      "affine.for"(%arg45, %arg42) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map21}> ({
      ^bb0(%arg46: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%arg42) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 4 : index, upperBoundMap = #map17}> ({
    ^bb0(%arg43: index):
      "affine.for"(%arg43, %arg42) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map22}> ({
      ^bb0(%arg44: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_operand3"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg39: index):
      "affine.for"(%arg39, %arg39) <{lowerBoundMap = #map19, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map23}> ({
      ^bb0(%arg40: index):
        %21 = "foo"() : () -> i32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_nest_symbolic_bound"}> ({
  ^bb0(%arg36: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg37: index):
      "affine.for"(%arg36) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map17}> ({
      ^bb0(%arg38: index):
        %20 = "foo"() : () -> i32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_nest_symbolic_bound_with_step"}> ({
  ^bb0(%arg33: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg34: index):
      "affine.for"(%arg33) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 3 : index, upperBoundMap = #map17}> ({
      ^bb0(%arg35: index):
        %19 = "foo"() : () -> i32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "loop_nest_symbolic_and_min_upper_bound"}> ({
  ^bb0(%arg29: index, %arg30: index, %arg31: index):
    "affine.for"(%arg29, %arg30, %arg31) <{lowerBoundMap = #map17, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map24}> ({
    ^bb0(%arg32: index):
      "test.foo"() : () -> ()
      "affine.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "loop_nest_non_trivial_multiple_upper_bound"}> ({
  ^bb0(%arg26: index, %arg27: index):
    %17 = "affine.apply"(%arg26) <{map = #map25}> : (index) -> index
    %18 = "affine.apply"(%17) <{map = #map26}> : (index) -> index
    "affine.for"(%arg27, %18) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map27}> ({
    ^bb0(%arg28: index):
      "foo"() : () -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multi_upper_bound"}> ({
  ^bb0(%arg24: index):
    "affine.for"(%arg24) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map28}> ({
    ^bb0(%arg25: index):
      "test.foo"() : () -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multi_lower_bound"}> ({
  ^bb0(%arg22: index):
    "affine.for"(%arg22) <{lowerBoundMap = #map28, operandSegmentSizes = array<i32: 1, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg23: index):
      "test.foo"() : () -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "loop_nest_non_trivial_multiple_upper_bound_alt"}> ({
  ^bb0(%arg19: index, %arg20: index):
    %16 = "affine.apply"(%arg19) <{map = #map29}> : (index) -> index
    "affine.for"(%arg20, %16) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map30}> ({
    ^bb0(%arg21: index):
      "foo"() : () -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_by_one_should_promote_single_iteration_loop"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg18: index):
      %15 = "foo"(%arg18) : (index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, index) -> (f32, f32), sym_name = "loop_unroll_with_iter_args_and_cleanup"}> ({
  ^bb0(%arg12: f32, %arg13: f32, %arg14: index):
    %10 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %11 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %12:2 = "affine.for"(%arg12, %arg13) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map14}> ({
    ^bb0(%arg15: index, %arg16: f32, %arg17: f32):
      %13 = "arith.addf"(%arg16, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.addf"(%arg17, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%13, %14) : (f32, f32) -> ()
    }) : (f32, f32) -> (f32, f32)
    "func.return"(%12#0, %12#1) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "unroll_with_iter_args_and_promotion"}> ({
  ^bb0(%arg8: f32, %arg9: f32):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "affine.for"(%arg8) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map31}> ({
    ^bb0(%arg10: index, %arg11: f32):
      %9 = "arith.addf"(%arg11, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%9) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_zero_trip_count_case"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map}> ({
    ^bb0(%arg7: index):
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_cleanup_loop_with_larger_unroll_factor"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map32}> ({
    ^bb0(%arg6: index):
      %4 = "foo"(%arg6) : (index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_cleanup_loop_with_smaller_unroll_factor"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg5: index):
      %3 = "foo"(%arg5) : (index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_cleanup_loop_with_identical_unroll_factor"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map16}> ({
    ^bb0(%arg4: index):
      %2 = "foo"(%arg4) : (index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "known_multiple_ceildiv"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "memref.alloc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 8 : index, upperBoundMap = #map33}> ({
    ^bb0(%arg3: index):
      "affine.store"(%0, %1, %arg3) <{map = #map19}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map34}> ({
    ^bb0(%arg2: index):
      "affine.store"(%0, %1, %arg2) <{map = #map19}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

