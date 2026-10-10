"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "identity"}> ({
  ^bb0(%arg3: tensor<f32>):
    "func.return"(%arg3) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "also_identity"}> ({
  ^bb0(%arg2: tensor<f32>):
    "func.return"(%arg2) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "yet_another_identity"}> ({
  ^bb0(%arg1: tensor<f32>):
    "func.return"(%arg1) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "user"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "func.call"(%arg0) <{callee = @identity}> : (tensor<f32>) -> tensor<f32>
    %1 = "func.call"(%0) <{callee = @also_identity}> : (tensor<f32>) -> tensor<f32>
    %2 = "func.call"(%1) <{callee = @yet_another_identity}> : (tensor<f32>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "add_lr"}> ({
  ^bb0(%arg8: f32, %arg9: f32):
    %7 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%7) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "also_add_lr"}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %6 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%6) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "add_rl"}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %5 = "arith.addf"(%arg5, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "also_add_rl"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %4 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "user"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "func.call"(%arg0, %arg1) <{callee = @add_lr}> : (f32, f32) -> f32
    %1 = "func.call"(%arg0, %arg1) <{callee = @also_add_lr}> : (f32, f32) -> f32
    %2 = "func.call"(%0, %1) <{callee = @add_rl}> : (f32, f32) -> f32
    %3 = "func.call"(%arg0, %2) <{callee = @also_add_rl}> : (f32, f32) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, f32, f32) -> f32, sym_name = "ite"}> ({
  ^bb0(%arg9: i1, %arg10: f32, %arg11: f32):
    %5 = "scf.if"(%arg9) ({
      "scf.yield"(%arg10) : (f32) -> ()
    }, {
      "scf.yield"(%arg11) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32, f32) -> f32, sym_name = "also_ite"}> ({
  ^bb0(%arg6: i1, %arg7: f32, %arg8: f32):
    %4 = "scf.if"(%arg6) ({
      "scf.yield"(%arg7) : (f32) -> ()
    }, {
      "scf.yield"(%arg8) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32, f32) -> f32, sym_name = "reverse_ite"}> ({
  ^bb0(%arg3: i1, %arg4: f32, %arg5: f32):
    %3 = "scf.if"(%arg3) ({
      "scf.yield"(%arg5) : (f32) -> ()
    }, {
      "scf.yield"(%arg4) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32, f32) -> f32, sym_name = "user"}> ({
  ^bb0(%arg0: i1, %arg1: f32, %arg2: f32):
    %0 = "func.call"(%arg0, %arg1, %arg2) <{callee = @also_ite}> : (i1, f32, f32) -> f32
    %1 = "func.call"(%arg0, %arg1, %arg2) <{callee = @ite}> : (i1, f32, f32) -> f32
    %2 = "func.call"(%arg0, %0, %1) <{callee = @reverse_ite}> : (i1, f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i1, i1, i1, f32, f32) -> f32, sym_name = "deep_tree"}> ({
  ^bb0(%arg18: i1, %arg19: i1, %arg20: i1, %arg21: i1, %arg22: f32, %arg23: f32):
    %33 = "scf.if"(%arg18) ({
      %41 = "scf.if"(%arg19) ({
        %45 = "scf.if"(%arg20) ({
          %47 = "scf.if"(%arg21) ({
            "scf.yield"(%arg22) : (f32) -> ()
          }, {
            "scf.yield"(%arg23) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%47) : (f32) -> ()
        }, {
          %46 = "scf.if"(%arg21) ({
            "scf.yield"(%arg23) : (f32) -> ()
          }, {
            "scf.yield"(%arg22) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%46) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%45) : (f32) -> ()
      }, {
        %42 = "scf.if"(%arg20) ({
          %44 = "scf.if"(%arg21) ({
            "scf.yield"(%arg23) : (f32) -> ()
          }, {
            "scf.yield"(%arg22) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%44) : (f32) -> ()
        }, {
          %43 = "scf.if"(%arg21) ({
            "scf.yield"(%arg22) : (f32) -> ()
          }, {
            "scf.yield"(%arg23) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%43) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%42) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%41) : (f32) -> ()
    }, {
      %34 = "scf.if"(%arg19) ({
        %38 = "scf.if"(%arg20) ({
          %40 = "scf.if"(%arg21) ({
            "scf.yield"(%arg23) : (f32) -> ()
          }, {
            "scf.yield"(%arg22) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%40) : (f32) -> ()
        }, {
          %39 = "scf.if"(%arg21) ({
            "scf.yield"(%arg22) : (f32) -> ()
          }, {
            "scf.yield"(%arg23) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%39) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%38) : (f32) -> ()
      }, {
        %35 = "scf.if"(%arg20) ({
          %37 = "scf.if"(%arg21) ({
            "scf.yield"(%arg22) : (f32) -> ()
          }, {
            "scf.yield"(%arg23) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%37) : (f32) -> ()
        }, {
          %36 = "scf.if"(%arg21) ({
            "scf.yield"(%arg23) : (f32) -> ()
          }, {
            "scf.yield"(%arg22) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%36) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%35) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%34) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%33) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1, i1, i1, f32, f32) -> f32, sym_name = "also_deep_tree"}> ({
  ^bb0(%arg12: i1, %arg13: i1, %arg14: i1, %arg15: i1, %arg16: f32, %arg17: f32):
    %18 = "scf.if"(%arg12) ({
      %26 = "scf.if"(%arg13) ({
        %30 = "scf.if"(%arg14) ({
          %32 = "scf.if"(%arg15) ({
            "scf.yield"(%arg16) : (f32) -> ()
          }, {
            "scf.yield"(%arg17) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%32) : (f32) -> ()
        }, {
          %31 = "scf.if"(%arg15) ({
            "scf.yield"(%arg17) : (f32) -> ()
          }, {
            "scf.yield"(%arg16) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%31) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%30) : (f32) -> ()
      }, {
        %27 = "scf.if"(%arg14) ({
          %29 = "scf.if"(%arg15) ({
            "scf.yield"(%arg17) : (f32) -> ()
          }, {
            "scf.yield"(%arg16) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%29) : (f32) -> ()
        }, {
          %28 = "scf.if"(%arg15) ({
            "scf.yield"(%arg16) : (f32) -> ()
          }, {
            "scf.yield"(%arg17) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%28) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%27) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%26) : (f32) -> ()
    }, {
      %19 = "scf.if"(%arg13) ({
        %23 = "scf.if"(%arg14) ({
          %25 = "scf.if"(%arg15) ({
            "scf.yield"(%arg17) : (f32) -> ()
          }, {
            "scf.yield"(%arg16) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%25) : (f32) -> ()
        }, {
          %24 = "scf.if"(%arg15) ({
            "scf.yield"(%arg16) : (f32) -> ()
          }, {
            "scf.yield"(%arg17) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%24) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%23) : (f32) -> ()
      }, {
        %20 = "scf.if"(%arg14) ({
          %22 = "scf.if"(%arg15) ({
            "scf.yield"(%arg16) : (f32) -> ()
          }, {
            "scf.yield"(%arg17) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%22) : (f32) -> ()
        }, {
          %21 = "scf.if"(%arg15) ({
            "scf.yield"(%arg17) : (f32) -> ()
          }, {
            "scf.yield"(%arg16) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%21) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%20) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%19) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%18) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1, i1, i1, f32, f32) -> f32, sym_name = "reverse_deep_tree"}> ({
  ^bb0(%arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1, %arg10: f32, %arg11: f32):
    %3 = "scf.if"(%arg6) ({
      %11 = "scf.if"(%arg7) ({
        %15 = "scf.if"(%arg8) ({
          %17 = "scf.if"(%arg9) ({
            "scf.yield"(%arg11) : (f32) -> ()
          }, {
            "scf.yield"(%arg10) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%17) : (f32) -> ()
        }, {
          %16 = "scf.if"(%arg9) ({
            "scf.yield"(%arg10) : (f32) -> ()
          }, {
            "scf.yield"(%arg11) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%16) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%15) : (f32) -> ()
      }, {
        %12 = "scf.if"(%arg8) ({
          %14 = "scf.if"(%arg9) ({
            "scf.yield"(%arg10) : (f32) -> ()
          }, {
            "scf.yield"(%arg11) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%14) : (f32) -> ()
        }, {
          %13 = "scf.if"(%arg9) ({
            "scf.yield"(%arg11) : (f32) -> ()
          }, {
            "scf.yield"(%arg10) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%13) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%12) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%11) : (f32) -> ()
    }, {
      %4 = "scf.if"(%arg7) ({
        %8 = "scf.if"(%arg8) ({
          %10 = "scf.if"(%arg9) ({
            "scf.yield"(%arg10) : (f32) -> ()
          }, {
            "scf.yield"(%arg11) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%10) : (f32) -> ()
        }, {
          %9 = "scf.if"(%arg9) ({
            "scf.yield"(%arg11) : (f32) -> ()
          }, {
            "scf.yield"(%arg10) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%9) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%8) : (f32) -> ()
      }, {
        %5 = "scf.if"(%arg8) ({
          %7 = "scf.if"(%arg9) ({
            "scf.yield"(%arg11) : (f32) -> ()
          }, {
            "scf.yield"(%arg10) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%7) : (f32) -> ()
        }, {
          %6 = "scf.if"(%arg9) ({
            "scf.yield"(%arg10) : (f32) -> ()
          }, {
            "scf.yield"(%arg11) : (f32) -> ()
          }) : (i1) -> f32
          "scf.yield"(%6) : (f32) -> ()
        }) : (i1) -> f32
        "scf.yield"(%5) : (f32) -> ()
      }) : (i1) -> f32
      "scf.yield"(%4) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1, i1, i1, f32, f32) -> (f32, f32, f32), sym_name = "user"}> ({
  ^bb0(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: f32, %arg5: f32):
    %0 = "func.call"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{callee = @deep_tree}> : (i1, i1, i1, i1, f32, f32) -> f32
    %1 = "func.call"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{callee = @also_deep_tree}> : (i1, i1, i1, i1, f32, f32) -> f32
    %2 = "func.call"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{callee = @reverse_deep_tree}> : (i1, i1, i1, i1, f32, f32) -> f32
    "func.return"(%0, %1, %2) : (f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "func_declaration", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "func_declaration1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (i32, i32), sym_name = "user"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "func.call"(%arg0, %arg1) <{callee = @func_declaration}> : (i32, i32) -> i32
    %1 = "func.call"(%arg0, %arg1) <{callee = @func_declaration1}> : (i32, i32) -> i32
    "func.return"(%0, %1) : (i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "identity"}> ({
  ^bb0(%arg3: tensor<f32>):
    "func.return"(%arg3) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "also_identity"}> ({
  ^bb0(%arg2: tensor<f32>):
    "func.return"(%arg2) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "yet_another_identity"}> ({
  ^bb0(%arg1: tensor<f32>):
    "func.return"(%arg1) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "user"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "func.constant"() <{value = @identity}> : () -> ((tensor<f32>) -> tensor<f32>)
    %1 = "func.call_indirect"(%0, %arg0) : ((tensor<f32>) -> tensor<f32>, tensor<f32>) -> tensor<f32>
    %2 = "func.constant"() <{value = @also_identity}> : () -> ((tensor<f32>) -> tensor<f32>)
    %3 = "func.call_indirect"(%2, %1) : ((tensor<f32>) -> tensor<f32>, tensor<f32>) -> tensor<f32>
    %4 = "func.call"(%3) <{callee = @yet_another_identity}> : (tensor<f32>) -> tensor<f32>
    "func.return"(%4) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

