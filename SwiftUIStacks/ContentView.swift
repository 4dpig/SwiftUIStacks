//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by siweiZhu on 2021/1/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            
            Text("Choose Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)

            Spacer()

            ZStack {
                PricingView(
                    icon: "leaf",
                    title: "Basic",
                    price: 9.99,
                    textColor: Color.white,
                    backgroundColor: Color.purple
                )

                PricingView(
                    icon: "flame",
                    title: "Pro",
                    price: 19.99,
                    textColor: Color.white,
                    backgroundColor: Color(
                        red: 255/255,
                        green: 183/255,
                        blue: 37/255
                    )
                )
                .scaleEffect(0.95)
                .offset(x: 0, y: -185)

                PricingView(
                    icon: "bolt",
                    title: "Team",
                    price: 299,
                    textColor: Color.white,
                    backgroundColor: Color(red: 62/255, green: 63/255, blue: 70/255)
                )
                .scaleEffect(0.9)
                .offset(x: 0, y: -360)

            }
        }
        .padding()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PricingView: View {
    
    var icon: String?
    var title: String
    var price: Double
    var textColor: Color
    var backgroundColor: Color
    
    private static let precision = 0.001
    
    func getFormattedPriceString() -> String {
        let priceRounded = round(price)
        if abs(price - priceRounded) < PricingView.precision {
            return "$\(Int(priceRounded))"
        }
        else {
            return String(format: "$%.2f", price)
        }
    }
    
    var body: some View {
        VStack {
            icon.map({
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            })
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(getFormattedPriceString())
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text("per month")
                .font(.system(.headline))
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct PlanLabelView: View {
    
    var text: String
    var offsetY: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(
                Color(red: 255/255, green: 183/255, blue: 37/255)
            )
            .offset(x: 0, y: offsetY)
    }
}
