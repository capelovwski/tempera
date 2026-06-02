import SwiftUI
import WebKit

// 1. Criamos um mini-navegador para o Xcode entender o HTML
struct LocalWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Procura pelo arquivo index.html dentro do projeto
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}

// 2. Exibimos o navegador na tela do celular
struct ContentView: View {
    var body: some View {
        LocalWebView()
            .edgesIgnoringSafeArea(.all) // Faz o HTML ocupar a tela inteira
    }
}

#Preview {
    ContentView()
}

