import Cocoa

var value = 5
let workItem = DispatchWorkItem{
    value += 6
}

//fungsi ini akan melakukan eksekusi secara sinkron tugas yang ada di dalam DispatchWorkItem.
workItem.perform()

let queue = DispatchQueue(label: "me.aliffarisqi.dispatchworkitem", qos: .utility)
queue.async(execute: workItem)

workItem.notify(queue: DispatchQueue.main){
    print("Inal value \(value)")
}
