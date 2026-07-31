import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://pelotxo.synology.me/barrioteca")!)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        config.defaultWebpagePreferences = prefs
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.contentInsetAdjustmentBehavior = .always
        
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // No updates needed
    }
}

#Preview {
    ContentView()
}