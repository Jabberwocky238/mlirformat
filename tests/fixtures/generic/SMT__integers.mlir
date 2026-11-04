"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "integer_operations"}> ({
    %0 = "smt.int.constant"() <{value = 3973 : ui12}> {smt.some_attr} : () -> !smt.int
    %1 = "smt.int.constant"() <{value = 184467440737095516152 : ui84}> {smt.some_attr} : () -> !smt.int
    %2 = "smt.int.add"(%0, %0, %0) {smt.some_attr} : (!smt.int, !smt.int, !smt.int) -> !smt.int
    %3 = "smt.int.mul"(%0, %0, %0) {smt.some_attr} : (!smt.int, !smt.int, !smt.int) -> !smt.int
    %4 = "smt.int.sub"(%0, %0) {smt.some_attr} : (!smt.int, !smt.int) -> !smt.int
    %5 = "smt.int.div"(%0, %0) {smt.some_attr} : (!smt.int, !smt.int) -> !smt.int
    %6 = "smt.int.mod"(%0, %0) {smt.some_attr} : (!smt.int, !smt.int) -> !smt.int
    %7 = "smt.int.abs"(%0) {smt.some_attr} : (!smt.int) -> !smt.int
    %8 = "smt.int.cmp"(%0, %0) <{pred = 1 : i64}> {smt.some_attr} : (!smt.int, !smt.int) -> !smt.bool
    %9 = "smt.int.cmp"(%0, %0) <{pred = 0 : i64}> {smt.some_attr} : (!smt.int, !smt.int) -> !smt.bool
    %10 = "smt.int.cmp"(%0, %0) <{pred = 3 : i64}> {smt.some_attr} : (!smt.int, !smt.int) -> !smt.bool
    %11 = "smt.int.cmp"(%0, %0) <{pred = 2 : i64}> {smt.some_attr} : (!smt.int, !smt.int) -> !smt.bool
    %12 = "smt.int2bv"(%0) {smt.some_attr} : (!smt.int) -> !smt.bv<4>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

