import SwiftUI

struct RandomView: View {
    @State private var text: String
    @State private var blueSize: CGSize = .init(width: 200, height: 200)
    @State private var greenSize: CGSize = .init(width: 200, height: 200)
    
    private var randomSize: CGFloat {
        CGFloat((150...250).randomElement() ?? 200)
    }
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    text = .randValue
                } label: {
                    Text("Random text")
                }
                
                Button {
                    blueSize = .init(width: randomSize, height: randomSize)
                    greenSize = .init(width: randomSize, height: randomSize)
                } label: {
                    Text("Resize")
                }
            }
            
            Text(text)
            
            BlueView(string: text)
                .frame(width: blueSize.width, height: blueSize.height)
            
//            RedView(string: text)
//                .frame(width: 200, height: 200)
            
            GreenView(config: .init(string: text))
                .frame(width: greenSize.width, height: greenSize.height)
        }
    }
}
