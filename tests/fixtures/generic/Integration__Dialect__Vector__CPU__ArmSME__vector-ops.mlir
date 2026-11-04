#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<byte>}> : () -> index
    %4 = "memref.alloca"(%3, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi8>
    "scf.for"(%0, %3, %2) ({
    ^bb0(%arg12: index):
      "scf.for"(%0, %3, %2) ({
      ^bb0(%arg13: index):
        "memref.store"(%1, %4, %arg12, %arg13) : (i8, memref<?x?xi8>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %6 = "scf.for"(%0, %3, %2, %5) ({
    ^bb0(%arg8: index, %arg9: i64):
      %29 = "vector.load"(%4, %arg8, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8>
      %30 = "scf.for"(%0, %3, %2, %5) ({
      ^bb0(%arg10: index, %arg11: i64):
        %32 = "vector.extract"(%29, %arg10) <{static_position = array<i64: -9223372036854775808>}> : (vector<[16]xi8>, index) -> i8
        %33 = "arith.extui"(%32) : (i8) -> i64
        %34 = "arith.muli"(%arg11, %33) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        "scf.yield"(%34) : (i64) -> ()
      }) : (index, index, index, i64) -> i64
      %31 = "arith.muli"(%arg9, %30) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%31) : (i64) -> ()
    }) : (index, index, index, i64) -> i64
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %7 = "arith.constant"() <{value = 3 : index}> : () -> index
    %8 = "arith.constant"() <{value = 4 : i8}> : () -> i8
    %9 = "arith.constant"() <{value = 7 : index}> : () -> index
    %10 = "arith.constant"() <{value = 15 : i8}> : () -> i8
    "memref.store"(%8, %4, %7, %9) : (i8, memref<?x?xi8>, index, index) -> ()
    "memref.store"(%10, %4, %9, %7) : (i8, memref<?x?xi8>, index, index) -> ()
    %11 = "scf.for"(%0, %3, %2, %5) ({
    ^bb0(%arg4: index, %arg5: i64):
      %23 = "vector.load"(%4, %arg4, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8>
      %24 = "scf.for"(%0, %3, %2, %5) ({
      ^bb0(%arg6: index, %arg7: i64):
        %26 = "vector.extract"(%23, %arg6) <{static_position = array<i64: -9223372036854775808>}> : (vector<[16]xi8>, index) -> i8
        %27 = "arith.extui"(%26) : (i8) -> i64
        %28 = "arith.muli"(%arg7, %27) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        "scf.yield"(%28) : (i64) -> ()
      }) : (index, index, index, i64) -> i64
      %25 = "arith.muli"(%arg5, %24) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%25) : (i64) -> ()
    }) : (index, index, index, i64) -> i64
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %12 = "arith.constant"() <{value = dense<0> : vector<[16]x[16]xi8>}> : () -> vector<[16]x[16]xi8>
    "vector.transfer_write"(%12, %4, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[16]x[16]xi8>, memref<?x?xi8>, index, index) -> ()
    %13 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %14 = "scf.for"(%0, %3, %2, %13) ({
    ^bb0(%arg2: index, %arg3: i8):
      %20 = "vector.load"(%4, %arg2, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8>
      %21 = "vector.reduction"(%20) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<[16]xi8>) -> i8
      %22 = "arith.addi"(%arg3, %21) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "scf.yield"(%22) : (i8) -> ()
    }) : (index, index, index, i8) -> i8
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (i8) -> ()
    "memref.store"(%8, %4, %7, %9) : (i8, memref<?x?xi8>, index, index) -> ()
    "memref.store"(%10, %4, %9, %7) : (i8, memref<?x?xi8>, index, index) -> ()
    %15 = "scf.for"(%0, %3, %2, %13) ({
    ^bb0(%arg0: index, %arg1: i8):
      %17 = "vector.load"(%4, %arg0, %0) : (memref<?x?xi8>, index, index) -> vector<[16]xi8>
      %18 = "vector.reduction"(%17) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<[16]xi8>) -> i8
      %19 = "arith.addi"(%arg1, %18) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "scf.yield"(%19) : (i8) -> ()
    }) : (index, index, index, i8) -> i8
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (i8) -> ()
    %16 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%16) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

