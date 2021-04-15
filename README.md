# WeSplit

*지금 진행중인 프로젝트는 https://www.hackingwithswift.com/100/swiftui   
위의 사이트를 참고해 진행하고 있는 16일~18일 동안 진행된 첫 번째 iOS 앱 프로젝트다.

***

WeSplit   

check-sharing 앱   

간단 설명 : 음식점을 이용하고 난 뒤, '총 가격', '현재 있는 사람들의 수' 그리고 '팁 퍼센트'를 이용해 '팁'을 계산하는 앱   

***


### 배운점

##### Day 16
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
```swift
Form {
    Section {
         TextField("Amount", text: $checkAmount)
             .keyboardType(.decimalPad)
    }
```

