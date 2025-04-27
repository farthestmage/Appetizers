//
//  remoteimage.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 19/04/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image : Image? = nil
    
    func load( fromURLString : String  ){
        NetworkManager.shared.downloadImage(fromURLString: fromURLString){
            uiImage in
            guard let uiImage else {
                return
            }
            DispatchQueue.main.async{
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct remoteImage :View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerremoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        remoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
