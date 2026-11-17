"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "basic"}> ({
  ^bb0(%arg6: index loc("<stdin>":3:8), %arg7: index loc("<stdin>":3:22)):
    %3 = "index.add"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":4:10)
    %4 = "index.sub"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":5:10)
    %5 = "index.mul"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":6:10)
    %6 = "index.divs"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":7:10)
    %7 = "index.divu"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":8:10)
    %8 = "index.rems"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":9:10)
    %9 = "index.remu"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":10:10)
    %10 = "index.maxs"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":11:11)
    %11 = "index.maxu"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":12:11)
    %12 = "index.mins"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":13:11)
    %13 = "index.minu"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":14:11)
    %14 = "index.shl"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":15:11)
    %15 = "index.shrs"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":16:11)
    %16 = "index.shru"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":17:11)
    %17 = "index.and"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":18:11)
    %18 = "index.or"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":19:11)
    %19 = "index.xor"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":20:11)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "cmp"}> ({
  ^bb0(%arg4: index loc("<stdin>":24:8), %arg5: index loc("<stdin>":24:22)):
    %2 = "index.cmp"(%arg4, %arg5) <{pred = #index<cmp_predicate eq>}> : (index, index) -> i1 loc("<stdin>":25:10)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivs"}> ({
  ^bb0(%arg2: index loc("<stdin>":29:8), %arg3: index loc("<stdin>":29:22)):
    %1 = "index.ceildivs"(%arg2, %arg3) : (index, index) -> index loc("<stdin>":30:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivu"}> ({
  ^bb0(%arg0: index loc("<stdin>":34:8), %arg1: index loc("<stdin>":34:22)):
    %0 = "index.ceildivu"(%arg0, %arg1) : (index, index) -> index loc("<stdin>":35:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
}) : () -> () loc("<stdin>":1:1)
