"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "binary_ops"}> ({
  ^bb0(%arg5: index, %arg6: index):
    %22 = "index.add"(%arg5, %arg6) : (index, index) -> index
    %23 = "index.sub"(%arg5, %arg6) : (index, index) -> index
    %24 = "index.mul"(%arg5, %arg6) : (index, index) -> index
    %25 = "index.divs"(%arg5, %arg6) : (index, index) -> index
    %26 = "index.divu"(%arg5, %arg6) : (index, index) -> index
    %27 = "index.ceildivs"(%arg5, %arg6) : (index, index) -> index
    %28 = "index.ceildivu"(%arg5, %arg6) : (index, index) -> index
    %29 = "index.floordivs"(%arg5, %arg6) : (index, index) -> index
    %30 = "index.rems"(%arg5, %arg6) : (index, index) -> index
    %31 = "index.remu"(%arg5, %arg6) : (index, index) -> index
    %32 = "index.maxs"(%arg5, %arg6) : (index, index) -> index
    %33 = "index.maxu"(%arg5, %arg6) : (index, index) -> index
    %34 = "index.mins"(%arg5, %arg6) : (index, index) -> index
    %35 = "index.minu"(%arg5, %arg6) : (index, index) -> index
    %36 = "index.shl"(%arg5, %arg6) : (index, index) -> index
    %37 = "index.shrs"(%arg5, %arg6) : (index, index) -> index
    %38 = "index.shru"(%arg5, %arg6) : (index, index) -> index
    %39 = "index.and"(%arg5, %arg6) : (index, index) -> index
    %40 = "index.or"(%arg5, %arg6) : (index, index) -> index
    %41 = "index.xor"(%arg5, %arg6) : (index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "cmp_op"}> ({
  ^bb0(%arg3: index, %arg4: index):
    %12 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate eq>}> : (index, index) -> i1
    %13 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ne>}> : (index, index) -> i1
    %14 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate slt>}> : (index, index) -> i1
    %15 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate sle>}> : (index, index) -> i1
    %16 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1
    %17 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate sge>}> : (index, index) -> i1
    %18 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ult>}> : (index, index) -> i1
    %19 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ule>}> : (index, index) -> i1
    %20 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ugt>}> : (index, index) -> i1
    %21 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sizeof_op"}> ({
    %11 = "index.sizeof"() : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "constant_op"}> ({
    %8 = "index.constant"() <{value = 0 : index}> : () -> index
    %9 = "index.constant"() <{value = 1 : index}> : () -> index
    %10 = "index.constant"() <{value = 42 : index}> : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bool_constant_op"}> ({
    %6 = "index.bool.constant"() <{value = true}> : () -> i1
    %7 = "index.bool.constant"() <{value = false}> : () -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i32, i64) -> (), sym_name = "cast_op"}> ({
  ^bb0(%arg0: index, %arg1: i32, %arg2: i64):
    %0 = "index.casts"(%arg0) : (index) -> i64
    %1 = "index.casts"(%arg1) : (i32) -> index
    %2 = "index.casts"(%arg2) : (i64) -> index
    %3 = "index.castu"(%arg0) : (index) -> i64
    %4 = "index.castu"(%arg1) : (i32) -> index
    %5 = "index.castu"(%arg2) : (i64) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

