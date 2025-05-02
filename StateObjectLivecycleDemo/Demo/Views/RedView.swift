import SwiftUI

struct RedView: View {
    @StateObject private var config = Config()
    
    init(string: String) {
        self.config.string = string
    }
    
    var body: some View {
        let _ = print("RedView", #function)
        
        Color.red
            .overlay {
                VStack {
                    Text(config.string)
                    
                    Text(config.uuid.uuidString)
                }
            }
    }
}

extension RedView {
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
