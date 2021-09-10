//
//  Home.swift
//  Home
//
//  Created by jyrnan on 2021/9/10.
//

import SwiftUI

struct Home: View {
    @Binding var showMenu: Bool
    var body: some View {
        
        VStack{
            
            VStack(spacing: 0) {
                
                HStack{
                    
                    Button {
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("Pic")
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    //Navigation Link....
                    NavigationLink {
                        
                        Text("Timeline View")
                            .navigationTitle("Timeline")
                        
                    } label: {
                        
                        Image(systemName: "sparkles")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                Divider()
            }
            .overlay(
            
                Image(systemName: "puzzlepiece.fill")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
            )
            
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
