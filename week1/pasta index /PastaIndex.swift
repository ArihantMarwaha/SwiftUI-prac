import SwiftUI

struct PastaIndex: View {
    
    @State private var selectedDish: String? = nil
    @State private var displayedText: String = ""
    @State private var typingTimer: Timer? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Dishes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontWidth(.expanded)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top,50)
                
        ScrollView(.horizontal) {
            HStack {
                
                VStack {
                    Image("wuton")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .onTapGesture {
                            startTyping("Wuton – Delicious dumplings with savory filling.")
                        }
                    
                    Text("Wuton (10 min)")
                        .fontWidth(.expanded)
                        .fontWeight(.bold)
                }
                
                VStack {
                    Image("ramen")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .onTapGesture {
                            startTyping("Ramen – Classic Japanese noodle soup.")
                        }
                    
                    Text("Ramen (20 min)")
                        .fontWidth(.expanded)
                        .fontWeight(.bold)
                }
                
                VStack {
                    Image("flower")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .onTapGesture {
                            startTyping("Flower Dish – Aesthetic and fresh.")
                        }
                    
                    Text("Flower (20 min)")
                        .fontWidth(.expanded)
                        .fontWeight(.bold)
                }
            }
            .padding(.leading)
        }
        
        if !displayedText.isEmpty {
            Text(displayedText)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        Spacer()
    }
    
    private func startTyping(_ text: String) {
        typingTimer?.invalidate()
        displayedText = ""
        selectedDish = text
        var index = 0
        typingTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if index < text.count {
                let char = text[text.index(text.startIndex, offsetBy: index)]
                displayedText.append(char)
                index += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    PastaIndex()
}
