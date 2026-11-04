"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    %5 = "vector.create_mask"(%2) : (index) -> vector<4xi1>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg4: index):
      %11 = "vector.create_mask"(%arg4) : (index) -> vector<4xi1>
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %6 = "vector.create_mask"(%2, %3) : (index, index) -> vector<4x4xi1>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %7 = "vector.create_mask"(%3, %2) : (index, index) -> vector<4x4xi1>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg3: index):
      %10 = "vector.create_mask"(%2, %arg3) : (index, index) -> vector<4x4xi1>
      "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg2: index):
      %9 = "vector.create_mask"(%arg2, %2) : (index, index) -> vector<4x4xi1>
      "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index):
        %8 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<4x4xi1>
        "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

