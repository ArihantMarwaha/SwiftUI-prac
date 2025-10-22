//
//  simpleSubscriber.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 22/10/25.
//

import Foundation
internal import Combine

let numbers = [1, 2, 3, 4, 5]
let publisher = numbers.publisher


//simple publisher
let subscriber = publisher
    .sink { value in
        print("Received:", value)
    }

//viewmodel using subscriber

class CounterViewModel: ObservableObject {
    @Published var count = 0
    var cancellables = Set<AnyCancellable>()

    init() {
        $count
            .sink { newValue in
                print("Count changed to:", newValue)
            }
            .store(in: &cancellables)
    }
}

//emmiting timers

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
let cancellable = timer
    .sink { time in
        print("Tick:", time)
    }


let publish = [2,3,5,2].publisher

//publisher
   // .map { $0 * 10 }
    //.filter { $0 > 20 }
      //.sink { print($0) }

//manual publishers



let subject = PassthroughSubject<String, Never>()

let canellable = subject
    .sink { print("Received:", $0) }

//subject.send("Hello")
//subject.send("World")

