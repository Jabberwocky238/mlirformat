module {
  func.func private @test_default_index(index) -> index
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} {
  func.func private @test_32bit_index(index) -> index
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<index = 64 : i64>} {
  func.func private @test_64bit_index(index) -> index
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<index = 16 : i64>} {
  func.func private @test_16bit_index(index) -> index
}

