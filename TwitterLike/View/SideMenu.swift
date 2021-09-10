
//
//  SideMenu.swift
//  SideMenu
//
//  Created by jyrnan on 2021/9/10.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 14) {
                
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("iJustine")
                    .font(.title2).bold()
                
                Text("@iJustine")
                    .font(.callout)
                
                HStack(spacing: 12){
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Following")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 45) {
                        
                        //Tab Buttons....
                        TabButton(title: "Profile", image: "person")
                        
                        TabButton(title: "List", image: "list.bullet.rectangle.portrait")
                        
                        TabButton(title: "Topics", image: "message")
                        
                        TabButton(title: "Bookmarks", image: "bookmark")
                        
                        TabButton(title: "Moments", image: "bolt")
                        
                        TabButton(title: "Purchases", image: "cart")
                        
                        TabButton(title: "Monetization", image: "creditcard")
                        
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 45)
                    
                    Divider()
                    
                    TabButton(title: "Twitter Ads", image: "square.and.pencil" )
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        Button("Setting And Privacy"){
                            
                        }
                        
                        Button("Help Center"){
                            
                        }
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    
                }
            }
            
            VStack(spacing: 0){
                
                Divider()
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "lightbulb")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit )
                            .frame(width: 22, height: 22)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "qrcode")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit )
                            .frame(width: 22, height: 22)
                    }
                }
                .padding([.horizontal, .top], 15)
                .foregroundColor(.primary)
                
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity,alignment: .leading)
        //Max Width...
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        
        //For Navigation...
        //Simple replace button with Navigation links...
        
        NavigationLink {
            
            Text("\(title) View")
                .navigationTitle(title)
            
        } label: {
            HStack(spacing: 13) {
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extension view to get Screen Rect...
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
