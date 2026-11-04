module {
  smt.solver() : () -> () {
    %c0_bv32 = smt.bv.constant #smt.bv<0> : !smt.bv<32>
    %0 = smt.bv.neg %c0_bv32 : !smt.bv<32>
    %1 = smt.eq %0, %c0_bv32 : !smt.bv<32>
    smt.assert %1
    %2 = smt.bv.add %c0_bv32, %c0_bv32 : !smt.bv<32>
    %3 = smt.eq %2, %c0_bv32 : !smt.bv<32>
    smt.assert %3
    %4 = smt.bv.mul %c0_bv32, %c0_bv32 : !smt.bv<32>
    %5 = smt.eq %4, %c0_bv32 : !smt.bv<32>
    smt.assert %5
    %6 = smt.bv.urem %c0_bv32, %c0_bv32 : !smt.bv<32>
    %7 = smt.eq %6, %c0_bv32 : !smt.bv<32>
    smt.assert %7
    %8 = smt.bv.srem %c0_bv32, %c0_bv32 : !smt.bv<32>
    %9 = smt.eq %8, %c0_bv32 : !smt.bv<32>
    smt.assert %9
    %10 = smt.bv.smod %c0_bv32, %c0_bv32 : !smt.bv<32>
    %11 = smt.eq %10, %c0_bv32 : !smt.bv<32>
    smt.assert %11
    %12 = smt.bv.shl %c0_bv32, %c0_bv32 : !smt.bv<32>
    %13 = smt.eq %12, %c0_bv32 : !smt.bv<32>
    smt.assert %13
    %14 = smt.bv.lshr %c0_bv32, %c0_bv32 : !smt.bv<32>
    %15 = smt.eq %14, %c0_bv32 : !smt.bv<32>
    smt.assert %15
    %16 = smt.bv.ashr %c0_bv32, %c0_bv32 : !smt.bv<32>
    %17 = smt.eq %16, %c0_bv32 : !smt.bv<32>
    smt.assert %17
    %18 = smt.bv.udiv %c0_bv32, %c0_bv32 : !smt.bv<32>
    %19 = smt.eq %18, %c0_bv32 : !smt.bv<32>
    smt.assert %19
    %20 = smt.bv.sdiv %c0_bv32, %c0_bv32 : !smt.bv<32>
    %21 = smt.eq %20, %c0_bv32 : !smt.bv<32>
    smt.assert %21
    %22 = smt.bv.not %c0_bv32 : !smt.bv<32>
    %23 = smt.eq %22, %c0_bv32 : !smt.bv<32>
    smt.assert %23
    %24 = smt.bv.and %c0_bv32, %c0_bv32 : !smt.bv<32>
    %25 = smt.eq %24, %c0_bv32 : !smt.bv<32>
    smt.assert %25
    %26 = smt.bv.or %c0_bv32, %c0_bv32 : !smt.bv<32>
    %27 = smt.eq %26, %c0_bv32 : !smt.bv<32>
    smt.assert %27
    %28 = smt.bv.xor %c0_bv32, %c0_bv32 : !smt.bv<32>
    %29 = smt.eq %28, %c0_bv32 : !smt.bv<32>
    smt.assert %29
    %30 = smt.bv.cmp slt %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %30
    %31 = smt.bv.cmp sle %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %31
    %32 = smt.bv.cmp sgt %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %32
    %33 = smt.bv.cmp sge %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %33
    %34 = smt.bv.cmp ult %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %34
    %35 = smt.bv.cmp ule %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %35
    %36 = smt.bv.cmp ugt %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %36
    %37 = smt.bv.cmp uge %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %37
    %38 = smt.bv.concat %c0_bv32, %c0_bv32 : !smt.bv<32>, !smt.bv<32>
    %39 = smt.bv.extract %38 from 8 : (!smt.bv<64>) -> !smt.bv<16>
    %40 = smt.bv.repeat 2 times %39 : !smt.bv<16>
    %41 = smt.eq %40, %c0_bv32 : !smt.bv<32>
    smt.assert %41
  }
}

