"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:10)
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.muli"(%3, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":7:10)
    %5 = "memref.alloca"(%3, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi32> loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:10)
    %7 = "scf.for"(%0, %3, %1, %6) ({
    ^bb0(%arg1: index loc("<stdin>":11:10), %arg2: i32 loc("<stdin>":11:24)):
      %10 = "vector.broadcast"(%arg2) : (i32) -> vector<[4]xi32> loc("<stdin>":12:13)
      "vector.store"(%10, %5, %arg1, %0) : (vector<[4]xi32>, memref<?x?xi32>, index, index) -> () loc("<stdin>":13:7)
      %11 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":14:13)
      "scf.yield"(%11) : (i32) -> () loc("<stdin>":15:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":10:10)
    %8 = "arm_sme.tile_load"(%5, %0, %0) <{layout = #arm_sme.layout<vertical>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32> loc("<stdin>":17:10)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> () loc("<stdin>":18:5)
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg0: index loc("<stdin>":20:10)):
      %9 = "vector.load"(%5, %arg0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]xi32> loc("<stdin>":21:12)
      "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> () loc("<stdin>":22:7)
      "scf.yield"() : () -> () loc("<stdin>":23:7)
    }) : (index, index, index) -> () loc("<stdin>":19:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> () loc("<stdin>":25:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> () loc("<stdin>":26:5)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> () loc("<stdin>":27:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
