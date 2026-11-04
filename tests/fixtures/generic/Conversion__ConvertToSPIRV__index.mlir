"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "basic"}> ({
  ^bb0(%arg6: index, %arg7: index):
    %3 = "index.add"(%arg6, %arg7) : (index, index) -> index
    %4 = "index.sub"(%arg6, %arg7) : (index, index) -> index
    %5 = "index.mul"(%arg6, %arg7) : (index, index) -> index
    %6 = "index.divs"(%arg6, %arg7) : (index, index) -> index
    %7 = "index.divu"(%arg6, %arg7) : (index, index) -> index
    %8 = "index.rems"(%arg6, %arg7) : (index, index) -> index
    %9 = "index.remu"(%arg6, %arg7) : (index, index) -> index
    %10 = "index.maxs"(%arg6, %arg7) : (index, index) -> index
    %11 = "index.maxu"(%arg6, %arg7) : (index, index) -> index
    %12 = "index.mins"(%arg6, %arg7) : (index, index) -> index
    %13 = "index.minu"(%arg6, %arg7) : (index, index) -> index
    %14 = "index.shl"(%arg6, %arg7) : (index, index) -> index
    %15 = "index.shrs"(%arg6, %arg7) : (index, index) -> index
    %16 = "index.shru"(%arg6, %arg7) : (index, index) -> index
    %17 = "index.and"(%arg6, %arg7) : (index, index) -> index
    %18 = "index.or"(%arg6, %arg7) : (index, index) -> index
    %19 = "index.xor"(%arg6, %arg7) : (index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "cmp"}> ({
  ^bb0(%arg4: index, %arg5: index):
    %2 = "index.cmp"(%arg4, %arg5) <{pred = #index<cmp_predicate eq>}> : (index, index) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivs"}> ({
  ^bb0(%arg2: index, %arg3: index):
    %1 = "index.ceildivs"(%arg2, %arg3) : (index, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivu"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "index.ceildivu"(%arg0, %arg1) : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

