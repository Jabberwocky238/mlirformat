"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_outerproduct_no_accumulator_2x2xf64"}> ({
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index
    %32 = "arith.constant"() <{value = dense<1> : vector<[2]xi32>}> : () -> vector<[2]xi32>
    %33 = "llvm.intr.stepvector"() : () -> vector<[2]xi32>
    %34 = "arith.addi"(%33, %32) <{overflowFlags = #arith.overflow<none>}> : (vector<[2]xi32>, vector<[2]xi32>) -> vector<[2]xi32>
    %35 = "arith.sitofp"(%34) : (vector<[2]xi32>) -> vector<[2]xf64>
    %36 = "arith.constant"() <{value = 1 : index}> : () -> index
    %37 = "arith.constant"() <{value = 2 : index}> : () -> index
    %38 = "vector.create_mask"(%36, %37) : (index, index) -> vector<[2]x[2]xi1>
    %39 = "vector.outerproduct"(%35, %35) <{kind = #vector.kind<add>}> : (vector<[2]xf64>, vector<[2]xf64>) -> vector<[2]x[2]xf64>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]x[2]xf64>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_outerproduct_with_accumulator_2x2xf64"}> ({
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index
    %24 = "arith.constant"() <{value = dense<1> : vector<[2]xi32>}> : () -> vector<[2]xi32>
    %25 = "arith.constant"() <{value = 1.000000e+01 : f64}> : () -> f64
    %26 = "vector.broadcast"(%25) : (f64) -> vector<[2]x[2]xf64>
    %27 = "llvm.intr.stepvector"() : () -> vector<[2]xi32>
    %28 = "arith.addi"(%27, %24) <{overflowFlags = #arith.overflow<none>}> : (vector<[2]xi32>, vector<[2]xi32>) -> vector<[2]xi32>
    %29 = "arith.sitofp"(%28) : (vector<[2]xi32>) -> vector<[2]xf64>
    %30 = "vector.outerproduct"(%29, %29, %26) <{kind = #vector.kind<add>}> : (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>) -> vector<[2]x[2]xf64>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]x[2]xf64>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_masked_outerproduct_no_accumulator_2x2xf64"}> ({
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = dense<1> : vector<[2]xi32>}> : () -> vector<[2]xi32>
    %14 = "arith.constant"() <{value = 1.000000e+01 : f64}> : () -> f64
    %15 = "llvm.intr.stepvector"() : () -> vector<[2]xi32>
    %16 = "arith.addi"(%15, %13) <{overflowFlags = #arith.overflow<none>}> : (vector<[2]xi32>, vector<[2]xi32>) -> vector<[2]xi32>
    %17 = "arith.sitofp"(%16) : (vector<[2]xi32>) -> vector<[2]xf64>
    %18 = "arith.constant"() <{value = 2 : index}> : () -> index
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "vector.create_mask"(%18, %19) : (index, index) -> vector<[2]x[2]xi1>
    %21 = "vector.mask"(%20) ({
      %22 = "vector.outerproduct"(%17, %17) <{kind = #vector.kind<add>}> : (vector<[2]xf64>, vector<[2]xf64>) -> vector<[2]x[2]xf64>
      "vector.yield"(%22) : (vector<[2]x[2]xf64>) -> ()
    }) : (vector<[2]x[2]xi1>) -> vector<[2]x[2]xf64>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]x[2]xf64>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_masked_outerproduct_with_accumulator_2x2xf64"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<1> : vector<[2]xi32>}> : () -> vector<[2]xi32>
    %2 = "arith.constant"() <{value = 1.000000e+01 : f64}> : () -> f64
    %3 = "vector.broadcast"(%2) : (f64) -> vector<[2]x[2]xf64>
    %4 = "llvm.intr.stepvector"() : () -> vector<[2]xi32>
    %5 = "arith.addi"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<[2]xi32>, vector<[2]xi32>) -> vector<[2]xi32>
    %6 = "arith.sitofp"(%5) : (vector<[2]xi32>) -> vector<[2]xf64>
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index
    %9 = "vector.create_mask"(%7, %8) : (index, index) -> vector<[2]x[2]xi1>
    %10 = "vector.mask"(%9) ({
      %11 = "vector.outerproduct"(%6, %6, %3) <{kind = #vector.kind<add>}> : (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>) -> vector<[2]x[2]xf64>
      "vector.yield"(%11) : (vector<[2]x[2]xf64>) -> ()
    }) : (vector<[2]x[2]xi1>) -> vector<[2]x[2]xf64>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]x[2]xf64>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

