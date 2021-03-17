import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var textThing: WKInterfaceTextField!
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction func pressMe() {
        
        guard WCSession.default.isReachable else {
            print("not reachable")
            return }
        
        print("sent message")
        // 3
        WCSession.default.sendMessage(
            ["messageKey": "hello"],
            replyHandler: { reply in
                print(reply)
                let something = reply["response"] as? String
                self.textThing.setText(something)
            },
            errorHandler: { e in
                print("Error sending the message: \(e.localizedDescription)")
            })
        
    }
    
}
