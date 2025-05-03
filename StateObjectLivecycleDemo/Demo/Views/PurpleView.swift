import SwiftUI
import Observation

struct PurpleView: View {
    private var config: Config
    
    init(config: Self.Config) {
        self.config = config
    }
    
    var body: some View {
        let _ = print("PurpleView", #function)
        
        Color.purple
            .overlay {
                VStack {
                    Text(config.string)
                    
                    Text(config.uuid.uuidString)
                }
            }
    }
}

extension PurpleView {
    @Observable
    final class Config {
        var string: String = ""
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
