import Cocoa

protocol TaskDelegate{
    func taxkFinished(result: String)
}

struct Task{
    var delegate: TaskDelegate?
    
    func expensiveTask(data: String){
        let queue = DispatchQueue(label: "me.aliffarisqi.delegation")
        
        queue.async {
            print("prosess \(data)")
            sleep(2)
            self.delegate?.taxkFinished(result: "Processing \(data) finished")
        }
    }
}

struct Main: TaskDelegate{
    
    func run(){
        let mainQueue = DispatchQueue(label: "me.aliffarisqi.delegation.main", qos: .userInteractive)
        
        mainQueue.async {
            var task = Task()
            task.delegate = self
            task.expensiveTask(data: "Get User")
            print("Main queue run")
        }
    }
    func taxkFinished(result: String) {
        print(result)
    }
}

let main = Main()
main.run()
