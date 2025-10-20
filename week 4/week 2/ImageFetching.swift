//
//  ImageFetching.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 20/10/25.
//

import Foundation
/*
 AsyncImage(url: URL(string: product.image)) { image in
     image.resizable()
 } placeholder: {
     ProgressView()
 }
 .frame(width: 80, height: 80)



 class ImageCacheManager {
     static let shared = ImageCacheManager()
     private init() {}

     private let cache = NSCache<NSString, UIImage>()

     func get(forKey key: String) -> UIImage? {
         cache.object(forKey: key as NSString)
     }

     func set(_ image: UIImage, forKey key: String) {
         cache.setObject(image, forKey: key as NSString)
     }
 }

 @MainActor
 class ImageLoader: ObservableObject {
     @Published var image: UIImage?
     @Published var isLoading = false

     func load(from urlString: String) async {
         if let cached = ImageCacheManager.shared.get(forKey: urlString) {
             image = cached
             return
         }

         guard let url = URL(string: urlString) else { return }
         isLoading = true

         do {
             let (data, _) = try await URLSession.shared.data(from: url)
             if let uiImage = UIImage(data: data) {
                 ImageCacheManager.shared.set(uiImage, forKey: urlString)
                 image = uiImage
             }
         } catch {
             print("Image load failed: \(error.localizedDescription)")
         }

         isLoading = false
     }
 }

 
 struct CachedImageView: View {
     @StateObject private var loader = ImageLoader()
     let url: String
     let width: CGFloat
     let height: CGFloat

     var body: some View {
         Group {
             if let image = loader.image {
                 Image(uiImage: image)
                     .resizable()
                     .scaledToFill()
             } else if loader.isLoading {
                 ProgressView()
             } else {
                 Image(systemName: "photo")
                     .resizable()
                     .scaledToFit()
                     .foregroundColor(.gray)
             }
         }
         .frame(width: width, height: height)
         .clipShape(RoundedRectangle(cornerRadius: 10))
         .task {
             await loader.load(from: url)
         }
     }
 }

 */

//useage : CachedImageView(url: product.image, width: 80, height: 80)

