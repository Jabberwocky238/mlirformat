"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_outerproduct_no_accumulator_4x4xf32"}> ({
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "llvm.intr.stepvector"() : () -> vector<[4]xi32>
    %30 = "arith.sitofp"(%29) : (vector<[4]xi32>) -> vector<[4]xf32>
    %31 = "vector.outerproduct"(%30, %30) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_outerproduct_with_accumulator_4x4xf32"}> ({
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %24 = "vector.broadcast"(%23) : (f32) -> vector<[4]x[4]xf32>
    %25 = "llvm.intr.stepvector"() : () -> vector<[4]xi32>
    %26 = "arith.sitofp"(%25) : (vector<[4]xi32>) -> vector<[4]xf32>
    %27 = "vector.outerproduct"(%26, %26, %24) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_masked_outerproduct_no_accumulator_4x4xf32"}> ({
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = dense<1> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %14 = "llvm.intr.stepvector"() : () -> vector<[4]xi32>
    %15 = "arith.addi"(%14, %13) <{overflowFlags = #arith.overflow<none>}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %16 = "arith.sitofp"(%15) : (vector<[4]xi32>) -> vector<[4]xf32>
    %17 = "arith.constant"() <{value = 3 : index}> : () -> index
    %18 = "arith.constant"() <{value = 2 : index}> : () -> index
    %19 = "vector.create_mask"(%17, %18) : (index, index) -> vector<[4]x[4]xi1>
    %20 = "vector.mask"(%19) ({
      %21 = "vector.outerproduct"(%16, %16) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]x[4]xf32>
      "vector.yield"(%21) : (vector<[4]x[4]xf32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_masked_outerproduct_with_accumulator_4x4xf32"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<1> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %2 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %3 = "vector.broadcast"(%2) : (f32) -> vector<[4]x[4]xf32>
    %4 = "llvm.intr.stepvector"() : () -> vector<[4]xi32>
    %5 = "arith.addi"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %6 = "arith.sitofp"(%5) : (vector<[4]xi32>) -> vector<[4]xf32>
    %7 = "arith.constant"() <{value = 2 : index}> : () -> index
    %8 = "arith.constant"() <{value = 3 : index}> : () -> index
    %9 = "vector.create_mask"(%7, %8) : (index, index) -> vector<[4]x[4]xi1>
    %10 = "vector.mask"(%9) ({
      %11 = "vector.outerproduct"(%6, %6, %3) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
      "vector.yield"(%11) : (vector<[4]x[4]xf32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

