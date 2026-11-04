"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "za0_d_f64"}> ({
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %21 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index
    %23 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<double>}> : () -> index
    %24 = "memref.alloca"(%23, %23) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf64>
    %25 = "arith.constant"() <{value = 1.000000e-01 : f64}> : () -> f64
    %26 = "scf.for"(%19, %23, %22, %25) ({
    ^bb0(%arg21: index, %arg22: f64):
      %59 = "vector.broadcast"(%arg22) : (f64) -> vector<[2]xf64>
      "vector.store"(%59, %24, %arg21, %19) : (vector<[2]xf64>, memref<?x?xf64>, index, index) -> ()
      %60 = "arith.addf"(%arg22, %21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "scf.yield"(%60) : (f64) -> ()
    }) : (index, index, index, f64) -> f64
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg20: index):
      %58 = "vector.load"(%24, %arg20, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      "vector.print"(%58) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %27 = "vector.load"(%24, %19, %19) : (memref<?x?xf64>, index, index) -> vector<[2]x[2]xf64>
    %28 = "memref.alloca"(%23, %23) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf64>
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg18: index):
      "scf.for"(%19, %23, %22) ({
      ^bb0(%arg19: index):
        "memref.store"(%20, %28, %arg18, %arg19) : (f64, memref<?x?xf64>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %29 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %30 = "scf.for"(%19, %23, %22, %29) ({
    ^bb0(%arg14: index, %arg15: f64):
      %53 = "vector.load"(%28, %arg14, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      %54 = "scf.for"(%19, %23, %22, %29) ({
      ^bb0(%arg16: index, %arg17: f64):
        %56 = "vector.extract"(%53, %arg16) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xf64>, index) -> f64
        %57 = "arith.addf"(%arg17, %56) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "scf.yield"(%57) : (f64) -> ()
      }) : (index, index, index, f64) -> f64
      %55 = "arith.addf"(%arg15, %54) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "scf.yield"(%55) : (f64) -> ()
    }) : (index, index, index, f64) -> f64
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg13: index):
      %52 = "vector.load"(%28, %arg13, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      "vector.print"(%52) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %31 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %32 = "scf.for"(%19, %23, %22, %31) ({
    ^bb0(%arg9: index, %arg10: i64):
      %44 = "vector.load"(%24, %arg9, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      %45 = "vector.load"(%28, %arg9, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      %46 = "arith.cmpf"(%44, %45) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (vector<[2]xf64>, vector<[2]xf64>) -> vector<[2]xi1>
      %47 = "scf.for"(%19, %23, %22, %31) ({
      ^bb0(%arg11: index, %arg12: i64):
        %49 = "vector.extract"(%46, %arg11) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xi1>, index) -> i1
        %50 = "arith.extui"(%49) : (i1) -> i64
        %51 = "arith.muli"(%arg12, %50) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        "scf.yield"(%51) : (i64) -> ()
      }) : (index, index, index, i64) -> i64
      %48 = "arith.muli"(%arg10, %47) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%48) : (i64) -> ()
    }) : (index, index, index, i64) -> i64
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "vector.store"(%27, %28, %19, %19) : (vector<[2]x[2]xf64>, memref<?x?xf64>, index, index) -> ()
    %33 = "scf.for"(%19, %23, %22, %31) ({
    ^bb0(%arg5: index, %arg6: i64):
      %36 = "vector.load"(%24, %arg5, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      %37 = "vector.load"(%28, %arg5, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      %38 = "arith.cmpf"(%36, %37) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (vector<[2]xf64>, vector<[2]xf64>) -> vector<[2]xi1>
      %39 = "scf.for"(%19, %23, %22, %31) ({
      ^bb0(%arg7: index, %arg8: i64):
        %41 = "vector.extract"(%38, %arg7) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xi1>, index) -> i1
        %42 = "arith.extui"(%41) : (i1) -> i64
        %43 = "arith.muli"(%arg8, %42) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        "scf.yield"(%43) : (i64) -> ()
      }) : (index, index, index, i64) -> i64
      %40 = "arith.muli"(%arg6, %39) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%40) : (i64) -> ()
    }) : (index, index, index, i64) -> i64
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg4: index):
      %35 = "vector.load"(%28, %arg4, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64>
      "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%34) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "load_store_two_za_s_tiles"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 2 : index}> : () -> index
    %6 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %7 = "arith.muli"(%6, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %8 = "memref.alloca"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32>
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg3: index):
      %16 = "arith.cmpi"(%arg3, %6) <{predicate = 6 : i64}> : (index, index) -> i1
      %17 = "scf.if"(%16) ({
        "scf.yield"(%2) : (i32) -> ()
      }, {
        "scf.yield"(%3) : (i32) -> ()
      }) : (i1) -> i32
      %18 = "vector.broadcast"(%17) : (i32) -> vector<[4]xi32>
      "vector.store"(%18, %8, %arg3, %0) : (vector<[4]xi32>, memref<?x?xi32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg2: index):
      %15 = "vector.load"(%8, %arg2, %0) : (memref<?x?xi32>, index, index) -> vector<[4]xi32>
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "vector.load"(%8, %0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    %10 = "vector.load"(%8, %6, %0) : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    %11 = "memref.alloca"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32>
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg1: index):
      "memref.store"(%1, %11, %arg1, %0) : (i32, memref<?x?xi32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "vector.store"(%10, %11, %0, %0) : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "vector.store"(%9, %11, %6, %0) : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg0: index):
      %12 = "vector.load"(%11, %arg0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]xi32>
      "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
      %13 = "arith.subi"(%6, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "arith.cmpi"(%arg0, %6) <{predicate = 0 : i64}> : (index, index) -> i1
      "scf.if"(%14) ({
        "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
        "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

