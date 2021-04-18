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



### 3.Gradients

