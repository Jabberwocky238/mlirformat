"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.bv.constant"() <{value = #smt.bv<0> : !smt.bv<32>}> : () -> !smt.bv<32>
    %1 = "smt.bv.neg"(%0) : (!smt.bv<32>) -> !smt.bv<32>
    %2 = "smt.eq"(%1, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%2) : (!smt.bool) -> ()
    %3 = "smt.bv.add"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %4 = "smt.eq"(%3, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%4) : (!smt.bool) -> ()
    %5 = "smt.bv.mul"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %6 = "smt.eq"(%5, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%6) : (!smt.bool) -> ()
    %7 = "smt.bv.urem"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %8 = "smt.eq"(%7, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%8) : (!smt.bool) -> ()
    %9 = "smt.bv.srem"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %10 = "smt.eq"(%9, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%10) : (!smt.bool) -> ()
    %11 = "smt.bv.smod"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %12 = "smt.eq"(%11, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%12) : (!smt.bool) -> ()
    %13 = "smt.bv.shl"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %14 = "smt.eq"(%13, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%14) : (!smt.bool) -> ()
    %15 = "smt.bv.lshr"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %16 = "smt.eq"(%15, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%16) : (!smt.bool) -> ()
    %17 = "smt.bv.ashr"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %18 = "smt.eq"(%17, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%18) : (!smt.bool) -> ()
    %19 = "smt.bv.udiv"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %20 = "smt.eq"(%19, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%20) : (!smt.bool) -> ()
    %21 = "smt.bv.sdiv"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %22 = "smt.eq"(%21, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%22) : (!smt.bool) -> ()
    %23 = "smt.bv.not"(%0) : (!smt.bv<32>) -> !smt.bv<32>
    %24 = "smt.eq"(%23, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%24) : (!smt.bool) -> ()
    %25 = "smt.bv.and"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %26 = "smt.eq"(%25, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%26) : (!smt.bool) -> ()
    %27 = "smt.bv.or"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %28 = "smt.eq"(%27, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%28) : (!smt.bool) -> ()
    %29 = "smt.bv.xor"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %30 = "smt.eq"(%29, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%30) : (!smt.bool) -> ()
    %31 = "smt.bv.cmp"(%0, %0) <{pred = 0 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%31) : (!smt.bool) -> ()
    %32 = "smt.bv.cmp"(%0, %0) <{pred = 1 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%32) : (!smt.bool) -> ()
    %33 = "smt.bv.cmp"(%0, %0) <{pred = 2 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%33) : (!smt.bool) -> ()
    %34 = "smt.bv.cmp"(%0, %0) <{pred = 3 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%34) : (!smt.bool) -> ()
    %35 = "smt.bv.cmp"(%0, %0) <{pred = 4 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%35) : (!smt.bool) -> ()
    %36 = "smt.bv.cmp"(%0, %0) <{pred = 5 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%36) : (!smt.bool) -> ()
    %37 = "smt.bv.cmp"(%0, %0) <{pred = 6 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%37) : (!smt.bool) -> ()
    %38 = "smt.bv.cmp"(%0, %0) <{pred = 7 : i64}> : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%38) : (!smt.bool) -> ()
    %39 = "smt.bv.concat"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<64>
    %40 = "smt.bv.extract"(%39) <{lowBit = 8 : i32}> : (!smt.bv<64>) -> !smt.bv<16>
    %41 = "smt.bv.repeat"(%40) : (!smt.bv<16>) -> !smt.bv<32>
    %42 = "smt.eq"(%41, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%42) : (!smt.bool) -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

