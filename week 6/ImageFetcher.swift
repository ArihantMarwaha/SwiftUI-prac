//
//  ImageFetcher.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 23/11/25.
//

import SwiftUI


final class Imagemodel {
    func fetchImage(url : URL) async throws  {
        
        let data = try await URLSession.shared.data(from: url)
 
    //    view.displayImage(image)
    }
}

struct ImageFetcher: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ImageFetcher()
}
