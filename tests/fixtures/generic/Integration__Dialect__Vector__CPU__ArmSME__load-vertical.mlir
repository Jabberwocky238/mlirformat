"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %4 = "arith.muli"(%3, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %5 = "memref.alloca"(%3, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32>
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "scf.for"(%0, %3, %1, %6) ({
    ^bb0(%arg1: index, %arg2: i32):
      %10 = "vector.broadcast"(%arg2) : (i32) -> vector<[4]xi32>
      "vector.store"(%10, %5, %arg1, %0) : (vector<[4]xi32>, memref<?x?xi32>, index, index) -> ()
      %11 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%11) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    %8 = "arm_sme.tile_load"(%5, %0, %0) <{layout = #arm_sme.layout<vertical>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg0: index):
      %9 = "vector.load"(%5, %arg0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]xi32>
      "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

