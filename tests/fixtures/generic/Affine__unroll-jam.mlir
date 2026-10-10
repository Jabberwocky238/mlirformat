#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (17)>
#map2 = affine_map<() -> (101)>
#map3 = affine_map<() -> (1)>
#map4 = affine_map<() -> (100)>
#map5 = affine_map<()[s0] -> (s0)>
#map6 = affine_map<()[s0] -> (s0 + 9)>
#map7 = affine_map<()[s0, s1] -> (s0, s1, 1024)>
#map8 = affine_map<(d0) -> (d0 + 1)>
#map9 = affine_map<() -> (35)>
#map10 = affine_map<() -> (36)>
#map11 = affine_map<(d0, d1) -> (d0, d1)>
#map12 = affine_map<() -> (30)>
#map13 = affine_map<() -> (21)>
#map14 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unroll_jam_imperfect_nest"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg60: index):
      %52 = "addi32"(%arg60, %arg60) : (index, index) -> i32
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg61: index):
        %54 = "addi32"(%arg60, %arg60) : (index, index) -> i32
        %55 = "addi32"(%54, %54) : (i32, i32) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      %53 = "foo"(%arg60, %52) : (index, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "unroll_jam"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg58: index):
        %48 = "addi32"(%arg58, %arg58) : (index, index) -> i32
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg59: index):
          %50 = "addi32"(%arg58, %arg58) : (index, index) -> i32
          %51 = "addi32"(%50, %50) : (i32, i32) -> i32
          "affine.yield"() : () -> ()
        }) : () -> ()
        %49 = "foo"(%arg58, %48) : (index, i32) -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "unroll_jam_imperfect_nest", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_nest_unknown_count_1"}> ({
  ^bb0(%arg55: index):
    "affine.for"(%arg55) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg56: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg57: index):
        %47 = "foo"() : () -> i32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_nest_unknown_count_2"}> ({
  ^bb0(%arg52: index):
    "affine.for"(%arg52, %arg52) <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg53: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg54: index):
        "foo"(%arg53) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "loop_nest_symbolic_and_min_upper_bound"}> ({
  ^bb0(%arg47: index, %arg48: index, %arg49: index):
    "affine.for"(%arg47, %arg48) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg50: index):
      "affine.for"(%arg49) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg51: index):
        "test.foo"(%arg50, %arg51) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, 1>) -> (), sym_name = "no_unroll_jam_dependent_ubound"}> ({
  ^bb0(%arg44: memref<?xf32, 1>):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg45: index):
      "affine.for"(%arg45) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg46: index):
        %46 = "addi32"(%arg46, %arg46) : (index, index) -> i32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_jam_one_iter_arg"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg41: index):
      %41 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %42 = "addi32"(%arg41, %arg41) : (index, index) -> i32
      %43 = "affine.for"(%41) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg42: index, %arg43: i32):
        %45 = "bar"(%arg41, %arg42, %arg43) : (index, index, i32) -> i32
        "affine.yield"(%45) : (i32) -> ()
      }) : (i32) -> i32
      %44 = "foo"(%arg41, %42, %43) : (index, i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_jam_iter_args"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg37: index):
      %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %35 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %36 = "addi32"(%arg37, %arg37) : (index, index) -> i32
      %37:2 = "affine.for"(%34, %35) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg38: index, %arg39: i32, %arg40: i32):
        %39 = "bar"(%arg37, %arg38, %arg39) : (index, index, i32) -> i32
        %40 = "bar1"(%arg37, %arg38, %arg40) : (index, index, i32) -> i32
        "affine.yield"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %38 = "foo"(%arg37, %36, %37#0, %37#1) : (index, i32, i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "unroll_jam_iter_args_func_arg"}> ({
  ^bb0(%arg33: i32):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg34: index):
      %30 = "addi32"(%arg34, %arg34) : (index, index) -> i32
      %31 = "affine.for"(%arg33) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg35: index, %arg36: i32):
        %33 = "bar"(%arg34, %arg35, %arg36) : (index, index, i32) -> i32
        "affine.yield"(%33) : (i32) -> ()
      }) : (i32) -> i32
      %32 = "foo"(%arg34, %30, %31) : (index, i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_jam_iter_args_nested"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg28: index):
      %24 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %25 = "addi32"(%arg28, %arg28) : (index, index) -> i32
      %26 = "affine.for"(%24) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg29: index, %arg30: i32):
        %28 = "affine.for"(%arg30) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg31: index, %arg32: i32):
          %29 = "bar"(%arg28, %arg29, %arg31, %arg32) : (index, index, index, i32) -> i32
          "affine.yield"(%29) : (i32) -> ()
        }) : (i32) -> i32
        "affine.yield"(%28) : (i32) -> ()
      }) : (i32) -> i32
      %27 = "foo"(%arg28, %25, %26) : (index, i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_jam_iter_args_nested_affine_for_result"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg21: index):
      %16 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %17 = "addi32"(%arg21, %arg21) : (index, index) -> i32
      %18 = "affine.for"(%16) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg22: index, %arg23: i32):
        %20 = "affine.for"(%arg23) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg26: index, %arg27: i32):
          %23 = "bar"(%arg21, %arg22, %arg26, %arg27) : (index, index, index, i32) -> i32
          "affine.yield"(%arg23) : (i32) -> ()
        }) : (i32) -> i32
        %21 = "affine.for"(%20) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map10}> ({
        ^bb0(%arg24: index, %arg25: i32):
          %22 = "bar"(%arg21, %arg22, %arg24, %arg25) : (index, index, index, i32) -> i32
          "affine.yield"(%22) : (i32) -> ()
        }) : (i32) -> i32
        "affine.yield"(%21) : (i32) -> ()
      }) : (i32) -> i32
      %19 = "foo"(%arg21, %17, %18) : (index, i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unroll_jam_iter_args_nested_yield"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg11: index):
      %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %9 = "addi32"(%arg11, %arg11) : (index, index) -> i32
      %10:3 = "affine.for"(%8, %8, %8) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 3>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg12: index, %arg13: i32, %arg14: i32, %arg15: i32):
        %12 = "affine.for"(%arg13) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg19: index, %arg20: i32):
          %15 = "bar"(%arg11, %arg12, %arg19, %arg20) : (index, index, index, i32) -> i32
          "affine.yield"(%15) : (i32) -> ()
        }) : (i32) -> i32
        %13:2 = "affine.for"(%arg14, %arg15) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map10}> ({
        ^bb0(%arg16: index, %arg17: i32, %arg18: i32):
          %14 = "bar1"(%arg11, %arg12, %arg16, %arg17, %arg18) : (index, index, index, i32, i32) -> i32
          "affine.yield"(%14, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "affine.yield"(%12, %12, %13#1) : (i32, i32, i32) -> ()
      }) : (i32, i32, i32) -> (i32, i32, i32)
      %11 = "foo"(%arg11, %9, %10#0, %10#2) : (index, i32, i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<21x30xf32, 1>, f32, f32) -> (), sym_name = "unroll_jam_nested_iter_args_mulf"}> ({
  ^bb0(%arg4: memref<21x30xf32, 1>, %arg5: f32, %arg6: f32):
    %3 = "affine.for"(%arg5) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map13}> ({
    ^bb0(%arg7: index, %arg8: f32):
      %4 = "affine.for"(%arg6) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map12}> ({
      ^bb0(%arg9: index, %arg10: f32):
        %6 = "affine.load"(%arg4, %arg7, %arg9) <{map = #map11}> : (memref<21x30xf32, 1>, index, index) -> f32
        %7 = "arith.addf"(%arg10, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%7) : (f32) -> ()
      }) : (f32) -> f32
      %5 = "arith.mulf"(%arg8, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%5) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<21xi32, 1>, i32) -> (), sym_name = "unroll_jam_iter_args_addi"}> ({
  ^bb0(%arg0: memref<21xi32, 1>, %arg1: i32):
    %0 = "affine.for"(%arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map13}> ({
    ^bb0(%arg2: index, %arg3: i32):
      %1 = "affine.load"(%arg0, %arg2) <{map = #map14}> : (memref<21xi32, 1>, index) -> i32
      %2 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "affine.yield"(%2) : (i32) -> ()
    }) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

