"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "za0_d_f64"}> ({
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:11)
    %20 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":4:11)
    %21 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":5:11)
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    %23 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<double>}> : () -> index loc("<stdin>":7:11)
    %24 = "memref.alloca"(%23, %23) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf64> loc("<stdin>":8:11)
    %25 = "arith.constant"() <{value = 1.000000e-01 : f64}> : () -> f64 loc("<stdin>":9:11)
    %26 = "scf.for"(%19, %23, %22, %25) ({
    ^bb0(%arg21: index loc("<stdin>":11:10), %arg22: f64 loc("<stdin>":11:25)):
      %59 = "vector.broadcast"(%arg22) : (f64) -> vector<[2]xf64> loc("<stdin>":12:13)
      "vector.store"(%59, %24, %arg21, %19) : (vector<[2]xf64>, memref<?x?xf64>, index, index) -> () loc("<stdin>":13:7)
      %60 = "arith.addf"(%arg22, %21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":14:13)
      "scf.yield"(%60) : (f64) -> () loc("<stdin>":15:7)
    }) : (index, index, index, f64) -> f64 loc("<stdin>":10:11)
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg20: index loc("<stdin>":18:10)):
      %58 = "vector.load"(%24, %arg20, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":19:13)
      "vector.print"(%58) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf64>) -> () loc("<stdin>":20:7)
      "scf.yield"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index) -> () loc("<stdin>":17:5)
    %27 = "vector.load"(%24, %19, %19) : (memref<?x?xf64>, index, index) -> vector<[2]x[2]xf64> loc("<stdin>":23:11)
    %28 = "memref.alloca"(%23, %23) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf64> loc("<stdin>":24:11)
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg18: index loc("<stdin>":26:10)):
      "scf.for"(%19, %23, %22) ({
      ^bb0(%arg19: index loc("<stdin>":28:12)):
        "memref.store"(%20, %28, %arg18, %arg19) : (f64, memref<?x?xf64>, index, index) -> () loc("<stdin>":29:9)
        "scf.yield"() : () -> () loc("<stdin>":30:9)
      }) : (index, index, index) -> () loc("<stdin>":27:7)
      "scf.yield"() : () -> () loc("<stdin>":32:7)
    }) : (index, index, index) -> () loc("<stdin>":25:5)
    %29 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":34:11)
    %30 = "scf.for"(%19, %23, %22, %29) ({
    ^bb0(%arg14: index loc("<stdin>":36:10), %arg15: f64 loc("<stdin>":36:25)):
      %53 = "vector.load"(%28, %arg14, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":37:13)
      %54 = "scf.for"(%19, %23, %22, %29) ({
      ^bb0(%arg16: index loc("<stdin>":39:12), %arg17: f64 loc("<stdin>":39:27)):
        %56 = "vector.extract"(%53, %arg16) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xf64>, index) -> f64 loc("<stdin>":40:15)
        %57 = "arith.addf"(%arg17, %56) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":41:15)
        "scf.yield"(%57) : (f64) -> () loc("<stdin>":42:9)
      }) : (index, index, index, f64) -> f64 loc("<stdin>":38:13)
      %55 = "arith.addf"(%arg15, %54) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":44:13)
      "scf.yield"(%55) : (f64) -> () loc("<stdin>":45:7)
    }) : (index, index, index, f64) -> f64 loc("<stdin>":35:11)
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":47:5)
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg13: index loc("<stdin>":49:10)):
      %52 = "vector.load"(%28, %arg13, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":50:13)
      "vector.print"(%52) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf64>) -> () loc("<stdin>":51:7)
      "scf.yield"() : () -> () loc("<stdin>":52:7)
    }) : (index, index, index) -> () loc("<stdin>":48:5)
    %31 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":54:11)
    %32 = "scf.for"(%19, %23, %22, %31) ({
    ^bb0(%arg9: index loc("<stdin>":56:10), %arg10: i64 loc("<stdin>":56:24)):
      %44 = "vector.load"(%24, %arg9, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":57:13)
      %45 = "vector.load"(%28, %arg9, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":58:13)
      %46 = "arith.cmpf"(%44, %45) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (vector<[2]xf64>, vector<[2]xf64>) -> vector<[2]xi1> loc("<stdin>":59:13)
      %47 = "scf.for"(%19, %23, %22, %31) ({
      ^bb0(%arg11: index loc("<stdin>":61:12), %arg12: i64 loc("<stdin>":61:27)):
        %49 = "vector.extract"(%46, %arg11) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xi1>, index) -> i1 loc("<stdin>":62:15)
        %50 = "arith.extui"(%49) : (i1) -> i64 loc("<stdin>":63:15)
        %51 = "arith.muli"(%arg12, %50) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":64:15)
        "scf.yield"(%51) : (i64) -> () loc("<stdin>":65:9)
      }) : (index, index, index, i64) -> i64 loc("<stdin>":60:13)
      %48 = "arith.muli"(%arg10, %47) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":67:13)
      "scf.yield"(%48) : (i64) -> () loc("<stdin>":68:7)
    }) : (index, index, index, i64) -> i64 loc("<stdin>":55:11)
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (i64) -> () loc("<stdin>":70:5)
    "vector.store"(%27, %28, %19, %19) : (vector<[2]x[2]xf64>, memref<?x?xf64>, index, index) -> () loc("<stdin>":71:5)
    %33 = "scf.for"(%19, %23, %22, %31) ({
    ^bb0(%arg5: index loc("<stdin>":73:10), %arg6: i64 loc("<stdin>":73:24)):
      %36 = "vector.load"(%24, %arg5, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":74:13)
      %37 = "vector.load"(%28, %arg5, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":75:13)
      %38 = "arith.cmpf"(%36, %37) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (vector<[2]xf64>, vector<[2]xf64>) -> vector<[2]xi1> loc("<stdin>":76:13)
      %39 = "scf.for"(%19, %23, %22, %31) ({
      ^bb0(%arg7: index loc("<stdin>":78:12), %arg8: i64 loc("<stdin>":78:26)):
        %41 = "vector.extract"(%38, %arg7) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xi1>, index) -> i1 loc("<stdin>":79:15)
        %42 = "arith.extui"(%41) : (i1) -> i64 loc("<stdin>":80:15)
        %43 = "arith.muli"(%arg8, %42) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":81:15)
        "scf.yield"(%43) : (i64) -> () loc("<stdin>":82:9)
      }) : (index, index, index, i64) -> i64 loc("<stdin>":77:13)
      %40 = "arith.muli"(%arg6, %39) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":84:13)
      "scf.yield"(%40) : (i64) -> () loc("<stdin>":85:7)
    }) : (index, index, index, i64) -> i64 loc("<stdin>":72:11)
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (i64) -> () loc("<stdin>":87:5)
    "scf.for"(%19, %23, %22) ({
    ^bb0(%arg4: index loc("<stdin>":89:10)):
      %35 = "vector.load"(%28, %arg4, %19) : (memref<?x?xf64>, index, index) -> vector<[2]xf64> loc("<stdin>":90:13)
      "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf64>) -> () loc("<stdin>":91:7)
      "scf.yield"() : () -> () loc("<stdin>":92:7)
    }) : (index, index, index) -> () loc("<stdin>":88:5)
    %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":94:11)
    "func.return"(%34) : (i32) -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i32, sym_name = "load_store_two_za_s_tiles"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":98:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":99:10)
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":100:10)
    %3 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":101:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":102:10)
    %5 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":103:10)
    %6 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index loc("<stdin>":104:10)
    %7 = "arith.muli"(%6, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":105:10)
    %8 = "memref.alloca"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32> loc("<stdin>":106:10)
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg3: index loc("<stdin>":108:10)):
      %16 = "arith.cmpi"(%arg3, %6) <{predicate = 6 : i64}> : (index, index) -> i1 loc("<stdin>":109:13)
      %17 = "scf.if"(%16) ({
        "scf.yield"(%2) : (i32) -> () loc("<stdin>":111:9)
      }, {
        "scf.yield"(%3) : (i32) -> () loc("<stdin>":113:9)
      }) : (i1) -> i32 loc("<stdin>":110:13)
      %18 = "vector.broadcast"(%17) : (i32) -> vector<[4]xi32> loc("<stdin>":115:13)
      "vector.store"(%18, %8, %arg3, %0) : (vector<[4]xi32>, memref<?x?xi32>, index, index) -> () loc("<stdin>":116:7)
      "scf.yield"() : () -> () loc("<stdin>":117:7)
    }) : (index, index, index) -> () loc("<stdin>":107:5)
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg2: index loc("<stdin>":120:10)):
      %15 = "vector.load"(%8, %arg2, %0) : (memref<?x?xi32>, index, index) -> vector<[4]xi32> loc("<stdin>":121:13)
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> () loc("<stdin>":122:7)
      "scf.yield"() : () -> () loc("<stdin>":123:7)
    }) : (index, index, index) -> () loc("<stdin>":119:5)
    %9 = "vector.load"(%8, %0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32> loc("<stdin>":125:10)
    %10 = "vector.load"(%8, %6, %0) : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32> loc("<stdin>":126:11)
    %11 = "memref.alloca"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32> loc("<stdin>":127:11)
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg1: index loc("<stdin>":129:10)):
      "memref.store"(%1, %11, %arg1, %0) : (i32, memref<?x?xi32>, index, index) -> () loc("<stdin>":130:7)
      "scf.yield"() : () -> () loc("<stdin>":131:7)
    }) : (index, index, index) -> () loc("<stdin>":128:5)
    "vector.store"(%10, %11, %0, %0) : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> () loc("<stdin>":133:5)
    "vector.store"(%9, %11, %6, %0) : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> () loc("<stdin>":134:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> () loc("<stdin>":135:5)
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg0: index loc("<stdin>":137:10)):
      %12 = "vector.load"(%11, %arg0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]xi32> loc("<stdin>":138:13)
      "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> () loc("<stdin>":139:7)
      %13 = "arith.subi"(%6, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":140:13)
      %14 = "arith.cmpi"(%arg0, %6) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":141:13)
      "scf.if"(%14) ({
        "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> () loc("<stdin>":143:9)
        "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> () loc("<stdin>":144:9)
        "scf.yield"() : () -> () loc("<stdin>":145:9)
      }, {
      }) : (i1) -> () loc("<stdin>":142:7)
      "scf.yield"() : () -> () loc("<stdin>":148:7)
    }) : (index, index, index) -> () loc("<stdin>":136:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> () loc("<stdin>":150:5)
    "func.return"(%1) : (i32) -> () loc("<stdin>":151:5)
  }) : () -> () loc("<stdin>":97:3)
}) : () -> () loc("<stdin>":1:1)
