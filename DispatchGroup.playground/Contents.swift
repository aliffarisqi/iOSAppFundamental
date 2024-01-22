import Cocoa

func task1(dispatchGroup: DispatchGroup){
    let queue = DispatchQueue(label: "me.aliffarisqi.dispatchgroup.task1")
    queue.async {
        sleep(1)
        print("task 1 execute")
        dispatchGroup.leave()
    }
}

func task2(dispatchGroup: DispatchGroup){
    DispatchQueue.global().async{
        sleep(2)
        print("task 2 execute")
        dispatchGroup.leave()
    }
}

func task3(dispatchGroup: DispatchGroup){
    DispatchQueue.main.async{
        print("task 3 execute")
        dispatchGroup.leave()
    }
}

let dispatchGroup = DispatchGroup()
dispatchGroup.enter()
task1(dispatchGroup: dispatchGroup)

dispatchGroup.enter()
task2(dispatchGroup: dispatchGroup)

dispatchGroup.enter()
task3(dispatchGroup: dispatchGroup)

dispatchGroup.notify(queue: DispatchQueue.main) {
   print("All task finished")
}
