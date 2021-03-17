//
//  AsyncImageView.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/17/21.
//

import SwiftUI

struct AsyncImageView<Placeholder: View>: View {

    @StateObject private var loader: ImageLoader

    private let placeholder: Placeholder
    private let image: (UIImage) -> Image

    init(url: URL,
         @ViewBuilder placeholder: () -> Placeholder,
         @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)) {

        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url,
                                                        cache: Environment(\.imageCache).wrappedValue))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        AsyncImageView(url: URL(string: "https://a.thumbs.redditmedia.com/BSgc0SbG5yNVUb0Hqqs_EJus_KTDcVuFD-LjhsEftM8.jpg")!,
                       placeholder: { Text("Loading ...") })
    }
}

