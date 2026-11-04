"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.int.constant"() <{value = 5 : ui4}> : () -> !smt.int
    %1 = "smt.int.constant"() <{value = 10 : ui8}> : () -> !smt.int
    %2 = "smt.int.add"(%0, %0, %0) : (!smt.int, !smt.int, !smt.int) -> !smt.int
    %3 = "smt.eq"(%2, %1) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%3) : (!smt.bool) -> ()
    %4 = "smt.int.mul"(%0, %0, %0) : (!smt.int, !smt.int, !smt.int) -> !smt.int
    %5 = "smt.eq"(%4, %1) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%5) : (!smt.bool) -> ()
    %6 = "smt.int.sub"(%0, %0) : (!smt.int, !smt.int) -> !smt.int
    %7 = "smt.eq"(%6, %1) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%7) : (!smt.bool) -> ()
    %8 = "smt.int.div"(%0, %0) : (!smt.int, !smt.int) -> !smt.int
    %9 = "smt.eq"(%8, %1) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%9) : (!smt.bool) -> ()
    %10 = "smt.int.mod"(%0, %0) : (!smt.int, !smt.int) -> !smt.int
    %11 = "smt.eq"(%10, %1) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%11) : (!smt.bool) -> ()
    %12 = "smt.int.cmp"(%0, %0) <{pred = 1 : i64}> : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%12) : (!smt.bool) -> ()
    %13 = "smt.int.cmp"(%0, %0) <{pred = 0 : i64}> : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%13) : (!smt.bool) -> ()
    %14 = "smt.int.cmp"(%0, %0) <{pred = 3 : i64}> : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%14) : (!smt.bool) -> ()
    %15 = "smt.int.cmp"(%0, %0) <{pred = 2 : i64}> : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%15) : (!smt.bool) -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

