//
//  KitchenFarmView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/29/24.
//

import SwiftUI

struct KitchenFarmView: View 
{
    
    @State private var showKitchenView = false
    @State private var showFarmView = false
    @ObservedObject var viewRouter = ViewRouter.shared
    var body: some View {
        
        ZStack 
        {
            Image("Kitchen_Farm")
                .resizable()
            .ignoresSafeArea()
            
            VStack
            {
                Button(action: {viewRouter.currentView = .FarmView}, label: {
                    Image("FarmButton")
                        .resizable()
                        .frame(width:27,height:17)
                })
                .frame(width:28,height:18)
                .cornerRadius(3.0)
                .position(CGPoint(x: 80.0, y: 0.0))
                
                
                Button(action: {viewRouter.currentView = .KitchenView}, label: {
                    Image("KitchenButton")
                        .resizable()
                        .frame(width:27,height:17)
                })
                .frame(width:28,height:18)
                .cornerRadius(3.0)
                .position(CGPoint(x: 80.0, y: 26.0))
            }
        }
       
        
    }
}

#Preview {
    KitchenFarmView()
}
