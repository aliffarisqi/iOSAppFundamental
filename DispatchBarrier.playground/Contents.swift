import Cocoa

class ThreadSafeArray{
    let isolation = DispatchQueue(label: "me.aliffarisqi.dispatchbarrier", attributes: .concurrent)
    private var _array : [Int] = []
    
    var array:[Int]{
        get{
            return isolation.sync {
                _array
            }
        }
        set{
            isolation.sync(flags: .barrier){
                self._array = newValue
            }
        }
    }
}
