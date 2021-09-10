//
//  BaseView.swift
//  BaseView
//
//  Created by jyrnan on 2021/9/10.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu:Bool = false
    var body: some View {
        //Whole Navigation View...
        NavigationView {
            
            HStack(spacing: 0) {
                
                //Side Menu...
                SideMenu(showMenu: $showMenu )
            }
            // No Nav bar tiltle
            // Hiding nav bar...
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
