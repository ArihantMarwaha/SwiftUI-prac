//
//  NetworkingBasics.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 06/10/25.
//

import SwiftUI


struct Post: Codable, Identifiable,Hashable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}



@Observable
class posters {
    var posty : [Post] = []
    
    func fetchpost() async {
        
        //storing the URL
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts") else{return}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)//calling the session
            let decodedData = try JSONDecoder().decode([Post].self,from: data)
            posty = decodedData
            print("\(posty)")
        }
        catch{
            print("Error fetching the data")
        }
    }
    
}

struct NetworkingBasics: View {
    @State var data = posters()
    var body: some View {
        
        NavigationStack{
            List(data.posty,id: \.self){datas in
                VStack{
                    Text(datas.title)
                    Spacer()
                    Text(datas.body)
                }
                
            }
            .navigationTitle("Posts")
            .task {
                await data.fetchpost()
            }
        }

            


    }
}

#Preview {
    NetworkingBasics()
}
