"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "trivial_ops"}> ({
  ^bb0(%arg9: index loc("<stdin>":3:8), %arg10: index loc("<stdin>":3:22)):
    %16 = "index.add"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":4:11)
    %17 = "index.sub"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":5:11)
    %18 = "index.mul"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":6:11)
    %19 = "index.divs"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":7:11)
    %20 = "index.divu"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":8:11)
    %21 = "index.rems"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":9:11)
    %22 = "index.remu"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":10:11)
    %23 = "index.maxs"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":11:11)
    %24 = "index.maxu"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":12:11)
    %25 = "index.mins"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":13:11)
    %26 = "index.minu"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":14:11)
    %27 = "index.shl"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":15:11)
    %28 = "index.shrs"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":16:11)
    %29 = "index.shru"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":17:11)
    %30 = "index.add"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":18:11)
    %31 = "index.or"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":19:11)
    %32 = "index.xor"(%arg9, %arg10) : (index, index) -> index loc("<stdin>":20:11)
    %33 = "index.bool.constant"() <{value = true}> : () -> i1 loc("<stdin>":21:11)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivs"}> ({
  ^bb0(%arg7: index loc("<stdin>":25:8), %arg8: index loc("<stdin>":25:22)):
    %15 = "index.ceildivs"(%arg7, %arg8) : (index, index) -> index loc("<stdin>":26:11)
    "func.return"(%15) : (index) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivu"}> ({
  ^bb0(%arg5: index loc("<stdin>":30:8), %arg6: index loc("<stdin>":30:22)):
    %14 = "index.ceildivu"(%arg5, %arg6) : (index, index) -> index loc("<stdin>":31:11)
    "func.return"(%14) : (index) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (index, index) -> index, sym_name = "floordivs"}> ({
  ^bb0(%arg3: index loc("<stdin>":35:8), %arg4: index loc("<stdin>":35:22)):
    %13 = "index.floordivs"(%arg3, %arg4) : (index, index) -> index loc("<stdin>":36:11)
    "func.return"(%13) : (index) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (index) -> (i64, i32, i64, i32), sym_name = "index_cast_from"}> ({
  ^bb0(%arg2: index loc("<stdin>":40:8)):
    %9 = "index.casts"(%arg2) : (index) -> i64 loc("<stdin>":41:10)
    %10 = "index.casts"(%arg2) : (index) -> i32 loc("<stdin>":42:11)
    %11 = "index.castu"(%arg2) : (index) -> i64 loc("<stdin>":43:11)
    %12 = "index.castu"(%arg2) : (index) -> i32 loc("<stdin>":44:11)
    "func.return"(%9, %10, %11, %12) : (i64, i32, i64, i32) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = (i32, i64) -> (index, index, index, index), sym_name = "index_cast_to"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":48:8), %arg1: i64 loc("<stdin>":48:20)):
    %5 = "index.casts"(%arg0) : (i32) -> index loc("<stdin>":49:10)
    %6 = "index.casts"(%arg1) : (i64) -> index loc("<stdin>":50:10)
    %7 = "index.castu"(%arg0) : (i32) -> index loc("<stdin>":51:10)
    %8 = "index.castu"(%arg1) : (i64) -> index loc("<stdin>":52:10)
    "func.return"(%5, %6, %7, %8) : (index, index, index, index) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = () -> (), sym_name = "index_sizeof"}> ({
    %4 = "index.sizeof"() : () -> index loc("<stdin>":56:10)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = () -> (), sym_name = "index_constant"}> ({
    %0 = "index.constant"() <{value = -2100000000 : index}> : () -> index loc("<stdin>":60:10)
    %1 = "index.constant"() <{value = 2100000000 : index}> : () -> index loc("<stdin>":61:10)
    %2 = "index.constant"() <{value = -3000000000 : index}> : () -> index loc("<stdin>":62:10)
    %3 = "index.constant"() <{value = 3000000000 : index}> : () -> index loc("<stdin>":63:10)
    "func.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":59:3)
}) : () -> () loc("<stdin>":1:1)
