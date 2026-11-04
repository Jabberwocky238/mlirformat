module {
  func.func @bitvectors() {
    %c5_bv32 = smt.bv.constant #smt.bv<5> : !smt.bv<32> {smt.some_attr}
    %c92_bv8 = smt.bv.constant #smt.bv<92> : !smt.bv<8> {smt.some_attr}
    %c-1_bv8 = smt.bv.constant #smt.bv<-1> : !smt.bv<8>
    %c-1_bv1 = smt.bv.constant #smt.bv<-1> : !smt.bv<1>
    %c-1_bv1_0 = smt.bv.constant #smt.bv<-1> : !smt.bv<1>
    %c0_bv32 = smt.bv.constant #smt.bv<0> : !smt.bv<32>
    %0 = smt.bv.neg %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %1 = smt.bv.add %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %2 = smt.bv.mul %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %3 = smt.bv.urem %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %4 = smt.bv.srem %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %5 = smt.bv.smod %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %6 = smt.bv.shl %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %7 = smt.bv.lshr %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %8 = smt.bv.ashr %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %9 = smt.bv.udiv %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %10 = smt.bv.sdiv %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %11 = smt.bv.not %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %12 = smt.bv.and %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %13 = smt.bv.or %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %14 = smt.bv.xor %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %15 = smt.bv.cmp slt %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %16 = smt.bv.cmp sle %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %17 = smt.bv.cmp sgt %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %18 = smt.bv.cmp sge %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %19 = smt.bv.cmp ult %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %20 = smt.bv.cmp ule %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %21 = smt.bv.cmp ugt %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %22 = smt.bv.cmp uge %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %23 = smt.bv.concat %c0_bv32, %c0_bv32 {smt.some_attr} : !smt.bv<32>, !smt.bv<32>
    %24 = smt.bv.extract %c0_bv32 from 8 {smt.some_attr} : (!smt.bv<32>) -> !smt.bv<16>
    %25 = smt.bv.repeat 2 times %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %26 = smt.bv2int %c0_bv32 {smt.some_attr} : !smt.bv<32>
    %27 = smt.bv2int %c0_bv32 signed {smt.some_attr} : !smt.bv<32>
    return
  }
}

