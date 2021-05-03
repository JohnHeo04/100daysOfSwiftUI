## Day 28
### Challenge
 
1. Replace each ***' VStack '*** in our form with a ***' Section '***, Where the text view is the title of the section.   
Do you prefer this layout or the ***' VStack '*** layout? It's your app - choose!   
2. Replace the "Number of cups" stepper with a ***' Picker '*** showing the same range of values.   
3. Change the user interface so that it always shows their recommended bedtime using a nice and large font.   
You should be able to remove the "Calculate" button entirely.



***
### VStack -> Section
```swift
VStack(alignment: .leading, spacing: 0) {
    Text("Desired amount of sleep")
        .font(.headline)
        
    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
    Text("\(sleepAmount, specifier: "%g") hours")
```   
challenge   
```swift
Section(header: Text("Desired amount of sleep")
      .font(.headline)) {
    Stepper(value: $sleepAmount, specifier: "%g") hours")}
}
```

### 


<img src = "https://user-images.githubusercontent.com/47841046/116841621-b15e4200-ac14-11eb-8267-4ba0c8d1c187.png"></img>
