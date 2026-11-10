"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = -1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index
    %6 = "arith.constant"() <{value = 6 : index}> : () -> index
    %7 = "arith.constant"() <{value = 7 : index}> : () -> index
    %8 = "vector.create_mask"(%4) : (index) -> vector<5xi1>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> ()
    "scf.for"(%1, %7, %3) ({
    ^bb0(%arg5: index):
      %16 = "vector.create_mask"(%arg5) : (index) -> vector<5xi1>
      "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "arith.constant"() <{value = 2251799813685248 : index}> : () -> index
    %10 = "func.call"(%9) <{callee = @create_mask_large_bound}> : (index) -> vector<5xi1>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> ()
    %11 = "vector.create_mask"(%4, %5) : (index, index) -> vector<5x5xi1>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
    %12 = "vector.create_mask"(%5, %4) : (index, index) -> vector<5x5xi1>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg4: index):
      %15 = "vector.create_mask"(%4, %arg4) : (index, index) -> vector<5x5xi1>
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg3: index):
      %14 = "vector.create_mask"(%arg3, %4) : (index, index) -> vector<5x5xi1>
      "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg1: index):
      "scf.for"(%2, %6, %3) ({
      ^bb0(%arg2: index):
        %13 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<5x5xi1>
        "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xi1>) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> vector<5xi1>, sym_name = "create_mask_large_bound"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.create_mask"(%arg0) : (index) -> vector<5xi1>
    "func.return"(%0) : (vector<5xi1>) -> ()
  }) : () -> ()
}) : () -> ()

