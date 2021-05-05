# Day 29
#### Project 5, Part 1

## Introducing List, your best friend

* iOS 14부터 Section의 Header Text는 대문자로 출력됨   
 여기서 original 텍스트로 보고 싶다면 끝에 **.textCase(nil)** 을 붙이면 original 텍스트를 볼 수 있음

```swift
List {
    Section(header: Text("Section 1")) {
        ...
    }
    .textCase(nil)
```
* List는 UIKit의 UITableView와 같음
* 주로 List보다는 Form을 더 많이 쓰게 됨
* List는 특별한 타입에서 예외적으로 쓰임

* 지금 프로젝트에서는 List를 써볼 예정




## Loading resources from your app buncle
* URL이 일반 웹주소 저장보다 강력함
* URL은 파일 위치까지 저장 가능함


## Working with stirngs
* iOS는 문자열을 다루는 강력한 API제공
* 문자열을 분리, 공백 제거, 스펠링을 체크하기도 함   
* Components(separatedBy: ) 는 싱글 문자열로 분리 해줌   
"a b c" --> ["a", "b", "c"]
* trimmingCharacters(in: )는 모든 기능을 하나의 메소드에서 제공함   
공간, 텝, 라인 바꾸기 등







