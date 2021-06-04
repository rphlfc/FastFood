//
//  ContentView.swift
//  FastFood
//
//  Created by Raphael Cerqueira on 03/06/21.
//

import SwiftUI

struct ContentView: View {
    var padding: CGFloat = 45
    var spacing: CGFloat = 25
    var screenWidth = UIScreen.main.bounds.width - 90 // 2 * padding
    
    @State var xOffset: CGFloat = 0
    @State var currentPage = 0
    
    var body: some View {
        ZStack {
            data[currentPage].color
                .animation(.easeIn)
                .ignoresSafeArea()
            
            GeometryReader { reader in
                HStack(spacing: spacing) {
                    ForEach(0 ..< 5) { i in
                        CardView(item: data[i])
                            .frame(width: screenWidth)
                            .animation(.default)
                            .offset(y: i == currentPage ? 0 : 40)
                            .ignoresSafeArea(.all, edges: .bottom)
                    }
                }
                .offset(x: xOffset)
                .padding(.horizontal, padding)
            }
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        onChanged(value: value)
                    })
                    .onEnded({ value in
                        onEnded(value: value)
                    })
            )
            .padding(.bottom, -60)
            
            VStack {
                HStack {
                    Text("ASAP")
                    
                    Image(systemName: "arrow.right")
                    
                    Text("Work")
                }
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(Capsule().strokeBorder(Color.white, lineWidth: 1))
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Order from here")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 280, height: 60)
                        .background(Capsule().fill(Color.black))
                })
            }
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        xOffset = value.translation.width - (screenWidth * CGFloat(currentPage)) - (spacing * CGFloat(currentPage))
    }
    
    func onEnded(value: DragGesture.Value) {
        if -value.translation.width > screenWidth / 2 && currentPage < data.count - 1 {
            currentPage += 1
        } else {
            if value.translation.width > screenWidth / 2 && currentPage > 0 {
                currentPage -= 1
            }
        }
        
        withAnimation {
            xOffset = -screenWidth * CGFloat(currentPage) - (spacing * CGFloat(currentPage))
        }
    }
}

struct CardView: View {
    var item: Item
    
    var body: some View {
        VStack {
            Spacer(minLength: 100)
            
            Image(item.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            
            Spacer(minLength: 80)
            
            VStack(spacing: 15) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
                    .padding(.vertical, 60)
                    .padding(.horizontal, 30)
                    .background(item.color)
                    .cornerRadius(20)
                
                Text("McDonalds")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(Color(#colorLiteral(red: 0.9463307261, green: 0.5541427135, blue: 0.110545136, alpha: 1)))
                        
                        Text("4.8")
                    }
                    
                    Text("•")
                        .foregroundColor(.gray)
                    
                    Text(item.meal)
                    
                    Text("•")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 2) {
                        Text("$")
                        
                        Text("$")
                        
                        Text("$")
                            .foregroundColor(.gray)
                    }
                    
                }
                
                Text("10 - 15 min")
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Capsule().fill(Color.gray.opacity(0.3)))
                
                Spacer()
            }
            .padding(25)
            .background(Color.white)
            .cornerRadius(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
