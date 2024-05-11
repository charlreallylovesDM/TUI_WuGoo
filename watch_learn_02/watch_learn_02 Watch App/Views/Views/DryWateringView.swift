//
//  DryWateringView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 4/3/24.
//

import SwiftUI



struct DryWateringView: View {
    
    @ObservedObject var viewRouter = ViewRouter.shared
    //@ObservedObject var sensorLogger = SensorLogManager()
    @State var finishWatering = true
    @State var progress = 0.2
    
    @ObservedObject var timer = TimerDemo()   // 有一个对象（该类：TimerDemo）
    
    func UpdateProgress(Param:Double)
    {
        progress = Param
    }
    
    var body: some View {
        
        ZStack
        {
            Image("FarmDryWatering")
                .resizable()
                .ignoresSafeArea()
            VStack
            {
                Button(action: {viewRouter.currentView = .DryLandView}, label: {
                   Image("FarmButtonBack")
                        .resizable()
                        .frame(width:40,height:40)
                })
                .frame(width:40,height:40)
                .cornerRadius(10.0)
                .ignoresSafeArea()
                .position(CGPoint(x: 40.0, y: 10.0))
               
                
                Button(action: {sensorLogger.startUpdate(50.0); timer.startTimer(timeInterval: 1.0,loopCount: -1)}, label: {
                    Text("开始浇水")
                    
                }).frame(width:150,height:50)
                
                if(finishWatering)
                {
                    Button(action: {sensorLogger.stopUpdate();timer.stopTimer()}, label: {
                        Text("停止")
                    }).frame(width:150,height:50)
                }
                Text(timer.strAccX)
                    .bold()
                    
                ProgressView(value: timer.progressValue)
            }
        }
        
    }
    
    
    
//    func TimeClip(timer: Timer) -> Timer
//    {
//        return Timer.scheduledTimer(timeInterval: 1.0 / 50.0,
//                           target: self,
//                                    selector: #selector(self.OnTimer), //每1毫秒调用一次，定时中断响应函数。
//                           userInfo: nil,
//                           repeats: true)
//    }
    
   
    
}



class TimerDemo:ObservableObject  {
    private var loopNum = 0
    private var loopedNum = 0
    @Published public var progressValue = 0.0
    //static: 只有一个。定义的时候就有instance了。
    //static let share = TimerDemo()   // 有一个对象（该类：TimerDemo）
    private var timer: Timer?         // 定义一个Timer
    
    
    //public
    @Published public var strAccX:String = "0%"
    

    //实现循环定时中断
    //使用 Timer(timeInterval:repeats:block:) 初始化对象，
    //并将其添加到 main 线程的 RunLoop 中，多次循环
    //循环 不断使用传感器数据
    
    func startTimer(timeInterval:Double, loopCount:Int)
    //Accelerometer //开启定时中断
    //timeInterval: 定时中断间隔时间
    //loopCount: <0 = 无穷次循环；0 和 1 = 单次；>1 = 具体次数
    {
        loopNum = loopCount
        
        //开启定时中断
        let bRepeat:Bool = (loopCount<0 || loopCount>1)
        timer = Timer(timeInterval: timeInterval, repeats: bRepeat, block: {
            timer in self.loopTimerHandler(timer)
        })
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    
    
    //定时中断响应函数（Handler）
    @objc private func loopTimerHandler(_ timer: Timer?) -> Void {
        
        
        progressValue += Double(arc4random())*0.0000000001
        if(progressValue>1)
        {
            progressValue = 1
        }
        var intV:Int = Int(100*(progressValue)+0.5)
        strAccX = String(intV) + "%"
        debugPrint(strAccX)
        
        if(intV >= 100)
        {
            timer?.invalidate()
            //达到100%，终止timer。
            
            //如果需要跳转，写到这里
        }
        
        
        if(loopNum>1) //指定循环多少次
        {
            loopedNum+=1
            if(loopedNum >= loopNum)
            {
                timer?.invalidate()
                //达到循环次数，终止timer。
            }
            
        }
        
        //!!! 该函数是类ObservableObject的成员函数，用于刷新使用该类的view。
        //如果不能自动刷新，就调用这个函数。
        //objectWillChange.send()
        
    
        
    }
    
    func stopTimer()
    {
        timer?.invalidate()
    }
}


// 测试
//TimerDemo.share.oneshot1()
//TimerDemo.share.showWateringProgress_Acc()


#Preview {
    DryWateringView()
}
