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
        
        if let path = Bundle.main.path(forResource: "products_100", ofType: "json"){
            print(path)
            print(URL(fileURLWithPath: path))
            print()
        }
        
        do {
            let (data,response) = try await URLSession.shared.data(from: url)//calling the session
            
            //validate a response from a URL 
            guard let goal = response as? HTTPURLResponse,goal.statusCode == 200 else{
                return print("There was no valid response from the link")
            }
            let decodedData = try JSONDecoder().decode([Post].self,from: data)
            posty = decodedData
        }
        catch{
            print("Error fetching the data: ")
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
