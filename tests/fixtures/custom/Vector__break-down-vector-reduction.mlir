module {
  func.func @reduce_2x_f32(%arg0: vector<2xf32>) -> (f32, f32, f32, f32, f32, f32) {
    %0 = vector.reduction <add>, %arg0 : vector<2xf32> into f32
    %1 = vector.reduction <mul>, %arg0 : vector<2xf32> into f32
    %2 = vector.reduction <minnumf>, %arg0 : vector<2xf32> into f32
    %3 = vector.reduction <maxnumf>, %arg0 : vector<2xf32> into f32
    %4 = vector.reduction <minimumf>, %arg0 : vector<2xf32> into f32
    %5 = vector.reduction <maximumf>, %arg0 : vector<2xf32> into f32
    return %0, %1, %2, %3, %4, %5 : f32, f32, f32, f32, f32, f32
  }
  func.func @reduce_2x_i32(%arg0: vector<2xi32>) -> (i32, i32, i32, i32, i32, i32, i32, i32, i32) {
    %0 = vector.reduction <add>, %arg0 : vector<2xi32> into i32
    %1 = vector.reduction <mul>, %arg0 : vector<2xi32> into i32
    %2 = vector.reduction <minsi>, %arg0 : vector<2xi32> into i32
    %3 = vector.reduction <maxsi>, %arg0 : vector<2xi32> into i32
    %4 = vector.reduction <minui>, %arg0 : vector<2xi32> into i32
    %5 = vector.reduction <maxui>, %arg0 : vector<2xi32> into i32
    %6 = vector.reduction <and>, %arg0 : vector<2xi32> into i32
    %7 = vector.reduction <or>, %arg0 : vector<2xi32> into i32
    %8 = vector.reduction <xor>, %arg0 : vector<2xi32> into i32
    return %0, %1, %2, %3, %4, %5, %6, %7, %8 : i32, i32, i32, i32, i32, i32, i32, i32, i32
  }
  func.func @reduce_1x_f32(%arg0: vector<1xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<1xf32> into f32
    return %0 : f32
  }
  func.func @reduce_1x_acc_f32(%arg0: vector<1xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<1xf32> into f32
    return %0 : f32
  }
  func.func @reduce_1x_acc_i32(%arg0: vector<1xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<1xi32> into i32
    return %0 : i32
  }
  func.func @reduce_2x_acc_f32(%arg0: vector<2xf32>, %arg1: f32) -> (f32, f32) {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<2xf32> into f32
    %1 = vector.reduction <mul>, %arg0, %arg1 fastmath<nnan> : vector<2xf32> into f32
    return %0, %1 : f32, f32
  }
  func.func @reduce_3x_f32(%arg0: vector<3xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<3xf32> into f32
    return %0 : f32
  }
  func.func @reduce_mask_3x_f32(%arg0: vector<3xf32>, %arg1: index) -> f32 {
    %0 = vector.create_mask %arg1 : vector<3xi1>
    %1 = vector.mask %0 { vector.reduction <add>, %arg0 : vector<3xf32> into f32 } : vector<3xi1> -> f32
    return %1 : f32
  }
  func.func @reduce_scalable_f32(%arg0: vector<[1]xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<[1]xf32> into f32
    return %0 : f32
  }
}

