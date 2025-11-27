//
//  generics .swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 23/11/25.
//

import SwiftUI

struct swapper{
    var a : Int
    var b : Int
    func swap<T>(a : inout T,b:inout T){
        let tem = a
        a = b
        b = tem
    }
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}




