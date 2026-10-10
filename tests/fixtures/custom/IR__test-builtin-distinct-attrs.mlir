#distinct = distinct[0]<42 : i32>
#distinct1 = distinct[1]<42 : i32>
#distinct2 = distinct[2]<43 : i32>
#distinct3 = distinct[3]<@foo_1>
module {
  func.func @foo_1() {
    "test.op"() {distinct.input = #distinct} : () -> ()
    "test.op"() {distinct.input = #distinct1} : () -> ()
    "test.op"() {distinct.input = #distinct2} : () -> ()
    "test.op"() {distinct.input = #distinct3} : () -> ()
  }
  func.func @foo_2() {
    "test.op"() {distinct.input = #distinct} : () -> ()
    "test.op"() {distinct.input = #distinct1} : () -> ()
    "test.op"() {distinct.input = #distinct2} : () -> ()
    "test.op"() {distinct.input = #distinct3} : () -> ()
  }
  func.func @foo_3() {
    "test.op"() {distinct.input = #distinct} : () -> ()
    "test.op"() {distinct.input = #distinct1} : () -> ()
    "test.op"() {distinct.input = #distinct2} : () -> ()
    "test.op"() {distinct.input = #distinct3} : () -> ()
  }
  func.func @foo_4() {
    "test.op"() {distinct.input = #distinct} : () -> ()
    "test.op"() {distinct.input = #distinct1} : () -> ()
    "test.op"() {distinct.input = #distinct2} : () -> ()
    "test.op"() {distinct.input = #distinct3} : () -> ()
  }
}

