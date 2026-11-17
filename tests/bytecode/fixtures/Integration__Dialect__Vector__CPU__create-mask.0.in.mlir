"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = -1 : index}> : () -> index loc("<stdin>":3:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":7:10)
    %6 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":8:10)
    %7 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":9:10)
    %8 = "vector.create_mask"(%4) : (index) -> vector<5xi1> loc("<stdin>":10:10)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> () loc("<stdin>":11:5)
    "scf.for"(%1, %7, %3) ({
    ^bb0(%arg5: index loc("<stdin>":13:10)):
      %16 = "vector.create_mask"(%arg5) : (index) -> vector<5xi1> loc("<stdin>":14:13)
      "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> () loc("<stdin>":15:7)
      "scf.yield"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index) -> () loc("<stdin>":12:5)
    %9 = "arith.constant"() <{value = 2251799813685248 : index}> : () -> index loc("<stdin>":18:10)
    %10 = "func.call"(%9) <{callee = @create_mask_large_bound}> : (index) -> vector<5xi1> loc("<stdin>":19:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> () loc("<stdin>":20:5)
    %11 = "vector.create_mask"(%4, %5) : (index, index) -> vector<5x5xi1> loc("<stdin>":21:11)
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> () loc("<stdin>":22:5)
    %12 = "vector.create_mask"(%5, %4) : (index, index) -> vector<5x5xi1> loc("<stdin>":23:11)
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> () loc("<stdin>":24:5)
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg4: index loc("<stdin>":26:10)):
      %15 = "vector.create_mask"(%4, %arg4) : (index, index) -> vector<5x5xi1> loc("<stdin>":27:13)
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> () loc("<stdin>":28:7)
      "scf.yield"() : () -> () loc("<stdin>":29:7)
    }) : (index, index, index) -> () loc("<stdin>":25:5)
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg3: index loc("<stdin>":32:10)):
      %14 = "vector.create_mask"(%arg3, %4) : (index, index) -> vector<5x5xi1> loc("<stdin>":33:13)
      "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> () loc("<stdin>":34:7)
      "scf.yield"() : () -> () loc("<stdin>":35:7)
    }) : (index, index, index) -> () loc("<stdin>":31:5)
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg1: index loc("<stdin>":38:10)):
      "scf.for"(%2, %6, %3) ({
      ^bb0(%arg2: index loc("<stdin>":40:12)):
        %13 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<5x5xi1> loc("<stdin>":41:15)
        "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> () loc("<stdin>":42:9)
        "scf.yield"() : () -> () loc("<stdin>":43:9)
      }) : (index, index, index) -> () loc("<stdin>":39:7)
      "scf.yield"() : () -> () loc("<stdin>":45:7)
    }) : (index, index, index) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> vector<5xi1>, sym_name = "create_mask_large_bound"}> ({
  ^bb0(%arg0: index loc("<stdin>":50:8)):
    %0 = "vector.create_mask"(%arg0) : (index) -> vector<5xi1> loc("<stdin>":51:10)
    "func.return"(%0) : (vector<5xi1>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":49:3)
}) : () -> () loc("<stdin>":1:1)
