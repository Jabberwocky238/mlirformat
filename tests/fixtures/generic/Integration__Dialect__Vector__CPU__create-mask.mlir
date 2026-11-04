"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    %5 = "arith.constant"() <{value = 6 : index}> : () -> index
    %6 = "arith.constant"() <{value = 7 : index}> : () -> index
    %7 = "vector.create_mask"(%3) : (index) -> vector<5xi1>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> ()
    "scf.for"(%0, %6, %2) ({
    ^bb0(%arg4: index):
      %13 = "vector.create_mask"(%arg4) : (index) -> vector<5xi1>
      "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %8 = "vector.create_mask"(%3, %4) : (index, index) -> vector<5x5xi1>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
    %9 = "vector.create_mask"(%4, %3) : (index, index) -> vector<5x5xi1>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg3: index):
      %12 = "vector.create_mask"(%3, %arg3) : (index, index) -> vector<5x5xi1>
      "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg2: index):
      %11 = "vector.create_mask"(%arg2, %3) : (index, index) -> vector<5x5xi1>
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg0: index):
      "scf.for"(%1, %5, %2) ({
      ^bb0(%arg1: index):
        %10 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<5x5xi1>
        "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

