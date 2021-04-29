## Day27
***

### Overview
Project4 date picker(datePicker)와 두 가지의 steppers(Stepper)를 결합해 사용자가 언제 일어나길 원하는지 계산해주는 앱이다.   
사용자가 얼마나 잠을 자야하는지, 커피를 얼마나 마셔야하는지 알려준다.   
<img src = "https://user-images.githubusercontent.com/47841046/116516456-989a1780-a908-11eb-93c4-6a765a337ff2.png" > </img><br/>
   
***
#### .navigationBarTitle, Items
오른쪽 상단 위에 trailing을 통해 'Calculate'라는 텍스트를 놓을 수 있다.    
만약 여러 버튼을 놓고 싶다면 HStack을 사용하기   
아래의 action action: calculateBedtimes 함수는 다음에 나오게 됨   
<img src = "https://user-images.githubusercontent.com/47841046/116513404-7d2d0d80-a904-11eb-83ca-17b3310fb2e8.png" ></img><br/>

```swift
var body: some View {
  NavigationView {
    VStack {
    ...
      }
   }
}
.navigationBarTitle("BetterRest")
.navigationBarItems(trailing: Button( action: caculateBedtimes) { Text("Calculate") }
```


***
#### DatePicker
시간을 설정할 수 있는 메소드   
<img src = "https://user-images.githubusercontent.com/47841046/116514274-c5006480-a905-11eb-8eb5-81dc13867ec4.png"> </img><br/>
<img src ="https://user-images.githubusercontent.com/47841046/116515175-e7df4880-a906-11eb-9727-2cbdefa6f374.png"> </img><br/>


```swift
struct ContentView: View {
  @State privagte var wakeUp = Date()
  ...
  
  var body: some View {
    NavigationView {
      VStack {
        Text("When do you want to wake up?")
          .font(.headline)
        DatePicker("Please enter a time", selection: $wakeUp, displayeddComponents: .hourAndMinute) .labelsHidden()
  ...
```

***
#### Stepper
Stepper를 이용해 원하는 정수를 정확히 표기할 수 있다.   
<img src="https://user-images.githubusercontent.com/47841046/116516003-009c2e00-a908-11eb-8a0e-17c6617f2e62.png"> </img><br/>

```swift
struct ContentView: View {
  ...
  @State privagte var sleepAmount = 8.0
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Desired amount of sleep")
          .font(.headline)
          
          Stepper(value: $sleepAmount, in 4...12, step: 0.25) {
            Text ("\(sleepAmount, specifier: "%g") hours") }
```
<img src ="https://user-images.githubusercontent.com/47841046/116515895-dd717e80-a907-11eb-8758-733ea94f0a74.png"> </img><br/>
```swift
struct ContentView: View {
  ...
  @State privagte var coffeeAmount = 1
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Daily coffee intake")
          .font(.headline)
          
        Stepper(value: $coffeeAmount, in 1...20) {
          if coffeeAmount == 1 {
          Text("1 cup")
        } else {
            Text("\(coffeeAmount) cups")
            }
```





