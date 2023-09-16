//import SwiftUI
import SwiftUI
import FirebaseCore
struct ContentView: View {
    @State private var isShowingSecondView = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Your App")
                    .font(.largeTitle)
                    .padding()
                
                Text("This is the main view.")
                    .font(.headline)
                    .padding()
                
                NavigationLink(
                    destination: SecondView(),
                    isActive: $isShowingSecondView,
                    label: {
                        Text("Go to Second View")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )
            }
            .navigationTitle("Home")
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
struct SecondView: View {
    var body: some View {
        Text("This is the second view.")
            .font(.largeTitle)
            .padding()
            .navigationTitle("Second View")
    }
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            // register app delegate for Firebase setup
              @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
            // create a new Firebase environment for this app
            
             
            ContentView()
        }
    }
}
