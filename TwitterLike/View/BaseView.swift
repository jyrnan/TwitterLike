//
//  BaseView.swift
//  BaseView
//
//  Created by jyrnan on 2021/9/10.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu:Bool = false
    
    @State var currentTab = "house"
    
    // Hiding Native one...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    //Offset for Both Drag Guesture and showing Menu...
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    //Gesture offset...
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        //Whole Navigation View...
        NavigationView {
            
            HStack(spacing: 0) {
                
                //Side Menu...
                SideMenu(showMenu: $showMenu )
                
                //Main Tab View...
                VStack(spacing: 0) {
                    
                    TabView(selection: $currentTab){
                        
                        Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("magnifyingglass")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("bell")
                        
                        Text("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("envelope")
                    }
                    
                    //Custom Tab Bar...
                    VStack(spacing: 0) {
                        
                        Divider()
                        
                        HStack(spacing: 0) {
                            
                            //Tab Buttons...
                            TabButton(image: "house")
                            
                            TabButton(image: "magnifyingglass")
                            
                            TabButton(image: "bell")
                            
                            TabButton(image: "envelope")
                        }
                        .padding([.top], 15)
                    }
                }
                .frame(width: getRect().width)
                .overlay(
                    
                    Rectangle()
                        .fill(
                            
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation{
                                showMenu.toggle()
                            }
                        }
                )
            }
            //max Size...
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            //Gesture...
            .gesture(
                
                DragGesture()
                    .updating($gestureOffset, body: {value , out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value: ))
                
            )
            .animation(.easeOut, value: offset == 0)
            // No Nav bar tiltle
            // Hiding nav bar...
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .onChange(of: showMenu) {newValue in
            
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) {newValue in
            onChange()
        }
    }
    
    func onChange() {
        let sideBarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
        
    }
    
    func onEnd(value: DragGesture.Value) {
        
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            //Checking...
            if translation > 0 {
                
                if translation > (sideBarWidth / 2) {
                    //showing menu
                    offset = sideBarWidth
                    showMenu = true
                }
                else {
                    
                    //Extra cases...
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            }
            else {
                
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                }
                else{
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                    
                }
                
            }
        }
        
        //storing last offset...
        lastStoredOffset = offset
        
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        
        Button {
            withAnimation{currentTab = image}
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio( contentMode: .fit)
                .frame(width: 23, height: 23)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
