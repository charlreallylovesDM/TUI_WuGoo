//
//  KitchenView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/29/24.
//

import SwiftUI

struct KitchenView: View {
    
    @ObservedObject var viewRouter = ViewRouter.shared
    var body: some View {
        
        ZStack {
            Image("KitchenTemp")
                .resizable()
            .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                Button(action: {viewRouter.currentView = .KitchenFarmView}, label: {
                    Text("Go Back")
                })
            }
        }
        
    }
}

#Preview {
    KitchenView()
}
