import Cocoa

func expensiveTask(data: String, completion:@escaping(String)->Void){
    let queue = DispatchQueue(label: "me.aliffarisqi.completionblock")
    
    queue.async{
        print("prosessing data: \(data)")
        sleep(4)
        completion("finish prosesing \(data)")
    }
}

let mainQueue = DispatchQueue(label: "com.dicoding.main", qos: .userInteractive)
mainQueue.async {
    // MARK: do something
    expensiveTask(data: "Get User"){result in
        print(result)
    }
    print("main queue running")
}
