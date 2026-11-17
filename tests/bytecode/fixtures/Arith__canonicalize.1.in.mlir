"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1), sym_name = "cmpi_const_right"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":5:10)
    %1 = "arith.cmpi"(%0, %arg0) <{predicate = 0 : i64}> : (i64, i64) -> i1 loc("<stdin>":6:10)
    %2 = "arith.cmpi"(%0, %arg0) <{predicate = 3 : i64}> : (i64, i64) -> i1 loc("<stdin>":7:10)
    %3 = "arith.cmpi"(%0, %arg0) <{predicate = 5 : i64}> : (i64, i64) -> i1 loc("<stdin>":8:10)
    %4 = "arith.cmpi"(%0, %arg0) <{predicate = 7 : i64}> : (i64, i64) -> i1 loc("<stdin>":9:10)
    %5 = "arith.cmpi"(%0, %arg0) <{predicate = 9 : i64}> : (i64, i64) -> i1 loc("<stdin>":10:10)
    %6 = "arith.cmpi"(%0, %arg0) <{predicate = 1 : i64}> : (i64, i64) -> i1 loc("<stdin>":11:10)
    %7 = "arith.cmpi"(%0, %arg0) <{predicate = 2 : i64}> : (i64, i64) -> i1 loc("<stdin>":12:10)
    %8 = "arith.cmpi"(%0, %arg0) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":13:10)
    %9 = "arith.cmpi"(%0, %arg0) <{predicate = 6 : i64}> : (i64, i64) -> i1 loc("<stdin>":14:10)
    %10 = "arith.cmpi"(%0, %arg0) <{predicate = 8 : i64}> : (i64, i64) -> i1 loc("<stdin>":15:11)
    "func.return"(%1, %2, %3, %4, %5, %6, %7, %8, %9, %10) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
