"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "std_for"}> ({
  ^bb0(%arg64: index, %arg65: index, %arg66: index):
    "scf.for"(%arg64, %arg65, %arg66) ({
    ^bb0(%arg67: index):
      "scf.for"(%arg64, %arg65, %arg66) ({
      ^bb0(%arg68: index):
        %69 = "arith.cmpi"(%arg67, %arg68) <{predicate = 2 : i64}> : (index, index) -> i1
        %70 = "arith.select"(%69, %arg67, %arg68) : (i1, index, index) -> index
        %71 = "arith.cmpi"(%arg67, %arg68) <{predicate = 5 : i64}> : (index, index) -> i1
        %72 = "arith.select"(%71, %arg67, %arg68) : (i1, index, index) -> index
        "scf.for"(%70, %72, %arg68) ({
        ^bb0(%arg69: index):
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "std_for_i32"}> ({
  ^bb0(%arg59: i32, %arg60: i32, %arg61: i32):
    "scf.for"(%arg59, %arg60, %arg61) ({
    ^bb0(%arg62: i32):
      "scf.for"(%arg59, %arg60, %arg61) <{unsignedCmp}> ({
      ^bb0(%arg63: i32):
        "scf.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
      "scf.yield"() : () -> ()
    }) : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> (), sym_name = "scf_for_i64_iter"}> ({
  ^bb0(%arg55: i64, %arg56: i64):
    %65 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %66 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %67 = "scf.for"(%arg55, %arg56, %65, %66) ({
    ^bb0(%arg57: i64, %arg58: i64):
      %68 = "arith.addi"(%arg58, %arg57) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%68) : (i64) -> ()
    }) : (i64, i64, i64, i64) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "std_if"}> ({
  ^bb0(%arg53: i1, %arg54: f32):
    "scf.if"(%arg53) ({
      %64 = "arith.addf"(%arg54, %arg54) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "std_if_else"}> ({
  ^bb0(%arg51: i1, %arg52: f32):
    "scf.if"(%arg51) ({
      %63 = "arith.addf"(%arg52, %arg52) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"() : () -> ()
    }, {
      %62 = "arith.addf"(%arg52, %arg52) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "std_parallel_loop"}> ({
  ^bb0(%arg39: index, %arg40: index, %arg41: index, %arg42: index, %arg43: index):
    %50 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%arg39, %arg40, %arg41, %arg42, %arg43, %50) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg44: index, %arg45: index):
      %51 = "arith.cmpi"(%arg44, %arg45) <{predicate = 2 : i64}> : (index, index) -> i1
      %52 = "arith.select"(%51, %arg44, %arg45) : (i1, index, index) -> index
      %53 = "arith.cmpi"(%arg44, %arg45) <{predicate = 5 : i64}> : (index, index) -> i1
      %54 = "arith.select"(%53, %arg44, %arg45) : (i1, index, index) -> index
      %55 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %56 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %57:2 = "scf.parallel"(%52, %54, %arg45, %55, %56) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>}> ({
      ^bb0(%arg46: index):
        %58 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
        %59 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        "scf.reduce"(%58, %59) ({
        ^bb0(%arg49: f32, %arg50: f32):
          %61 = "arith.addf"(%arg49, %arg50) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "scf.reduce.return"(%61) : (f32) -> ()
        }, {
        ^bb0(%arg47: i32, %arg48: i32):
          %60 = "arith.muli"(%arg47, %arg48) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          "scf.reduce.return"(%60) : (i32) -> ()
        }) : (f32, i32) -> ()
      }) : (index, index, index, f32, i32) -> (f32, i32)
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "parallel_explicit_yield"}> ({
  ^bb0(%arg35: index, %arg36: index, %arg37: index):
    "scf.parallel"(%arg35, %arg36, %arg37) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg38: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "std_if_yield"}> ({
  ^bb0(%arg33: i1, %arg34: f32):
    %45:2 = "scf.if"(%arg33) ({
      %48 = "arith.addf"(%arg34, %arg34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %49 = "arith.subf"(%arg34, %arg34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%48, %49) : (f32, f32) -> ()
    }, {
      %46 = "arith.subf"(%arg34, %arg34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %47 = "arith.addf"(%arg34, %arg34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%46, %47) : (f32, f32) -> ()
    }) : (i1) -> (f32, f32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "std_for_yield"}> ({
  ^bb0(%arg28: index, %arg29: index, %arg30: index):
    %42 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %43 = "scf.for"(%arg28, %arg29, %arg30, %42) ({
    ^bb0(%arg31: index, %arg32: f32):
      %44 = "arith.addf"(%arg32, %arg32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%44) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "std_for_yield_multi"}> ({
  ^bb0(%arg21: index, %arg22: index, %arg23: index):
    %35 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %36 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %37 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %38:3 = "scf.for"(%arg21, %arg22, %arg23, %35, %36, %37) ({
    ^bb0(%arg24: index, %arg25: f32, %arg26: i32, %arg27: f32):
      %39 = "arith.addf"(%arg25, %arg25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %40 = "arith.addi"(%arg26, %arg26) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %41 = "arith.subf"(%arg27, %arg27) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%39, %40, %41) : (f32, i32, f32) -> ()
    }) : (index, index, index, f32, i32, f32) -> (f32, i32, f32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1024xf32>, index, index, index) -> f32, sym_name = "conditional_reduce"}> ({
  ^bb0(%arg15: memref<1024xf32>, %arg16: index, %arg17: index, %arg18: index):
    %28 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %29 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %30 = "scf.for"(%arg16, %arg17, %arg18, %28) ({
    ^bb0(%arg19: index, %arg20: f32):
      %31 = "memref.load"(%arg15, %arg19) : (memref<1024xf32>, index) -> f32
      %32 = "arith.cmpf"(%31, %29) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f32, f32) -> i1
      %33 = "scf.if"(%32) ({
        %34 = "arith.addf"(%arg20, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.yield"(%34) : (f32) -> ()
      }, {
        "scf.yield"(%arg20) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%33) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%30) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "while"}> ({
    %22 = "test.get_some_value"() : () -> i32
    %23 = "test.get_some_value"() : () -> f32
    %24:2 = "scf.while"(%22, %23) ({
    ^bb0(%arg13: i32, %arg14: f32):
      %26:2 = "test.some_operation"(%arg13, %arg14) : (i32, f32) -> (i64, f64)
      %27 = "test.some_condition"(%arg13, %arg14) : (i32, f32) -> i1
      "scf.condition"(%27, %26#0, %26#1) : (i1, i64, f64) -> ()
    }, {
    ^bb0(%arg11: i64, %arg12: f64):
      %25:2 = "test.some_operation"(%arg11, %arg12) : (i64, f64) -> (i32, f32)
      "scf.yield"(%25#0, %25#1) : (i32, f32) -> ()
    }) {foo = "bar"} : (i32, f32) -> (i64, f64)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "infinite_while"}> ({
    %21 = "arith.constant"() <{value = true}> : () -> i1
    "scf.while"() ({
      "scf.condition"(%21) : (i1) -> ()
    }, {
      "scf.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "execute_region"}> ({
    %17 = "scf.execute_region"() ({
      %20 = "arith.constant"() <{value = 1 : i64}> : () -> i64
      "scf.yield"(%20) : (i64) -> ()
    }) : () -> i64
    %18:2 = "scf.execute_region"() ({
      %19 = "arith.constant"() <{value = 1 : i64}> : () -> i64
      "scf.yield"(%19, %19) : (i64, i64) -> ()
    }) : () -> (i64, i64)
    "scf.execute_region"() ({
      "cf.br"()[^bb1] : () -> ()
    ^bb1:  // pred: ^bb0
      "scf.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%17) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100xf32>, tensor<100xf32>) -> (), sym_name = "normalized_forall"}> ({
  ^bb0(%arg7: tensor<100xf32>, %arg8: tensor<100xf32>):
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 100 : index}> : () -> index
    %15 = "scf.forall"(%14, %arg8) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg9: index, %arg10: tensor<100xf32>):
      %16 = "tensor.extract_slice"(%arg7, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<100xf32>, index) -> tensor<1xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%16, %arg10, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<1xf32>, tensor<100xf32>, index) -> ()
      }) : () -> ()
    }) : (index, tensor<100xf32>) -> tensor<100xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100xf32>, tensor<100xf32>) -> (), sym_name = "explicit_loop_bounds_forall"}> ({
  ^bb0(%arg3: tensor<100xf32>, %arg4: tensor<100xf32>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 100 : index}> : () -> index
    %11 = "scf.forall"(%8, %10, %9, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, staticLowerBound = array<i64: -9223372036854775808>, staticStep = array<i64: -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: tensor<100xf32>):
      %12 = "tensor.extract_slice"(%arg3, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<100xf32>, index) -> tensor<1xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%12, %arg6, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<1xf32>, tensor<100xf32>, index) -> ()
      }) : () -> ()
    }) : (index, index, index, tensor<100xf32>) -> tensor<100xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "normalized_forall_elide_terminator"}> ({
    %7 = "arith.constant"() <{value = 100 : index}> : () -> index
    "scf.forall"(%7) <{mapping = [#gpu.thread<x>], operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg2: index):
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "explicit_loop_bounds_forall_elide_terminator"}> ({
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 100 : index}> : () -> index
    "scf.forall"(%4, %6, %5) <{mapping = [#gpu.thread<x>], operandSegmentSizes = array<i32: 1, 1, 1, 0>, staticLowerBound = array<i64: -9223372036854775808>, staticStep = array<i64: -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg1: index):
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i32, sym_name = "switch"}> ({
  ^bb0(%arg0: index):
    %0 = "scf.index_switch"(%arg0) <{cases = array<i64: 2, 5>}> ({
      %3 = "arith.constant"() <{value = 30 : i32}> : () -> i32
      "scf.yield"(%3) : (i32) -> ()
    }, {
      %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      "scf.yield"(%2) : (i32) -> ()
    }, {
      %1 = "arith.constant"() <{value = 20 : i32}> : () -> i32
      "scf.yield"(%1) : (i32) -> ()
    }) : (index) -> i32
    "scf.index_switch"(%arg0) <{cases = array<i64>}> ({
      "scf.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

