import SwiftUI

struct BlueView: View {
    @StateObject private var config = Config()
    
    let string: String
    
    init(string: String) {
        self.string = string
    }
    
    var body: some View {
        let _ = print("BlueView", #function)
        
        Color.blue
            .overlay {
                VStack {
                    Text(config.string)
                    
                    Text(config.uuid.uuidString)
                }
            }
            .onAppear {
                config.string = string
            }
    }
}

extension BlueView {
    final class Config: ObservableObject {
        @Published var string: String = ""
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
