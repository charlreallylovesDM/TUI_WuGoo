//
//  FarmView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/29/24.
//

import SwiftUI

struct FarmView: View {
    @ObservedObject var viewRouter = ViewRouter.shared
    var body: some View {
        ZStack
        {
            Image("Farm_Dry_Wet")
                .resizable()
                .ignoresSafeArea()
            VStack
            {
                Button(action: {viewRouter.currentView = .WetLandView}, label: {
                    Text("水田")
                })
                .padding(20)
                .ignoresSafeArea()
                
                Button(action: {viewRouter.currentView = .KitchenFarmView}, label: {
                    Image("FarmButtonBack")
                        .resizable()
                        .frame(width:40,height:40)
                })
                .frame(width:40,height:40)
                .cornerRadius(10)
                
                Spacer()
                Button(action: {viewRouter.currentView = .DryLandView}, label: {
                    Text("旱地")
                        .bold(true)
                        .foregroundColor(.black)
                })
                .padding(20)
            }
        }
    }
}

#Preview {
    FarmView()
}
