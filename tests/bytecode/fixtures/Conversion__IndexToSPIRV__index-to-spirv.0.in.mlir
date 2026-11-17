"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "trivial_ops"}> ({
  ^bb0(%arg13: index loc("<stdin>":3:8), %arg14: index loc("<stdin>":3:23)):
    %28 = "index.add"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":4:11)
    %29 = "index.sub"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":5:11)
    %30 = "index.mul"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":6:11)
    %31 = "index.divs"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":7:11)
    %32 = "index.divu"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":8:11)
    %33 = "index.rems"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":9:11)
    %34 = "index.remu"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":10:11)
    %35 = "index.maxs"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":11:11)
    %36 = "index.maxu"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":12:11)
    %37 = "index.mins"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":13:11)
    %38 = "index.minu"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":14:11)
    %39 = "index.shl"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":15:11)
    %40 = "index.shrs"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":16:11)
    %41 = "index.shru"(%arg13, %arg14) : (index, index) -> index loc("<stdin>":17:11)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "bitwise_ops"}> ({
  ^bb0(%arg11: index loc("<stdin>":21:8), %arg12: index loc("<stdin>":21:23)):
    %25 = "index.and"(%arg11, %arg12) : (index, index) -> index loc("<stdin>":22:11)
    %26 = "index.or"(%arg11, %arg12) : (index, index) -> index loc("<stdin>":23:11)
    %27 = "index.xor"(%arg11, %arg12) : (index, index) -> index loc("<stdin>":24:11)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> (), sym_name = "constant_ops"}> ({
    %22 = "index.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":28:11)
    %23 = "index.bool.constant"() <{value = true}> : () -> i1 loc("<stdin>":29:11)
    %24 = "index.bool.constant"() <{value = false}> : () -> i1 loc("<stdin>":30:11)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivs"}> ({
  ^bb0(%arg9: index loc("<stdin>":34:8), %arg10: index loc("<stdin>":34:22)):
    %21 = "index.ceildivs"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":35:11)
    "func.return"(%21) : (index) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivu"}> ({
  ^bb0(%arg7: index loc("<stdin>":39:8), %arg8: index loc("<stdin>":39:22)):
    %20 = "index.ceildivu"(%arg7, %arg8) : (index, index) -> index loc("<stdin>":40:11)
    "func.return"(%20) : (index) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "floordivs"}> ({
  ^bb0(%arg5: index loc("<stdin>":44:8), %arg6: index loc("<stdin>":44:22)):
    %19 = "index.floordivs"(%arg5, %arg6) : (index, index) -> index loc("<stdin>":45:11)
    "func.return"(%19) : (index) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "index_cmp"}> ({
  ^bb0(%arg3: index loc("<stdin>":49:8), %arg4: index loc("<stdin>":49:22)):
    %9 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate eq>}> : (index, index) -> i1 loc("<stdin>":50:10)
    %10 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ne>}> : (index, index) -> i1 loc("<stdin>":51:11)
    %11 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate slt>}> : (index, index) -> i1 loc("<stdin>":52:11)
    %12 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate sle>}> : (index, index) -> i1 loc("<stdin>":53:11)
    %13 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1 loc("<stdin>":54:11)
    %14 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate sge>}> : (index, index) -> i1 loc("<stdin>":55:11)
    %15 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ult>}> : (index, index) -> i1 loc("<stdin>":56:11)
    %16 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ule>}> : (index, index) -> i1 loc("<stdin>":57:11)
    %17 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate ugt>}> : (index, index) -> i1 loc("<stdin>":58:11)
    %18 = "index.cmp"(%arg3, %arg4) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1 loc("<stdin>":59:11)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = () -> (), sym_name = "index_sizeof"}> ({
    %8 = "index.sizeof"() : () -> index loc("<stdin>":63:10)
    "func.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (index) -> (i64, i32, i64, i32), sym_name = "index_cast_from"}> ({
  ^bb0(%arg2: index loc("<stdin>":67:8)):
    %4 = "index.casts"(%arg2) : (index) -> i64 loc("<stdin>":68:10)
    %5 = "index.casts"(%arg2) : (index) -> i32 loc("<stdin>":69:10)
    %6 = "index.castu"(%arg2) : (index) -> i64 loc("<stdin>":70:10)
    %7 = "index.castu"(%arg2) : (index) -> i32 loc("<stdin>":71:10)
    "func.return"(%4, %5, %6, %7) : (i64, i32, i64, i32) -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":66:3)
  "func.func"() <{function_type = (i32, i64) -> (index, index, index, index), sym_name = "index_cast_to"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":75:8), %arg1: i64 loc("<stdin>":75:20)):
    %0 = "index.casts"(%arg0) : (i32) -> index loc("<stdin>":76:10)
    %1 = "index.casts"(%arg1) : (i64) -> index loc("<stdin>":77:10)
    %2 = "index.castu"(%arg0) : (i32) -> index loc("<stdin>":78:10)
    %3 = "index.castu"(%arg1) : (i64) -> index loc("<stdin>":79:10)
    "func.return"(%0, %1, %2, %3) : (index, index, index, index) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":74:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
