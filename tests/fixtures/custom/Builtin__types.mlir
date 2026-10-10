module {
  func.func private @f1() -> memref<?x?xf32, strided<[?, ?], offset: ?>>
  func.func private @f2() -> memref<?x?xf32, strided<[42, 1], offset: 10>>
  func.func private @f3() -> memref<?x?xf32, strided<[?, 1], offset: 10>>
  func.func private @f4() -> memref<?x?xf32, strided<[?, 1], offset: ?>>
  func.func private @f5() -> memref<?x?xf32, strided<[42, 1]>>
  func.func private @f6() -> memref<?x?xf32, strided<[42, 1]>>
  func.func private @f7() -> memref<f32, strided<[]>>
  func.func private @f8() -> memref<f32, strided<[], offset: ?>>
  func.func private @f9() -> memref<?xf32, strided<[-1], offset: ?>>
  func.func private @f10() -> memref<f32, strided<[], offset: -1>>
}

