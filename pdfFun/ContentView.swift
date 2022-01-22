//
//  ContentView.swift
//  pdfFun
//
//  Created by Dan Payne on 1/21/22.
//
import PDFKit
import SwiftUI


struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL

    init(_ url: URL) {
        self.url = url
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}




struct PDFKitView: View {
    var url: URL

    var body: some View {
        PDFKitRepresentedView(url)
    }
}





struct ContentView: View {
    let documentURL = Bundle.main.url(forResource: "appguide", withExtension: "pdf")!
    var body: some View {
        VStack(alignment: .leading) {
            Text("PSPDFKit SwiftUI")
                .font(.largeTitle)
            HStack(alignment: .top) {
                Text("Made with ❤ at WWDC19")
                    .font(.title)
            }
            PDFKitView(url: documentURL)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
