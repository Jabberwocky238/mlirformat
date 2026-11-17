"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_same_for_both"}> ({
  ^bb0(%arg3: index loc("<stdin>":3:8)):
    %18 = "index.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:11)
    %19 = "index.constant"() <{value = 4294967294 : index}> : () -> index loc("<stdin>":5:11)
    %20 = "index.minu"(%arg3, %19) : (index, index) -> index loc("<stdin>":6:11)
    %21 = "index.add"(%20, %18) : (index, index) -> index loc("<stdin>":7:11)
    %22 = "index.cmp"(%21, %18) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1 loc("<stdin>":8:11)
    "func.return"(%22) : (i1) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_unsigned_ov"}> ({
  ^bb0(%arg2: index loc("<stdin>":12:8)):
    %13 = "index.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":13:11)
    %14 = "index.constant"() <{value = 4294967295 : index}> : () -> index loc("<stdin>":14:11)
    %15 = "index.minu"(%arg2, %14) : (index, index) -> index loc("<stdin>":15:11)
    %16 = "index.add"(%15, %13) : (index, index) -> index loc("<stdin>":16:11)
    %17 = "index.cmp"(%16, %13) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1 loc("<stdin>":17:11)
    "func.return"(%17) : (i1) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_signed_ov"}> ({
  ^bb0(%arg1: index loc("<stdin>":21:8)):
    %7 = "index.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":22:10)
    %8 = "index.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":23:10)
    %9 = "index.constant"() <{value = 2147483647 : index}> : () -> index loc("<stdin>":24:10)
    %10 = "index.minu"(%arg1, %9) : (index, index) -> index loc("<stdin>":25:11)
    %11 = "index.add"(%10, %8) : (index, index) -> index loc("<stdin>":26:11)
    %12 = "index.cmp"(%11, %7) <{pred = #index<cmp_predicate sge>}> : (index, index) -> i1 loc("<stdin>":27:11)
    "func.return"(%12) : (i1) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_big"}> ({
  ^bb0(%arg0: index loc("<stdin>":31:8)):
    %0 = "index.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":32:10)
    %1 = "index.constant"() <{value = 12884901888 : index}> : () -> index loc("<stdin>":33:10)
    %2 = "index.constant"() <{value = 12884967423 : index}> : () -> index loc("<stdin>":34:10)
    %3 = "index.maxu"(%arg0, %1) : (index, index) -> index loc("<stdin>":35:10)
    %4 = "index.minu"(%3, %2) : (index, index) -> index loc("<stdin>":36:10)
    %5 = "index.add"(%4, %0) : (index, index) -> index loc("<stdin>":37:10)
    %6 = "index.cmp"(%4, %1) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1 loc("<stdin>":38:10)
    "func.return"(%6) : (i1) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
