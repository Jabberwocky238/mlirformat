"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : i8}> : () -> i8 loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<byte>}> : () -> index loc("<stdin>":7:10)
    %4 = "memref.alloca"(%3, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi8> loc("<stdin>":8:10)
    "scf.for"(%0, %3, %2) ({
    ^bb0(%arg12: index loc("<stdin>":10:10)):
      "scf.for"(%0, %3, %2) ({
      ^bb0(%arg13: index loc("<stdin>":12:12)):
        "memref.store"(%1, %4, %arg12, %arg13) : (i8, memref<?x?xi8>, index, index) -> () loc("<stdin>":13:9)
        "scf.yield"() : () -> () loc("<stdin>":14:9)
      }) : (index, index, index) -> () loc("<stdin>":11:7)
      "scf.yield"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    %5 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":18:10)
    %6 = "scf.for"(%0, %3, %2, %5) ({
    ^bb0(%arg8: index loc("<stdin>":20:10), %arg9: i64 loc("<stdin>":20:24)):
      %29 = "vector.load"(%4, %arg8, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8> loc("<stdin>":21:13)
      %30 = "scf.for"(%0, %3, %2, %5) ({
      ^bb0(%arg10: index loc("<stdin>":23:12), %arg11: i64 loc("<stdin>":23:27)):
        %32 = "vector.extract"(%29, %arg10) <{static_position = array<i64: -9223372036854775808>}> : (vector<[16]xi8>, index) -> i8 loc("<stdin>":24:15)
        %33 = "arith.extui"(%32) : (i8) -> i64 loc("<stdin>":25:15)
        %34 = "arith.muli"(%arg11, %33) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":26:15)
        "scf.yield"(%34) : (i64) -> () loc("<stdin>":27:9)
      }) : (index, index, index, i64) -> i64 loc("<stdin>":22:13)
      %31 = "arith.muli"(%arg9, %30) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":29:13)
      "scf.yield"(%31) : (i64) -> () loc("<stdin>":30:7)
    }) : (index, index, index, i64) -> i64 loc("<stdin>":19:10)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (i64) -> () loc("<stdin>":32:5)
    %7 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":33:10)
    %8 = "arith.constant"() <{value = 4 : i8}> : () -> i8 loc("<stdin>":34:10)
    %9 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":35:10)
    %10 = "arith.constant"() <{value = 15 : i8}> : () -> i8 loc("<stdin>":36:11)
    "memref.store"(%8, %4, %7, %9) : (i8, memref<?x?xi8>, index, index) -> () loc("<stdin>":37:5)
    "memref.store"(%10, %4, %9, %7) : (i8, memref<?x?xi8>, index, index) -> () loc("<stdin>":38:5)
    %11 = "scf.for"(%0, %3, %2, %5) ({
    ^bb0(%arg4: index loc("<stdin>":40:10), %arg5: i64 loc("<stdin>":40:24)):
      %23 = "vector.load"(%4, %arg4, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8> loc("<stdin>":41:13)
      %24 = "scf.for"(%0, %3, %2, %5) ({
      ^bb0(%arg6: index loc("<stdin>":43:12), %arg7: i64 loc("<stdin>":43:26)):
        %26 = "vector.extract"(%23, %arg6) <{static_position = array<i64: -9223372036854775808>}> : (vector<[16]xi8>, index) -> i8 loc("<stdin>":44:15)
        %27 = "arith.extui"(%26) : (i8) -> i64 loc("<stdin>":45:15)
        %28 = "arith.muli"(%arg7, %27) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":46:15)
        "scf.yield"(%28) : (i64) -> () loc("<stdin>":47:9)
      }) : (index, index, index, i64) -> i64 loc("<stdin>":42:13)
      %25 = "arith.muli"(%arg5, %24) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":49:13)
      "scf.yield"(%25) : (i64) -> () loc("<stdin>":50:7)
    }) : (index, index, index, i64) -> i64 loc("<stdin>":39:11)
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i64) -> () loc("<stdin>":52:5)
    %12 = "arith.constant"() <{value = dense<0> : vector<[16]x[16]xi8>}> : () -> vector<[16]x[16]xi8> loc("<stdin>":53:11)
    "vector.transfer_write"(%12, %4, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<[16]x[16]xi8>, memref<?x?xi8>, index, index) -> () loc("<stdin>":54:5)
    %13 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":55:11)
    %14 = "scf.for"(%0, %3, %2, %13) ({
    ^bb0(%arg2: index loc("<stdin>":57:10), %arg3: i8 loc("<stdin>":57:24)):
      %20 = "vector.load"(%4, %arg2, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8> loc("<stdin>":58:13)
      %21 = "vector.reduction"(%20) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<[16]xi8>) -> i8 loc("<stdin>":59:13)
      %22 = "arith.addi"(%arg3, %21) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":60:13)
      "scf.yield"(%22) : (i8) -> () loc("<stdin>":61:7)
    }) : (index, index, index, i8) -> i8 loc("<stdin>":56:11)
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (i8) -> () loc("<stdin>":63:5)
    "memref.store"(%8, %4, %7, %9) : (i8, memref<?x?xi8>, index, index) -> () loc("<stdin>":64:5)
    "memref.store"(%10, %4, %9, %7) : (i8, memref<?x?xi8>, index, index) -> () loc("<stdin>":65:5)
    %15 = "scf.for"(%0, %3, %2, %13) ({
    ^bb0(%arg0: index loc("<stdin>":67:10), %arg1: i8 loc("<stdin>":67:24)):
      %17 = "vector.load"(%4, %arg0, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8> loc("<stdin>":68:13)
      %18 = "vector.reduction"(%17) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<[16]xi8>) -> i8 loc("<stdin>":69:13)
      %19 = "arith.addi"(%arg1, %18) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":70:13)
      "scf.yield"(%19) : (i8) -> () loc("<stdin>":71:7)
    }) : (index, index, index, i8) -> i8 loc("<stdin>":66:11)
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (i8) -> () loc("<stdin>":73:5)
    %16 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":74:11)
    "func.return"(%16) : (i32) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
