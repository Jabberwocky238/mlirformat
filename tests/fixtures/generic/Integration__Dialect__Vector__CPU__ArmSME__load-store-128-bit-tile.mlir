"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index) -> (), sym_name = "print_i8s"}> ({
  ^bb0(%arg6: memref<?xi8>, %arg7: index):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 16 : index}> : () -> index
    "scf.for"(%15, %arg7, %16) ({
    ^bb0(%arg8: index):
      %17 = "vector.load"(%arg6, %arg8) : (memref<?xi8>, index) -> vector<16xi8>
      "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<16xi8>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi128>, memref<?x?xi128>) -> (), sym_name = "vector_copy_i128"}> ({
  ^bb0(%arg4: memref<?x?xi128>, %arg5: memref<?x?xi128>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "vector.load"(%arg4, %13, %13) : (memref<?x?xi128>, index, index) -> vector<[1]x[1]xi128>
    "vector.store"(%14, %arg5, %13, %13) : (vector<[1]x[1]xi128>, memref<?x?xi128>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_load_store_zaq0"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "vector.vscale"() : () -> index
    %4 = "arith.muli"(%1, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %5 = "arith.muli"(%4, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %6 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %7 = "memref.alloca"(%6) <{alignment = 16 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %8 = "memref.alloca"(%6) <{alignment = 16 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %9 = "arith.constant"() <{value = 7 : i8}> : () -> i8
    %10 = "arith.constant"() <{value = 64 : i8}> : () -> i8
    "linalg.fill"(%9, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i8, %arg3: i8):
      "linalg.yield"(%arg2) : (i8) -> ()
    }) : (i8, memref<?xi8>) -> ()
    "linalg.fill"(%10, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: i8, %arg1: i8):
      "linalg.yield"(%arg0) : (i8) -> ()
    }) : (i8, memref<?xi8>) -> ()
    %11 = "memref.view"(%7, %0, %4, %4) : (memref<?xi8>, index, index, index) -> memref<?x?xi128>
    %12 = "memref.view"(%8, %0, %4, %4) : (memref<?xi8>, index, index, index) -> memref<?x?xi128>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "INITIAL TILE A:\0A"}> : () -> ()
    "func.call"(%7, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "INITIAL TILE B:\0A"}> : () -> ()
    "func.call"(%8, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> ()
    "func.call"(%11, %12) <{callee = @vector_copy_i128}> : (memref<?x?xi128>, memref<?x?xi128>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "FINAL TILE A:\0A"}> : () -> ()
    "func.call"(%7, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "FINAL TILE B:\0A"}> : () -> ()
    "func.call"(%8, %6) <{callee = @print_i8s}> : (memref<?xi8>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

