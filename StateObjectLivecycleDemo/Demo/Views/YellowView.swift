import SwiftUI
import Observation

struct YellowView: View {
    @StateObject private var config: Config = .init()
    private let string: String
    
    init(string: String) {
        self.string = string
    }
    
    var body: some View {
        let _ = print("YellowView", #function)
        
        Color.yellow
            .overlay {
                VStack {
                    Text(config.string)
                    
                    Text(config.uuid.uuidString)
                    
                    Button {
                        config.string = .randValue
                    } label: {
                        Text("Random")
                    }
                }
            }
            .onAppear {
                config.string = self.string
            }
    }
}

extension YellowView {
    @Observable
    final class Config: ObservableObject {
        var string: String = ""
        let uuid: UUID
        
        init() {
            self.uuid = UUID()
            print(uuid.uuidString, String(describing: self.self), #function)
        }
        
        deinit {
            print(String(describing: self.self), #function)
        }
    }
}
