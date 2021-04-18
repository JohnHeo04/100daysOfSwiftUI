## Day20_Project2_Part1
   
   
### 1.Using stacks to arrange views   
**VStack** : 수직 정렬   
**HStack** : 수평 정렬   
**ZStack** : Depth 정렬, 객체가 Overlap 되어 보임   
**VStack(spacing:20)** : 수직으로 정렬하되 20을 띄움   
**Spacer()** : 남아있는 공간으로 끝까지 밀어버림   
```swift
VStack(spacing: 20) {
      Text("First")
      Text("Second")
      Spacer()
```
***   
   
### 2.Colors and frames   
**.background(Color.red)** : 텍스트에 빨간 배경 삽입   
**Color.red.frame(width: 200, height: 200)** : 숫자의 크기만큼 색 채우기   
   
**edgesIgnoringSafeArea(.all)** : Apple은 기본적으로 상단 바와 하단 바를 '안전 지역'으로 설정을 해놓음.   
하지만, edgesIgnoringSafeArea(.all)을 통해 해제할 수 있음
```swift
ZStack {
      Color.red
//    Color.red.frame(width: ~ .. )
//    Color(red: 1, green: 0.8, blue: 0)
      Text("Your content")
  }
```

***

### 3.Gradients
선형 그라데이션
```swift
LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
```
원형 그라데이션
```swift
RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
```
Angular 그라데이션
```swift
AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.red]), center: .center)
```
👇 <선형, 원형, Angular>
|Feature|Description|
:-------------------------:|:-------------------------:
|Linear Gradient|<img src="https://user-images.githubusercontent.com/47841046/115150616-2291e700-a0a4-11eb-92f0-e097910d10ba.png"></img><br/>|
|Radial Gradient|<img src="https://user-images.githubusercontent.com/47841046/115150773-d4311800-a0a4-11eb-828d-34f64859db93.png"></img><br/>|
|Angular Gradient|<img src="https://user-images.githubusercontent.com/47841046/115151128-7e5d6f80-a0a6-11eb-9b9d-946988b73809.png"></img><br/>|

***
### 4.Buttons and images
```swift
Button(action: {
            print("Button was tapped")}) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil")
                    Text("Edit")
```
<img src = "https://user-images.githubusercontent.com/47841046/115152211-25440a80-a0ab-11eb-8780-451d7e91edbb.png" width="30%" height="30%"></img>



