//
//  shoppingcart.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 22/09/25.
//

import SwiftUI
internal import Combine

struct ShoppingItems: Identifiable{
    var id: UUID = UUID()
    var item: String
}

class carts : ObservableObject {
    @Published var cart : [ShoppingItems] = []
    
    func addtoCart(_ product : ShoppingItems){
        cart.append(product)
    }
    
    func clearcart(){
        cart.removeAll()
    }
}

struct checkoutView : View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var cart : carts
    
    var body: some View {
        HStack{
            Text("Thank you for your purchase")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontWidth(.expanded)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Close"){
                    cart.clearcart()
                    dismiss()
                }
                .buttonStyle(.glassProminent)
                .background(Color.green)
            }
        }
    }
}

struct cartView : View {
    
    @ObservedObject var carty : carts
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
      
        VStack{
            if carty.cart.isEmpty{
                Text("The Cart is empty please fill it with something")
                    .font(.largeTitle)
                    .bold()
                
                Button("Add items"){
                    dismiss()
                }
                .buttonStyle(.glassProminent)
            }
            else{
                
                VStack{
                    List(carty.cart){ product in
                        Text(product.item)
                    }
                    
                    NavigationLink("Proceed to checkout"){
                        checkoutView(cart: carty)
                    }
                    .navigationTitle("Cart")
                }
                
            }
        }
        
    }
}


struct shoppingcart: View {
    
    @StateObject var cartitem = carts()
    
    let prod : [ShoppingItems] = [
        
        ShoppingItems(item: "Apple"),
        ShoppingItems(item: "Mango"),
        ShoppingItems(item: "Banana"),
        ShoppingItems(item: "Watermelon"),
        ShoppingItems(item: "Pyaz")
        
    ]
    
    var body: some View {
        
        NavigationStack{
            List(prod){ Product in
                HStack{
                    Text(Product.item)
                    Spacer()
                    Button("Add"){
                        cartitem.addtoCart(Product)
                    }
                    .buttonStyle(.glassProminent)
                }
            }
            .navigationTitle("Products")
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    NavigationLink("Cart"){
                        cartView(carty: cartitem)
                    }
                }
            }
        }

            
            
        
        
    }
}

#Preview {
    shoppingcart()
}
