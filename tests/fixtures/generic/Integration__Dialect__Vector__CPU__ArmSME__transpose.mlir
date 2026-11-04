"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %4 = "memref.alloca"(%3, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32>
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %6 = "scf.for"(%0, %3, %1, %5) ({
    ^bb0(%arg0: index, %arg1: i32):
      %9 = "vector.broadcast"(%arg1) : (i32) -> vector<[4]xi32>
      "vector.store"(%9, %4, %arg0, %0) : (vector<[4]xi32>, memref<?x?xi32>, index, index) -> ()
      %10 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%10) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    %7 = "vector.load"(%4, %0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    %8 = "vector.transpose"(%7) <{permutation = array<i64: 1, 0>}> : (vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

