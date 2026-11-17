"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index) -> (), sym_name = "print_i8s"}> ({
  ^bb0(%arg6: memref<?xi8> loc("<stdin>":3:8), %arg7: index loc("<stdin>":3:29)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %16 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":5:11)
    "scf.for"(%15, %arg7, %16) ({
    ^bb0(%arg8: index loc("<stdin>":7:10)):
      %17 = "vector.load"(%arg6, %arg8) : (memref<?xi8>, index) -> vector<16xi8> loc("<stdin>":8:13)
      "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<16xi8>) -> () loc("<stdin>":9:7)
      "scf.yield"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?x?xi128>, memref<?x?xi128>) -> (), sym_name = "vector_copy_i128"}> ({
  ^bb0(%arg4: memref<?x?xi128> loc("<stdin>":15:8), %arg5: memref<?x?xi128> loc("<stdin>":15:33)):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":16:11)
    %14 = "vector.load"(%arg4, %13, %13) : (memref<?x?xi128>, index, index) -> vector<[1]x[1]xi128> loc("<stdin>":17:11)
    "vector.store"(%14, %arg5, %13, %13) : (vector<[1]x[1]xi128>, memref<?x?xi128>, index, index) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_load_store_zaq0"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":22:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":23:10)
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":24:10)
    %3 = "vector.vscale"() : () -> index loc("<stdin>":25:10)
    %4 = "arith.muli"(%1, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":26:10)
    %5 = "arith.muli"(%4, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":27:10)
    %6 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":28:10)
    %7 = "memref.alloca"(%6) <{alignment = 16 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8> loc("<stdin>":29:10)
    %8 = "memref.alloca"(%6) <{alignment = 16 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8> loc("<stdin>":30:10)
    %9 = "arith.constant"() <{value = 7 : i8}> : () -> i8 loc("<stdin>":31:10)
    %10 = "arith.constant"() <{value = 64 : i8}> : () -> i8 loc("<stdin>":32:11)
    "linalg.fill"(%9, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i8 loc("<stdin>":34:10), %arg3: i8 loc("<stdin>":34:21)):
      "linalg.yield"(%arg2) : (i8) -> () loc("<stdin>":35:7)
    }) : (i8, memref<?xi8>) -> () loc("<stdin>":33:5)
    "linalg.fill"(%10, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: i8 loc("<stdin>":38:10), %arg1: i8 loc("<stdin>":38:21)):
      "linalg.yield"(%arg0) : (i8) -> () loc("<stdin>":39:7)
    }) : (i8, memref<?xi8>) -> () loc("<stdin>":37:5)
    %11 = "memref.view"(%7, %0, %4, %4) : (memref<?xi8>, index, index, index) -> memref<?x?xi128> loc("<stdin>":41:11)
    %12 = "memref.view"(%8, %0, %4, %4) : (memref<?xi8>, index, index, index) -> memref<?x?xi128> loc("<stdin>":42:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "INITIAL TILE A:\0A"}> : () -> () loc("<stdin>":43:5)
    "func.call"(%7, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> () loc("<stdin>":44:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> () loc("<stdin>":45:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "INITIAL TILE B:\0A"}> : () -> () loc("<stdin>":46:5)
    "func.call"(%8, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> () loc("<stdin>":47:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> () loc("<stdin>":48:5)
    "func.call"(%11, %12) <{callee = @vector_copy_i128}> : (memref<?x?xi128>, memref<?x?xi128>) -> () loc("<stdin>":49:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "FINAL TILE A:\0A"}> : () -> () loc("<stdin>":50:5)
    "func.call"(%7, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> () loc("<stdin>":51:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> () loc("<stdin>":52:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "FINAL TILE B:\0A"}> : () -> () loc("<stdin>":53:5)
    "func.call"(%8, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> () loc("<stdin>":54:5)
    "func.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":1:1)
