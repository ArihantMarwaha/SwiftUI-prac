//
//  foundationTestView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 26/09/25.
//

import FoundationModels
import Playgrounds
import Foundation



#Playground {
    
    let instructions = "your job is to create a structured itenary for the user. and. this making a ddetailed list of places to visit and why you should visit them. Include resturants and places to visit and  Always include a title , a little descrtiption and a day by day plan"
    
    let session = LanguageModelSession(instructions: instructions)
    
    let response = try await session.respond(to:"Generate a 3 day itenary for italy")
    
}


#Playground{
    
    let ses = SystemLanguageModel.default
    
    switch ses.availability {
    case .available:
        print("the model is available")
    default:
        print("The model is not responisive")
        
    }
    
}
