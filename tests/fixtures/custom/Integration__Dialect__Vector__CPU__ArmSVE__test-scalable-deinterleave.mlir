module {
  func.func @entry() {
    %c256_i32 = arith.constant 256 : i32
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @test_deinterleave() : () -> ()
    return
  }
  func.func @test_deinterleave() attributes {no_inline} {
    %0 = llvm.intr.stepvector : vector<[4]xi8>
    vector.print %0 : vector<[4]xi8>
    %res1, %res2 = vector.deinterleave %0 : vector<[4]xi8> -> vector<[2]xi8>
    vector.print %res1 : vector<[2]xi8>
    vector.print %res2 : vector<[2]xi8>
    return
  }
  func.func private @setArmVLBits(i32)
}

