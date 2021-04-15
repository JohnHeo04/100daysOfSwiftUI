# WeSplit

*지금 진행중인 프로젝트는 https://www.hackingwithswift.com/100/swiftui   
위의 사이트를 참고해 진행하고 있는 16~18일차 진행된 첫 번째 iOS 앱 프로젝트다.

***

WeSplit   

check-sharing 앱   

간단 설명 : 음식점을 이용하고 난 뒤, '총 가격', '현재 있는 사람들의 수' 그리고 '팁 퍼센트'를 이용해 '팁'을 계산하는 앱   

***


### 정리 노트


##### Day 16, 17, 18
- struct와 class의 차이 :    
 지금 단계에서는 struct가 class보다 안전하기 때문에 struct를 쓴다고 배움.   
심화 내용은 뒤에 계속해서 배울 예정

- @State 설명   
struct는 안전한 동시에 제한적이기 때문에 변수를 지정할 때 앞에 @State를 작성해 제한을 풀리게 함.
```swift
@State private var tapCount = 0
```

- $ :   
위 표시는 앞의 속성이 바뀌면 위의 속성 값을 다시 읽는다.

```swift
@State private var name = ""
...
   TextField("Enter your name is", text: $name)
```

- ForEach는 Picker View와 함께 쓸때 유용   
```swift
var body: some View {
   Picker("Select your student", selection: $selectedStudent) {
      ForEach(0 ..< students.count) {
         Text(self.students[$0])
```
- 숫자패드 :      
기본 qwerty방식을 숫자패드로 바꾸는 법 두 가지   
.decimalPad   
.numberPad    
<img src="https://user-images.githubusercontent.com/47841046/114918831-82994b00-9e62-11eb-8708-a8eeed1989e7.png" width = "20%" height = "20%"></img><br/>
```swift
Form {
    Section {
         TextField("Amount", text: $checkAmount)
             .keyboardType(.decimalPad)
    }
```

- NavigationView :   
많은 프로그램들이 실행되고 있을 때 사용자가 어느 화면에 있는지 보여 줌.
```swift
NavigationView {
   Form {
      Section {
         ...
         }
      }
   }
```

- NavigationView Title :   
```Swift
.navigationBarTitle("WeSplit")
```

- 숫자 선택 박스 생성 :   
tipPercentage가 박스 형태로 생성되어 선택할 수 있다.
적은 갯수에서 이 방법을 쓰길 추천함.
<img src="https://user-images.githubusercontent.com/47841046/114917755-43b6c580-9e61-11eb-9065-04ea651298b7.png" width="40%" height="40%"></img><br/>
```swift
Section(... ) {   
   Picker("Tip ...", selection: $tipPercentage) {
      ForEach(0 ..< tipPercentages.count) {
         Text(\(self.tipPercentages[$0])%")
      }
   }
   .pickerStyle(SegmentedPickerStyle())
```

- 강제 형변환   
String을 Double로 형변환 하는 법   
```swift
@State private var numberOfPeople = 2
...
let peopleCount = Double(numberOfPeople + 2)
```

- Optional, nil coalescing operator, ??   
아래의 checkAmount는 어떤 데이터 타입이 들어갈지 모름. 혹시 실패할 가능성 있음.   
그러므로 이 때는 optional을 이용해 안전하게 Double로 변환을 할 수 있게 한다.   
형변환이 실패하더라도 0으로 반환된다.
```swift
@State private var checkAmount = ""
...
let orderAmount = Double(checkAmount) ?? 0
```

- 소수점 자리 변경   
C언어의 특징을 반영해서 swift에 적용함.
안에 있는 숫자를 변경하면 소수점 자리가 바뀜
%.nf = n의 자리 까지 표기
```swift
Text("$\(totalPerPerson, specifier: "%.2f")")
```
<img src = "https://user-images.githubusercontent.com/47841046/114920452-69919980-9e64-11eb-9f67-c084f2793b39.png" width = "25%" heigth = "25%"></img><br/>
<img src = "https://user-images.githubusercontent.com/47841046/114920620-9645b100-9e64-11eb-991b-8432ba900980.png" width = "25%" height = "25%"></img><br/>


