"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %71 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%71) <{callee = @setArmSVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_outerproduct_i8i8i32}> : () -> ()
    "func.call"() <{callee = @test_masked_outerproduct_i8i8i32}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_outerproduct_i8i8i32"}> ({
    %42 = "llvm.mlir.undef"() : () -> vector<[4]xi8>
    %43 = "arith.constant"() <{value = dense<[0, 4, 8, 12]> : vector<4xi8>}> : () -> vector<4xi8>
    %44 = "arith.constant"() <{value = dense<[1, 5, 9, 13]> : vector<4xi8>}> : () -> vector<4xi8>
    %45 = "arith.constant"() <{value = dense<[2, 6, 10, 14]> : vector<4xi8>}> : () -> vector<4xi8>
    %46 = "arith.constant"() <{value = dense<[3, 7, 11, 15]> : vector<4xi8>}> : () -> vector<4xi8>
    %47 = "arith.constant"() <{value = dense<[16, 20, 24, 28]> : vector<4xi8>}> : () -> vector<4xi8>
    %48 = "arith.constant"() <{value = dense<[17, 21, 25, 29]> : vector<4xi8>}> : () -> vector<4xi8>
    %49 = "arith.constant"() <{value = dense<[18, 22, 26, 30]> : vector<4xi8>}> : () -> vector<4xi8>
    %50 = "arith.constant"() <{value = dense<[19, 23, 27, 31]> : vector<4xi8>}> : () -> vector<4xi8>
    %51 = "vector.scalable.insert"(%43, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %52 = "vector.scalable.insert"(%47, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %53 = "vector.scalable.insert"(%44, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %54 = "vector.scalable.insert"(%48, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %55 = "vector.scalable.insert"(%45, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %56 = "vector.scalable.insert"(%49, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %57 = "vector.scalable.insert"(%46, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %58 = "vector.scalable.insert"(%50, %42) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %59 = "arith.extsi"(%51) : (vector<[4]xi8>) -> vector<[4]xi32>
    %60 = "arith.extsi"(%52) : (vector<[4]xi8>) -> vector<[4]xi32>
    %61 = "arith.extsi"(%53) : (vector<[4]xi8>) -> vector<[4]xi32>
    %62 = "arith.extsi"(%54) : (vector<[4]xi8>) -> vector<[4]xi32>
    %63 = "arith.extsi"(%55) : (vector<[4]xi8>) -> vector<[4]xi32>
    %64 = "arith.extsi"(%56) : (vector<[4]xi8>) -> vector<[4]xi32>
    %65 = "arith.extsi"(%57) : (vector<[4]xi8>) -> vector<[4]xi32>
    %66 = "arith.extsi"(%58) : (vector<[4]xi8>) -> vector<[4]xi32>
    %67 = "vector.outerproduct"(%59, %60) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]x[4]xi32>
    %68 = "vector.outerproduct"(%61, %62, %67) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    %69 = "vector.outerproduct"(%63, %64, %68) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    %70 = "vector.outerproduct"(%65, %66, %69) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    "vector.print"(%70) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_masked_outerproduct_i8i8i32"}> ({
    %0 = "llvm.mlir.undef"() : () -> vector<[4]xi8>
    %1 = "arith.constant"() <{value = dense<[0, 4, 8, 12]> : vector<4xi8>}> : () -> vector<4xi8>
    %2 = "arith.constant"() <{value = dense<[1, 5, 9, 13]> : vector<4xi8>}> : () -> vector<4xi8>
    %3 = "arith.constant"() <{value = dense<[2, 6, 10, 14]> : vector<4xi8>}> : () -> vector<4xi8>
    %4 = "arith.constant"() <{value = dense<[3, 7, 11, 15]> : vector<4xi8>}> : () -> vector<4xi8>
    %5 = "arith.constant"() <{value = dense<[16, 20, 24, 28]> : vector<4xi8>}> : () -> vector<4xi8>
    %6 = "arith.constant"() <{value = dense<[17, 21, 25, 29]> : vector<4xi8>}> : () -> vector<4xi8>
    %7 = "arith.constant"() <{value = dense<[18, 22, 26, 30]> : vector<4xi8>}> : () -> vector<4xi8>
    %8 = "arith.constant"() <{value = dense<[19, 23, 27, 31]> : vector<4xi8>}> : () -> vector<4xi8>
    %9 = "vector.scalable.insert"(%1, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %10 = "vector.scalable.insert"(%5, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %11 = "vector.scalable.insert"(%2, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %12 = "vector.scalable.insert"(%6, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %13 = "vector.scalable.insert"(%3, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %14 = "vector.scalable.insert"(%7, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %15 = "vector.scalable.insert"(%4, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %16 = "vector.scalable.insert"(%8, %0) <{pos = 0 : i64}> : (vector<4xi8>, vector<[4]xi8>) -> vector<[4]xi8>
    %17 = "arith.extsi"(%9) : (vector<[4]xi8>) -> vector<[4]xi32>
    %18 = "arith.extsi"(%10) : (vector<[4]xi8>) -> vector<[4]xi32>
    %19 = "arith.extsi"(%11) : (vector<[4]xi8>) -> vector<[4]xi32>
    %20 = "arith.extsi"(%12) : (vector<[4]xi8>) -> vector<[4]xi32>
    %21 = "arith.extsi"(%13) : (vector<[4]xi8>) -> vector<[4]xi32>
    %22 = "arith.extsi"(%14) : (vector<[4]xi8>) -> vector<[4]xi32>
    %23 = "arith.extsi"(%15) : (vector<[4]xi8>) -> vector<[4]xi32>
    %24 = "arith.extsi"(%16) : (vector<[4]xi8>) -> vector<[4]xi32>
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "arith.constant"() <{value = 2 : index}> : () -> index
    %27 = "arith.constant"() <{value = 3 : index}> : () -> index
    %28 = "arith.constant"() <{value = 4 : index}> : () -> index
    %29 = "vector.create_mask"(%25, %25) : (index, index) -> vector<[4]x[4]xi1>
    %30 = "vector.create_mask"(%25, %26) : (index, index) -> vector<[4]x[4]xi1>
    %31 = "vector.create_mask"(%26, %27) : (index, index) -> vector<[4]x[4]xi1>
    %32 = "vector.create_mask"(%27, %28) : (index, index) -> vector<[4]x[4]xi1>
    %33 = "arith.constant"() <{value = dense<2> : vector<[4]x[4]xi32>}> : () -> vector<[4]x[4]xi32>
    %34 = "vector.mask"(%29) ({
      %41 = "vector.outerproduct"(%17, %18, %33) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
      "vector.yield"(%41) : (vector<[4]x[4]xi32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xi32>
    %35 = "vector.mask"(%30) ({
      %40 = "vector.outerproduct"(%19, %20, %34) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
      "vector.yield"(%40) : (vector<[4]x[4]xi32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xi32>
    %36 = "vector.mask"(%31) ({
      %39 = "vector.outerproduct"(%21, %22, %35) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
      "vector.yield"(%39) : (vector<[4]x[4]xi32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xi32>
    %37 = "vector.mask"(%32) ({
      %38 = "vector.outerproduct"(%23, %24, %36) <{kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
      "vector.yield"(%38) : (vector<[4]x[4]xi32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xi32>
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

