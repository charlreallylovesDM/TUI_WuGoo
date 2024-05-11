//
//  WelcomeView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/30/24.
//

import SwiftUI

struct WelcomeView: View 
{
    
    @ObservedObject var viewRouter = ViewRouter.shared
    var body: some View
    {
        ZStack {
            Image("Welcome_Page")
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                Spacer()
                HStack
                {
                    Button(action: {viewRouter.currentView = .KitchenFarmView
                        debugPrint(viewRouter.currentView)}, label: {
                        Image("StartButton")
                            .resizable()
                            .frame(width:120,height:50)
                        
                    })
                    .frame(width:120, height:50)
                    .cornerRadius(25)
                    
                    
                }
                Spacer()
                
            }
        }
        
    }
}

#Preview {
    WelcomeView()
}
