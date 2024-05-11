//
//  ViewManager.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/30/24.
//

import SwiftUI

struct ViewManager:View {
    
        @ObservedObject var viewRouter = ViewRouter.shared
    
        var welcomeView:WelcomeView = WelcomeView()
        var kitchenFarmView:KitchenFarmView = KitchenFarmView()
        var kitchenView:KitchenView = KitchenView()
        var farmView:FarmView = FarmView()
        var dryLandView:DryLandView = DryLandView()
        var wetLandView:WetLandView = WetLandView()
        var dryLandRice0View:DryLandRice0View = DryLandRice0View()
        var dryWateringView:DryWateringView = DryWateringView()
        var toolSetupView0:ToolSetupView0 = ToolSetupView0()
        var toolSetupView1:ToolSetupView1 = ToolSetupView1()
        static var checkMode:Bool = false    // for Check mode
    
    
        var body: some View {
            switch viewRouter.currentView {
            case .WelcomeView:
                welcomeView
            case .KitchenFarmView:
                kitchenFarmView
            case .KitchenView:
                kitchenView
            case .FarmView:
                farmView
            case .DryLandView:
                dryLandView
            case .WetLandView:
                wetLandView
            case .DryLandRice0View:
                dryLandRice0View
            case .DryWateringView:
                dryWateringView
            case .ToolSetupView0:
                toolSetupView0
            case .ToolSetupView1:
                toolSetupView1
            }
    }

    
}

struct ViewManager_Previews: PreviewProvider {
    static var previews: some View {
        ViewManager()
    }
}
