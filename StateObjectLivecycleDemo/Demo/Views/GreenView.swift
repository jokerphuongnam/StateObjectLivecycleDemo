import SwiftUI

struct GreenView: View {
    @StateObject private var config: Config
    
    init(config: GreenView.Config) {
        self._config = .init(wrappedValue: config)
    }
    
    var body: some View {
        let _ = print("GreenView", #function)
        
        Color.green
            .overlay {
                VStack {
                    Text(config.string)
                    
                    Text(config.uuid.uuidString)
                }
            }
    }
}

extension GreenView {
    final class Config: ObservableObject {
        @Published var string: String = ""
        let uuid: UUID
        
        init(string: String) {
            self.uuid = UUID()
            print(uuid.uuidString, String(describing: self.self), #function)
            self.string = string
        }
        
        deinit {
            print(String(describing: self.self), #function)
        }
    }
}
