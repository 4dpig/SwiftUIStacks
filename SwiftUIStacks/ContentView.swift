//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by siweiZhu on 2021/1/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            
            HStack(spacing: 10) {
                PricingView(
                    title: "Basic",
                    price: 9.99,
                    textColor: Color.white,
                    backgroundColor: Color.purple
                )

                ZStack {
                    PricingView(
                        title: "Pro",
                        price: 19.99,
                        textColor: Color.black,
                        backgroundColor: Color(
                            red: 240/255,
                            green: 240/255,
                            blue: 240/255
                        )
                    )
                    
                    PlanLabelView(text: "Best for designer", offsetY: 90)
                }
            }
            .padding(.horizontal)

            ZStack {
                PricingView(
                    icon: PlanIcon(
                        iconName: "wand.and.rays",
                        iconColor: Color.white
                    ),
                    title: "Team",
                    price: 299,
                    textColor: Color.white,
                    backgroundColor: Color.black
                )
                
                PlanLabelView(text: "Best for teams with 20 members", offsetY: 107.75)
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct PlanIcon {
    var iconName: String
    var iconColor: Color
}

struct PricingView: View {
    
    var icon: PlanIcon?
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
            if let icon = icon {
                Image(systemName: icon.iconName)
                    .font(.largeTitle)
                    .foregroundColor(icon.iconColor)
            }
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
