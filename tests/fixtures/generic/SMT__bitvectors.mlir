"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "bitvectors"}> ({
    %0 = "smt.bv.constant"() <{value = #smt.bv<5> : !smt.bv<32>}> {smt.some_attr} : () -> !smt.bv<32>
    %1 = "smt.bv.constant"() <{value = #smt.bv<92> : !smt.bv<8>}> {smt.some_attr} : () -> !smt.bv<8>
    %2 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<8>}> : () -> !smt.bv<8>
    %3 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<1>}> : () -> !smt.bv<1>
    %4 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<1>}> : () -> !smt.bv<1>
    %5 = "smt.bv.constant"() <{value = #smt.bv<0> : !smt.bv<32>}> : () -> !smt.bv<32>
    %6 = "smt.bv.neg"(%5) {smt.some_attr} : (!smt.bv<32>) -> !smt.bv<32>
    %7 = "smt.bv.add"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %8 = "smt.bv.mul"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %9 = "smt.bv.urem"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %10 = "smt.bv.srem"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %11 = "smt.bv.smod"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %12 = "smt.bv.shl"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %13 = "smt.bv.lshr"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %14 = "smt.bv.ashr"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %15 = "smt.bv.udiv"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %16 = "smt.bv.sdiv"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %17 = "smt.bv.not"(%5) {smt.some_attr} : (!smt.bv<32>) -> !smt.bv<32>
    %18 = "smt.bv.and"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %19 = "smt.bv.or"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %20 = "smt.bv.xor"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %21 = "smt.bv.cmp"(%5, %5) <{pred = 0 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %22 = "smt.bv.cmp"(%5, %5) <{pred = 1 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %23 = "smt.bv.cmp"(%5, %5) <{pred = 2 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %24 = "smt.bv.cmp"(%5, %5) <{pred = 3 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %25 = "smt.bv.cmp"(%5, %5) <{pred = 4 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %26 = "smt.bv.cmp"(%5, %5) <{pred = 5 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %27 = "smt.bv.cmp"(%5, %5) <{pred = 6 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %28 = "smt.bv.cmp"(%5, %5) <{pred = 7 : i64}> {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %29 = "smt.bv.concat"(%5, %5) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bv<64>
    %30 = "smt.bv.extract"(%5) <{lowBit = 8 : i32}> {smt.some_attr} : (!smt.bv<32>) -> !smt.bv<16>
    %31 = "smt.bv.repeat"(%5) {smt.some_attr} : (!smt.bv<32>) -> !smt.bv<64>
    %32 = "smt.bv2int"(%5) {smt.some_attr} : (!smt.bv<32>) -> !smt.int
    %33 = "smt.bv2int"(%5) <{is_signed}> {smt.some_attr} : (!smt.bv<32>) -> !smt.int
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

