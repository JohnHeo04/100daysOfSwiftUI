### Day 23
***
#### Why does SwiftUI use structs for views?

만약 여러분께서 UIKit이나 AppKit 프레임워크를 써 본적이 있다면, structs보다 classes를 더 많이 사용한 걸 볼 수 있다.   
SwiftUI는 structs를 선호하지만...   
   
첫번째, 성능 요소에 대한 차이 : struts는 classes보다 간단하고 빠르다.   
  
UIKit에는 UIView라 불리는 클래스가 있다. 여기엔 많은 properties와 method들이 있다.   
배경색, 어떻게 위치 잡을지에 대한 제약, 안에 들어갈 콘텐츠 레이어 렌더링 등   
모든 UIView와 UIView subclass가 이렇게 작동한다.   
   
#### What is behind the main SwiftUI view?

