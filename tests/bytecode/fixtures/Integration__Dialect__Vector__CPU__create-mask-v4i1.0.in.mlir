"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "vector.create_mask"(%2) : (index) -> vector<4xi1> loc("<stdin>":8:10)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> () loc("<stdin>":9:5)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg4: index loc("<stdin>":11:10)):
      %11 = "vector.create_mask"(%arg4) : (index) -> vector<4xi1> loc("<stdin>":12:13)
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> () loc("<stdin>":13:7)
      "scf.yield"() : () -> () loc("<stdin>":14:7)
    }) : (index, index, index) -> () loc("<stdin>":10:5)
    %6 = "vector.create_mask"(%2, %3) : (index, index) -> vector<4x4xi1> loc("<stdin>":16:10)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> () loc("<stdin>":17:5)
    %7 = "vector.create_mask"(%3, %2) : (index, index) -> vector<4x4xi1> loc("<stdin>":18:10)
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> () loc("<stdin>":19:5)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg3: index loc("<stdin>":21:10)):
      %10 = "vector.create_mask"(%2, %arg3) : (index, index) -> vector<4x4xi1> loc("<stdin>":22:13)
      "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> () loc("<stdin>":23:7)
      "scf.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index) -> () loc("<stdin>":20:5)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg2: index loc("<stdin>":27:10)):
      %9 = "vector.create_mask"(%arg2, %2) : (index, index) -> vector<4x4xi1> loc("<stdin>":28:12)
      "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> () loc("<stdin>":29:7)
      "scf.yield"() : () -> () loc("<stdin>":30:7)
    }) : (index, index, index) -> () loc("<stdin>":26:5)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index loc("<stdin>":33:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index loc("<stdin>":35:12)):
        %8 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<4x4xi1> loc("<stdin>":36:14)
        "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> () loc("<stdin>":37:9)
        "scf.yield"() : () -> () loc("<stdin>":38:9)
      }) : (index, index, index) -> () loc("<stdin>":34:7)
      "scf.yield"() : () -> () loc("<stdin>":40:7)
    }) : (index, index, index) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
