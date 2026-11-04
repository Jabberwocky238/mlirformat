module {
  func.func @basic(%arg0: index, %arg1: index) {
    %0 = index.add %arg0, %arg1
    %1 = index.sub %arg0, %arg1
    %2 = index.mul %arg0, %arg1
    %3 = index.divs %arg0, %arg1
    %4 = index.divu %arg0, %arg1
    %5 = index.rems %arg0, %arg1
    %6 = index.remu %arg0, %arg1
    %7 = index.maxs %arg0, %arg1
    %8 = index.maxu %arg0, %arg1
    %9 = index.mins %arg0, %arg1
    %10 = index.minu %arg0, %arg1
    %11 = index.shl %arg0, %arg1
    %12 = index.shrs %arg0, %arg1
    %13 = index.shru %arg0, %arg1
    %14 = index.and %arg0, %arg1
    %15 = index.or %arg0, %arg1
    %16 = index.xor %arg0, %arg1
    return
  }
  func.func @cmp(%arg0: index, %arg1: index) {
    %0 = index.cmp eq(%arg0, %arg1)
    return
  }
  func.func @ceildivs(%arg0: index, %arg1: index) -> index {
    %0 = index.ceildivs %arg0, %arg1
    return %0 : index
  }
  func.func @ceildivu(%arg0: index, %arg1: index) -> index {
    %0 = index.ceildivu %arg0, %arg1
    return %0 : index
  }
}

