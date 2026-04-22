//
//  StateObject.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/04/26.
//

import SwiftUI
internal import Combine


//model
struct StatesModel: Identifiable, Hashable {
    var id : UUID = UUID()
    var value : Int
}

//View Model
class StatesViewModel : ObservableObject {
    
    @Published var addresses : [StatesModel] = []
    
    func addaddress() {
        addresses.append(StatesModel(value : addresses.count))
        print(addresses)
    }
    
    func increment(_ AddressItem : StatesModel) {
        if let index = addresses.firstIndex(of: AddressItem) {
            addresses[index].value += 1
        }
    }

}

struct StateObjectMacro: View {
    
    @StateObject var model = StatesViewModel()
    
    var body: some View {
        
        
        VStack{
            
            ForEach(model.addresses) { item in
                NavigationLink(value: item) {
                    Text("Address item: \(item.value)")
                }
            }
            .navigationDestination(for: StatesModel.self) { item in
                detailObserved(item: item, model: model)
            }
            
            Button{
                withAnimation{
                    model.addaddress()
                }
            }label: {
                Text("Add Address")
                    .font(.title)
                    .fontWidth(.expanded)
                    .padding(5)
            }
            .position(x:200,y:700)
            .buttonStyle(.glassProminent)
            
        }

        
        
    }
    
}


struct detailObserved : View {
    let item : StatesModel
    @ObservedObject var model : StatesViewModel
    var body: some View {
        Text("\(item.value)")
        Button("+") {
            model.increment(item)
        }
    }
}




#Preview {
    StateObjectMacro()
}
