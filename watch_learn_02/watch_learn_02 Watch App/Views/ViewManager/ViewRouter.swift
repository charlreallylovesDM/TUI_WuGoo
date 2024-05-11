//
//  ViewRouter.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/30/24.
//


import Foundation

class ViewRouter: ObservableObject {
    private init(){}
    static let shared = ViewRouter()
    @Published var currentView: Views = .WelcomeView
}

enum Views {
    case WelcomeView
    case KitchenFarmView
    case KitchenView
    case FarmView
    case DryLandView
    case WetLandView
    case DryLandRice0View
    case DryWateringView
    case ToolSetupView0
    case ToolSetupView1
   
}
