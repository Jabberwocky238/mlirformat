"builtin.module"() ({
  "func.func"() <{function_type = (i16, i16, i16, i16) -> (), sym_name = "check_results"}> ({
  ^bb0(%arg42: i16, %arg43: i16, %arg44: i16, %arg45: i16):
    %79 = "arith.constant"() <{value = dense<0> : vector<2xi16>}> : () -> vector<2xi16>
    %80 = "vector.insert"(%arg42, %79) <{static_position = array<i64: 0>}> : (i16, vector<2xi16>) -> vector<2xi16>
    %81 = "vector.insert"(%arg43, %80) <{static_position = array<i64: 1>}> : (i16, vector<2xi16>) -> vector<2xi16>
    "vector.print"(%81) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi16>) -> ()
    "vector.print"(%arg44) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    %82 = "arith.cmpi"(%arg44, %arg45) <{predicate = 1 : i64}> : (i16, i16) -> i1
    "scf.if"(%82) ({
      "vector.print"(%arg45) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
      "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Mismatch\0A"}> : () -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i16, sym_name = "xorshift"}> ({
  ^bb0(%arg41: i16):
    %76 = "arith.constant"() <{value = 8 : i16}> : () -> i16
    %77 = "arith.shrui"(%arg41, %76) : (i16, i16) -> i16
    %78 = "arith.xori"(%arg41, %77) : (i16, i16) -> i16
    "func.return"(%78) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i16, sym_name = "xhash"}> ({
  ^bb0(%arg40: i16):
    %70 = "arith.constant"() <{value = 21845 : i16}> : () -> i16
    %71 = "arith.constant"() <{value = 25867 : i16}> : () -> i16
    %72 = "func.call"(%arg40) <{callee = @xorshift}> : (i16) -> i16
    %73 = "arith.muli"(%72, %70) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    %74 = "func.call"(%73) <{callee = @xorshift}> : (i16) -> i16
    %75 = "arith.muli"(%74, %71) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%75) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_addi"}> ({
  ^bb0(%arg38: i16, %arg39: i16):
    %69 = "arith.addi"(%arg38, %arg39) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%69) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_addi"}> ({
  ^bb0(%arg36: i16, %arg37: i16):
    %67 = "arith.addi"(%arg36, %arg37) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    %68 = "func.call"(%arg36, %arg37) <{callee = @emulate_addi}> : (i16, i16) -> i16
    "func.call"(%arg36, %arg37, %67, %68) <{callee = @check_results}> : (i16, i16, i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_addi"}> ({
    %56 = "arith.constant"() <{value = 0 : index}> : () -> index
    %57 = "arith.constant"() <{value = 1 : index}> : () -> index
    %58 = "arith.constant"() <{value = 500 : index}> : () -> index
    %59 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %60 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %61 = "scf.for"(%56, %58, %57, %59) ({
    ^bb0(%arg32: index, %arg33: i16):
      %62 = "func.call"(%arg33) <{callee = @xhash}> : (i16) -> i16
      %63 = "scf.for"(%56, %58, %57, %59) ({
      ^bb0(%arg34: index, %arg35: i16):
        %65 = "func.call"(%arg35) <{callee = @xhash}> : (i16) -> i16
        "func.call"(%62, %65) <{callee = @check_addi}> : (i16, i16) -> ()
        %66 = "arith.addi"(%arg35, %60) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
        "scf.yield"(%66) : (i16) -> ()
      }) : (index, index, index, i16) -> i16
      %64 = "arith.addi"(%arg33, %60) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      "scf.yield"(%64) : (i16) -> ()
    }) : (index, index, index, i16) -> i16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_muli"}> ({
  ^bb0(%arg30: i16, %arg31: i16):
    %55 = "arith.muli"(%arg30, %arg31) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%55) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_muli"}> ({
  ^bb0(%arg28: i16, %arg29: i16):
    %53 = "arith.muli"(%arg28, %arg29) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    %54 = "func.call"(%arg28, %arg29) <{callee = @emulate_muli}> : (i16, i16) -> i16
    "func.call"(%arg28, %arg29, %53, %54) <{callee = @check_results}> : (i16, i16, i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_muli"}> ({
    %42 = "arith.constant"() <{value = 0 : index}> : () -> index
    %43 = "arith.constant"() <{value = 1 : index}> : () -> index
    %44 = "arith.constant"() <{value = 500 : index}> : () -> index
    %45 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %46 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %47 = "scf.for"(%42, %44, %43, %45) ({
    ^bb0(%arg24: index, %arg25: i16):
      %48 = "func.call"(%arg25) <{callee = @xhash}> : (i16) -> i16
      %49 = "scf.for"(%42, %44, %43, %45) ({
      ^bb0(%arg26: index, %arg27: i16):
        %51 = "func.call"(%arg27) <{callee = @xhash}> : (i16) -> i16
        "func.call"(%48, %51) <{callee = @check_muli}> : (i16, i16) -> ()
        %52 = "arith.addi"(%arg27, %46) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
        "scf.yield"(%52) : (i16) -> ()
      }) : (index, index, index, i16) -> i16
      %50 = "arith.addi"(%arg25, %46) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      "scf.yield"(%50) : (i16) -> ()
    }) : (index, index, index, i16) -> i16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_shli"}> ({
  ^bb0(%arg22: i16, %arg23: i16):
    %41 = "arith.shli"(%arg22, %arg23) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%41) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_shli"}> ({
  ^bb0(%arg20: i16, %arg21: i16):
    %39 = "arith.shli"(%arg20, %arg21) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    %40 = "func.call"(%arg20, %arg21) <{callee = @emulate_shli}> : (i16, i16) -> i16
    "func.call"(%arg20, %arg21, %39, %40) <{callee = @check_results}> : (i16, i16, i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shli"}> ({
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "arith.constant"() <{value = 16 : index}> : () -> index
    %31 = "arith.constant"() <{value = 100 : index}> : () -> index
    %32 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %33 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %34 = "scf.for"(%28, %31, %29, %32) ({
    ^bb0(%arg16: index, %arg17: i16):
      %35 = "func.call"(%arg17) <{callee = @xhash}> : (i16) -> i16
      %36 = "scf.for"(%28, %30, %29, %32) ({
      ^bb0(%arg18: index, %arg19: i16):
        "func.call"(%35, %arg19) <{callee = @check_shli}> : (i16, i16) -> ()
        %38 = "arith.addi"(%arg19, %33) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
        "scf.yield"(%38) : (i16) -> ()
      }) : (index, index, index, i16) -> i16
      %37 = "arith.addi"(%arg17, %33) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      "scf.yield"(%37) : (i16) -> ()
    }) : (index, index, index, i16) -> i16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_shrsi"}> ({
  ^bb0(%arg14: i16, %arg15: i16):
    %27 = "arith.shrsi"(%arg14, %arg15) : (i16, i16) -> i16
    "func.return"(%27) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_shrsi"}> ({
  ^bb0(%arg12: i16, %arg13: i16):
    %25 = "arith.shrsi"(%arg12, %arg13) : (i16, i16) -> i16
    %26 = "func.call"(%arg12, %arg13) <{callee = @emulate_shrsi}> : (i16, i16) -> i16
    "func.call"(%arg12, %arg13, %25, %26) <{callee = @check_results}> : (i16, i16, i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shrsi"}> ({
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "arith.constant"() <{value = 16 : index}> : () -> index
    %17 = "arith.constant"() <{value = 100 : index}> : () -> index
    %18 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %19 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %20 = "scf.for"(%14, %17, %15, %18) ({
    ^bb0(%arg8: index, %arg9: i16):
      %21 = "func.call"(%arg9) <{callee = @xhash}> : (i16) -> i16
      %22 = "scf.for"(%14, %16, %15, %18) ({
      ^bb0(%arg10: index, %arg11: i16):
        "func.call"(%21, %arg11) <{callee = @check_shrsi}> : (i16, i16) -> ()
        %24 = "arith.addi"(%arg11, %19) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
        "scf.yield"(%24) : (i16) -> ()
      }) : (index, index, index, i16) -> i16
      %23 = "arith.addi"(%arg9, %19) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      "scf.yield"(%23) : (i16) -> ()
    }) : (index, index, index, i16) -> i16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_shrui"}> ({
  ^bb0(%arg6: i16, %arg7: i16):
    %13 = "arith.shrui"(%arg6, %arg7) : (i16, i16) -> i16
    "func.return"(%13) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_shrui"}> ({
  ^bb0(%arg4: i16, %arg5: i16):
    %11 = "arith.shrui"(%arg4, %arg5) : (i16, i16) -> i16
    %12 = "func.call"(%arg4, %arg5) <{callee = @emulate_shrui}> : (i16, i16) -> i16
    "func.call"(%arg4, %arg5, %11, %12) <{callee = @check_results}> : (i16, i16, i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shrui"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 100 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %5 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %6 = "scf.for"(%0, %3, %1, %4) ({
    ^bb0(%arg0: index, %arg1: i16):
      %7 = "func.call"(%arg1) <{callee = @xhash}> : (i16) -> i16
      %8 = "scf.for"(%0, %2, %1, %4) ({
      ^bb0(%arg2: index, %arg3: i16):
        "func.call"(%7, %arg3) <{callee = @check_shrui}> : (i16, i16) -> ()
        %10 = "arith.addi"(%arg3, %5) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
        "scf.yield"(%10) : (i16) -> ()
      }) : (index, index, index, i16) -> i16
      %9 = "arith.addi"(%arg1, %5) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      "scf.yield"(%9) : (i16) -> ()
    }) : (index, index, index, i16) -> i16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    "func.call"() <{callee = @test_addi}> : () -> ()
    "func.call"() <{callee = @test_muli}> : () -> ()
    "func.call"() <{callee = @test_shli}> : () -> ()
    "func.call"() <{callee = @test_shrsi}> : () -> ()
    "func.call"() <{callee = @test_shrui}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

