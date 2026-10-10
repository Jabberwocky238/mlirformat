"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_same_for_both"}> ({
  ^bb0(%arg3: index):
    %18 = "index.constant"() <{value = 1 : index}> : () -> index
    %19 = "index.constant"() <{value = 4294967294 : index}> : () -> index
    %20 = "index.minu"(%arg3, %19) : (index, index) -> index
    %21 = "index.add"(%20, %18) : (index, index) -> index
    %22 = "index.cmp"(%21, %18) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1
    "func.return"(%22) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_unsigned_ov"}> ({
  ^bb0(%arg2: index):
    %13 = "index.constant"() <{value = 1 : index}> : () -> index
    %14 = "index.constant"() <{value = 4294967295 : index}> : () -> index
    %15 = "index.minu"(%arg2, %14) : (index, index) -> index
    %16 = "index.add"(%15, %13) : (index, index) -> index
    %17 = "index.cmp"(%16, %13) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1
    "func.return"(%17) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_signed_ov"}> ({
  ^bb0(%arg1: index):
    %7 = "index.constant"() <{value = 0 : index}> : () -> index
    %8 = "index.constant"() <{value = 1 : index}> : () -> index
    %9 = "index.constant"() <{value = 2147483647 : index}> : () -> index
    %10 = "index.minu"(%arg1, %9) : (index, index) -> index
    %11 = "index.add"(%10, %8) : (index, index) -> index
    %12 = "index.cmp"(%11, %7) <{pred = #index<cmp_predicate sge>}> : (index, index) -> i1
    "func.return"(%12) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "add_big"}> ({
  ^bb0(%arg0: index):
    %0 = "index.constant"() <{value = 1 : index}> : () -> index
    %1 = "index.constant"() <{value = 12884901888 : index}> : () -> index
    %2 = "index.constant"() <{value = 12884967423 : index}> : () -> index
    %3 = "index.maxu"(%arg0, %1) : (index, index) -> index
    %4 = "index.minu"(%3, %2) : (index, index) -> index
    %5 = "index.add"(%4, %0) : (index, index) -> index
    %6 = "index.cmp"(%4, %1) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1
    "func.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

