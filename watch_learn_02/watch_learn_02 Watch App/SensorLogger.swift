//
//  SensorLogger.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 4/3/24.
//

import Foundation
import CoreMotion
import Combine

//var motionManager = CMMotionManager()
var sensorManager = SensorLogManager()



//class CMMotionManager : NSObject
//{
//    
//}


class NFCLogManager: NSObject, ObservableObject
{
    
    
}


class SensorLogManager: NSObject, ObservableObject
{
    var motionManager: CMMotionManager?
    
    @Published var accX = 0.0
    @Published var accY = 0.0
    @Published var accZ = 0.0
    @Published var gyrX = 0.0
    @Published var gyrY = 0.0
    @Published var gyrZ = 0.0
    
    private var samplingFrequency = 50.0
    
    var timer = Timer()
    
    override init() {
        super.init()
        self.motionManager = CMMotionManager()
    }
    
    
    //定时中断响应函数。被startUpdate调用。
    @objc private func startLogSensor() {
        
        if let data = motionManager?.accelerometerData {
            let x = data.acceleration.x
            let y = data.acceleration.y
            let z = data.acceleration.z
            
            self.accX = x
            self.accY = y
            self.accZ = z
        }
        else {
            self.accX = Double.nan
            self.accY = Double.nan
            self.accZ = Double.nan
        }
        

        if let data = motionManager?.deviceMotion {
            let x = data.rotationRate.x
            let y = data.rotationRate.y
            let z = data.rotationRate.z
            
            self.gyrX = x
            self.gyrY = y
            self.gyrZ = z
            
        }
        else {
            self.gyrX = Double.nan
            self.gyrY = Double.nan
            self.gyrZ = Double.nan
        }
        
        print("Watch: acc (\(self.accX), \(self.accY), \(self.accZ)), gyr (\(self.gyrX), \(self.gyrY), \(self.gyrZ))")
    }
    
    
    //通过设置定时中断，每1毫秒获得一次传感器数据。供其他程序调用。
    func startUpdate(_ freq: Double) {
        if motionManager!.isAccelerometerAvailable {
            motionManager?.startAccelerometerUpdates()
        }
        
//        if motionManager!.isGyroAvailable {
//            motionManager?.startGyroUpdates()
//        }
        
        // Gyroscopeの生データの代わりにDeviceMotionのrotationRateを取得する
        if motionManager!.isDeviceMotionAvailable {
            motionManager?.startDeviceMotionUpdates()
        }
        
        self.samplingFrequency = freq
        
        //定时中断
        self.timer = Timer.scheduledTimer(timeInterval: 1.0 / freq,
                           target: self,
                           selector: #selector(self.startLogSensor), //每1毫秒调用一次，定时中断响应函数。
                           userInfo: nil,
                           repeats: true)
    }
    
    //停止定时中断，传感器停止工作。供其他程序调用。
    func stopUpdate() {
        self.timer.invalidate() //定时中断停止。
        
        if motionManager!.isAccelerometerActive {
            motionManager?.stopAccelerometerUpdates()
        }
        
        if motionManager!.isGyroActive {
            motionManager?.stopGyroUpdates()
        }
        
    }
}


