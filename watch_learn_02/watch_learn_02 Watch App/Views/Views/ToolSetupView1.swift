//
//  ToolSetupView1.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 4/3/24.
//

import SwiftUI

struct ToolSetupView1: View {
    @ObservedObject var viewRouter = ViewRouter.shared
    var body: some View {
        ZStack {
            Image("ToolSetup1")
                .resizable()
            .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                Button(action: {viewRouter.currentView = .DryWateringView}, label: {
                    Image("ToolSetupButton")
                        .resizable()
                        .frame(width:100,height:40)
                    
                })
                .frame(width:100,height:40)
                .cornerRadius(30.0)
                .ignoresSafeArea()
                .position(x:95,y:130)
            }
        }
    }
}

#Preview {
    ToolSetupView1()
}
